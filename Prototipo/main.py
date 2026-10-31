import json
import re
from pathlib import Path

import psycopg #type: ignore
from ollama import Client #type: ignore


# ============================================================
# CONFIGURAÇÃO
# ============================================================

BASE_DIR = Path(__file__).resolve().parent

with open(BASE_DIR / "config.json", encoding="utf-8") as f:
  config = json.load(f)


# ============================================================
# CARREGAMENTO DO DDL
# ============================================================

projeto_path = BASE_DIR.parent / "Projeto.txt"

if not projeto_path.exists():
    print("Erro: Projeto.txt não encontrado.")
    raise SystemExit(1)

projeto = projeto_path.read_text(encoding="utf-8")

try:
    ddl = projeto.split("3. DDL COMPLETO", 1)[1]
    ddl = ddl.split("4. CONSULTAS", 1)[0]
    ddl = ddl.strip()
except IndexError:
    print("Erro: não foi possível encontrar as seções")
    print("'3. DDL COMPLETO' e '4. CONSULTAS' em Projeto.txt.")
    raise SystemExit(1)


# ============================================================
# CONEXÃO COM POSTGRESQL
# ============================================================

db = config["database"]

try:
    conn = psycopg.connect(
        host=db["host"],
        port=db["port"],
        dbname=db["dbname"],
        user=db["user"],
        password=db["password"]
    )
except Exception as e:
    print("Erro ao conectar ao PostgreSQL:")
    print(e)
    raise SystemExit(1)


# ============================================================
# CONEXÃO COM OLLAMA
# ============================================================

ollama_config = config["ollama"]

client = Client(
    host=ollama_config["host"]
)


# ============================================================
# FUNÇÃO PARA LIMPAR A RESPOSTA DO MODELO
# ============================================================

def limpar_sql(resposta):
    """
    Remove blocos Markdown e outros elementos que o modelo
    possa adicionar antes/depois da consulta SQL.
    """

    resposta = resposta.strip()

    # Remove blocos ```sql ... ```
    resposta = re.sub(r"```sql\s*", "", resposta, flags=re.IGNORECASE)
    resposta = re.sub(r"```\s*", "", resposta)

    # Remove possíveis tags de pensamento do Qwen
    resposta = re.sub(
        r"<think>.*?</think>",
        "",
        resposta,
        flags=re.DOTALL | re.IGNORECASE
    )

    resposta = resposta.strip()

    return resposta


# ============================================================
# GERAÇÃO DA CONSULTA SQL
# ============================================================

def gerar_sql(pergunta):
    prompt = f"""
Você é um especialista em PostgreSQL e deve gerar consultas SQL
para um banco de dados de um sistema de gestão de eventos e espaços.

Utilize EXCLUSIVAMENTE as tabelas, colunas e relacionamentos
presentes no DDL fornecido abaixo.

DDL DO BANCO:

{ddl}

PERGUNTA DO USUÁRIO:

{pergunta}

REGRAS:

1. Gere somente a consulta SQL.
2. Não escreva explicações.
3. Não utilize tabelas ou colunas que não existam no DDL.
4. Utilize sintaxe compatível com PostgreSQL.
5. Para perguntas de consulta, utilize SELECT.
6. Não utilize INSERT, UPDATE ou DELETE.
7. Não coloque a consulta dentro de blocos Markdown.
8. Caso seja necessário utilizar várias tabelas, faça os JOINs
   de acordo com os relacionamentos definidos no DDL.

Retorne apenas o SQL.
"""

    response = client.chat(
        model=ollama_config["model"],
        messages=[
            {
                "role": "user",
                "content": prompt
            }
        ]
    )

    resposta = response["message"]["content"]

    return limpar_sql(resposta)


# ============================================================
# EXECUÇÃO DA CONSULTA
# ============================================================

def executar_sql(sql):
    try:
        with conn.cursor() as cursor:

            cursor.execute(sql)

            # Verifica se a consulta retornou dados
            if cursor.description is None:
                print("\nA consulta não retornou dados.")
                return

            colunas = [desc.name for desc in cursor.description]
            resultados = cursor.fetchall()

            print("\nResultado:")
            print("-" * 80)

            if not resultados:
                print("Nenhum resultado encontrado.")
                return

            # Cabeçalho
            print(" | ".join(str(coluna) for coluna in colunas))
            print("-" * 80)

            # Dados
            for linha in resultados:
                print(" | ".join(str(valor) for valor in linha))

            print("-" * 80)

    except Exception as e:
        conn.rollback()

        print("\nErro ao executar a consulta SQL:")
        print(e)


# ============================================================
# PROGRAMA PRINCIPAL
# ============================================================

def main():

    print("=" * 80)
    print(" SISTEMA DE GESTÃO DE EVENTOS E ESPAÇOS")
    print("=" * 80)

    print("\nBanco de dados conectado.")
    print(f"Modelo Ollama: {ollama_config['model']}")

    print()
    print("=" * 80)
    print("CONSULTA 1")
    print("=" * 80)
    executar_sql("""SELECT 
            a.titulo AS nome_atividade,
            ar.id_recurso,
            r.nome AS nome_recurso,
            ar.quantidade
        FROM 
            atividade a
        JOIN 
            atividade_recurso ar ON a.id_atividade = ar.id_atividade
        JOIN 
            recurso r ON ar.id_recurso = r.id_recurso;""")

    print()
    print("=" * 80)
    print("CONSULTA 2")
    print("=" * 80)
    executar_sql("""SELECT p.nome, e.nome AS evento
            FROM pessoa p
            JOIN evento_pessoa ep ON p.id_pessoa = ep.id_pessoa
            JOIN evento e ON ep.id_evento = e.id_evento
            WHERE e.status = 'ABERTO';""")

    print()
    print("=" * 80)
    print("CONSULTA 3")
    print("=" * 80)
    executar_sql("""SELECT p.nome, e.nome 
                FROM evento_pessoa_responsavel epr 
                JOIN pessoa p ON epr.id_pessoa = p.id_pessoa 
                JOIN evento e ON epr.id_evento = e.id_evento;""")

    print()
    print("=" * 80)
    print("CONSULTA 4")
    print("=" * 80)
    executar_sql("""SELECT p.nome AS nome_pessoa, e.nome AS nome_evento, COUNT(a.id_atividade) AS quantidade_atividades
                FROM pessoa p
                JOIN inscricao_evento ie ON p.id_pessoa = ie.id_pessoa
                JOIN evento e ON ie.id_evento = e.id_evento
                JOIN atividade a ON e.id_evento = a.id_evento
                WHERE ie.status = 'LISTA_ESPERA'
                GROUP BY p.nome, e.nome
                HAVING COUNT(a.id_atividade) > 2;""")

    print()
    print("=" * 80)
    print("CONSULTA 5")
    print("=" * 80)
    executar_sql("""SELECT 
                    s.id_sessao,
                    s.limite_vagas,
                    COUNT(i.id_pessoa) AS inscritos
                FROM 
                    sessao s
                LEFT JOIN 
                    inscricao_sessao i ON s.id_sessao = i.id_sessao AND i.status = 'CONFIRMADA'
                WHERE 
                    s.limite_vagas IS NOT NULL
                GROUP BY 
                    s.id_sessao, s.limite_vagas;""")

    while True:

        print("\nDigite sua pergunta sobre o banco de dados.")
        print("Digite 'sair' para encerrar.")

        pergunta = input("\nPergunta: ").strip()

        if pergunta.lower() == "sair":
            break

        if not pergunta:
            print("Digite uma pergunta válida.")
            continue

        print("\nGerando consulta SQL...")

        try:
            sql = gerar_sql(pergunta)

            print("\nSQL gerado:")
            print("-" * 80)
            print(sql)
            print("-" * 80)

            executar_sql(sql)

        except Exception as e:
            print("\nErro ao utilizar o Ollama:")
            print(e)

    conn.close()

    print("\nPrograma encerrado.")


# ============================================================
# INÍCIO
# ============================================================

if __name__ == "__main__":
    main()