# 📅 Sistema de Gestão de Eventos e Espaços

Projeto desenvolvido para a disciplina **SCC0640 – Bases de Dados**, com o objetivo de desenvolver um sistema de banco de dados para o **gerenciamento de eventos, atividades, sessões e espaços** utilizados para sua realização.

O sistema permite representar eventos, seus responsáveis, participantes, atividades oferecidas, sessões realizadas em diferentes horários e espaços, além dos recursos disponíveis e das inscrições dos participantes. A implementação utiliza **PostgreSQL** como SGBD e conta com um protótipo em **Python** integrado ao **Ollama**, permitindo a realização de consultas ao banco de dados a partir de perguntas em linguagem natural.

O projeto foi desenvolvido de acordo com os requisitos definidos no enunciado da disciplina, contemplando modelagem do banco de dados, implementação do modelo relacional, criação do DDL e DML, consultas SQL, regras de integridade e desenvolvimento de um protótipo de acesso ao banco.

## 👥 Integrantes

| Integrante                     | Número USP | GitHub                                             |
| ------------------------------ | ---------- | -------------------------------------------------- |
| Caio Cesar Trentin de Assis    | 15674233   |[@EduardoAPaiva](https://github.com/EduardoAPaiva)  |
| Eduardo Alves Paiva            | 15448481   |[@CaioCesar](https://github.com/CaioCesarTA)        |
| João Pedro Biazus Fagá         | 15483280   |[@JoaoPedroFaga](https://github.com/JoaoPedroFaga)  |
| Mariana do Nascimento Ferreira | 15582241   |[@MarianaFerreira](https://github.com/MariNFerreira) |

## 🎯 Objetivos

O projeto tem como principais objetivos:

* Modelar um sistema de gestão de eventos utilizando o modelo Entidade-Relacionamento;
* Realizar o mapeamento para o modelo relacional;
* Implementar o banco de dados utilizando PostgreSQL;
* Aplicar restrições de integridade e regras de negócio;
* Utilizar chaves primárias e estrangeiras;
* Implementar `CHECK`, `UNIQUE`, `NOT NULL` e `DEFAULT`;
* Utilizar ações `ON DELETE` e `ON UPDATE`;
* Implementar funções e triggers;
* Criar dados para teste e demonstração;
* Desenvolver consultas SQL de diferentes níveis de complexidade;
* Desenvolver uma aplicação em linha de comando utilizando Python;
* Integrar o protótipo a um modelo de linguagem executado localmente pelo Ollama.

Esses objetivos estão alinhados ao enunciado da disciplina, que estabelece a necessidade de modelagem, implementação do banco, consultas SQL, triggers e uma aplicação para acesso aos dados.

---

## 🏗️ Descrição do Sistema

O sistema foi desenvolvido para representar a organização e realização de eventos, como congressos, semanas acadêmicas, feiras, simpósios e eventos de treinamento.

Um **evento** possui um período de realização e pode ser promovido por pessoas ou organizações. Cada evento pode possuir diversas **atividades**, como palestras, workshops, minicursos, painéis e apresentações.

Uma atividade pode possuir uma ou mais **sessões**. Cada sessão representa uma realização concreta da atividade, possuindo:

* data e horário de início;
* data e horário de término;
* espaço onde será realizada;
* indicação de necessidade de inscrição;
* limite de vagas.

O banco também permite representar os **espaços** disponíveis para realização das sessões e os **recursos** existentes nesses espaços, como equipamentos e outros recursos necessários para determinadas atividades.

Além disso, o sistema registra as inscrições dos participantes nos eventos e, quando necessário, as inscrições específicas nas sessões.

A estrutura implementada utiliza timestamps para representar o início e o fim das sessões, permitindo registrar simultaneamente a data e o horário de cada realização.

---

## 🗃️ Estrutura do Banco de Dados

Entre as principais entidades e relacionamentos implementados estão:

* **Pessoa** — representa pessoas envolvidas no sistema;
* **Organização** — representa organizações responsáveis por eventos;
* **Evento** — representa o evento propriamente dito;
* **Espaço** — representa o local onde uma sessão pode ocorrer;
* **Recurso** — representa recursos disponíveis nos espaços;
* **Atividade** — representa uma atividade oferecida durante um evento;
* **Sessão** — representa uma realização concreta de uma atividade;
* **Inscrição em Evento** — registra a participação de uma pessoa em um evento;
* **Inscrição em Sessão** — registra inscrições específicas em sessões;
* **Papéis em Eventos e Atividades** — permite representar diferentes formas de participação das pessoas.

O modelo também contempla relacionamentos entre espaços e recursos e entre atividades e recursos necessários.

### Sessões

Uma das decisões importantes do projeto foi separar **atividade** de **sessão**.

Por exemplo:

> **Atividade:** Workshop de PostgreSQL
> **Sessão 1:** 10/05, das 9h às 12h, Sala A
> **Sessão 2:** 10/05, das 14h às 17h, Sala B

Dessa forma, a atividade representa o conteúdo oferecido, enquanto a sessão representa uma ocorrência específica dessa atividade.

No banco, `data_inicio` e `data_fim` da sessão são armazenados como `TIMESTAMP`, enquanto o espaço é associado diretamente à sessão.

---

## 🔐 Integridade e Regras do Banco

O banco utiliza diversos recursos de integridade do PostgreSQL, incluindo:

* `PRIMARY KEY`;
* `FOREIGN KEY`;
* `UNIQUE`;
* `NOT NULL`;
* `CHECK`;
* `DEFAULT`;
* `GENERATED ALWAYS AS IDENTITY`;
* `ON DELETE`;
* `ON UPDATE`.

Por exemplo, a tabela `sessao` possui restrições que garantem que o horário de término seja posterior ao horário de início e que o limite de vagas, quando informado, seja positivo.

Também são utilizadas ações `CASCADE` e `RESTRICT` nas chaves estrangeiras para controlar o comportamento das alterações e exclusões de registros relacionados.

---

## ⚙️ Tecnologias Utilizadas

| Tecnologia       | Utilização                               |
| ---------------- | ---------------------------------------- |
| **PostgreSQL**   | Sistema gerenciador de banco de dados    |
| **Python 3.11+** | Desenvolvimento do protótipo             |
| **Ollama**       | Execução local do modelo de linguagem    |
| **SQL**          | Criação, população e consulta do banco   |
| **Git/GitHub**   | Versionamento e armazenamento do projeto |
| **VS Code**      | Ambiente de desenvolvimento              |

O enunciado estabelece PostgreSQL, Python 3.11 ou superior e Ollama como tecnologias obrigatórias para o projeto.

---

## 🤖 Integração com Inteligência Artificial

O protótipo utiliza o **Ollama** para executar localmente um modelo de linguagem.

A aplicação permite que o usuário faça uma pergunta em **linguagem natural**. Essa pergunta é processada pelo modelo, que a converte em uma consulta SQL. A consulta gerada é então executada no PostgreSQL e seu resultado é apresentado ao usuário.

Fluxo simplificado:

```text
Usuário
   │
   ▼
Pergunta em linguagem natural
   │
   ▼
Protótipo Python
   │
   ▼
Ollama / Modelo de linguagem
   │
   ▼
Consulta SQL
   │
   ▼
PostgreSQL
   │
   ▼
Resultado
```

Essa integração atende ao requisito do protótipo de receber perguntas em linguagem natural, utilizar um modelo local através do Ollama, gerar SQL, executar a consulta e apresentar o resultado.

---

## 📁 Estrutura do Repositório

A estrutura principal do repositório é organizada da seguinte forma:

```text
TrabalhoBD/
│
├── Prototipo/
│   └── Arquivos do protótipo em Python
│
├── ddl.sql
│   └── Criação da estrutura do banco de dados
│
├── dml.sql
│   └── Inserção e população dos dados
│
├── Projeto.txt
│   └── Documentação técnica do projeto
│
├── obs.txt
│   └── Observações relacionadas ao projeto
│
├── .gitignore
│
└── README.md
```

O repositório disponibiliza atualmente os arquivos `ddl.sql`, `dml.sql`, `Projeto.txt`, `obs.txt` e a pasta `Prototipo`.

---

## 🗄️ Banco de Dados

### 1. Criação do banco

Primeiramente, deve ser criado um banco de dados PostgreSQL para o projeto.

Exemplo:

```sql
CREATE DATABASE trabalho_bd;
```

Depois, conecte-se ao banco criado.

### 2. Execução do DDL

O arquivo `ddl.sql` contém os comandos necessários para criar as estruturas do banco.

No PostgreSQL:

```bash
psql -U postgres -d trabalho_bd -f ddl.sql
```

Ou, caso esteja utilizando uma ferramenta gráfica ou extensão do PostgreSQL no VS Code, o conteúdo do arquivo pode ser executado diretamente no banco.

### 3. Inserção dos dados

Após a criação das tabelas, execute o arquivo `dml.sql`:

```bash
psql -U postgres -d trabalho_bd -f dml.sql
```

O arquivo contém os dados utilizados para popular e testar o sistema.

---

## 🐍 Execução do Protótipo

Entre na pasta do protótipo:

```bash
cd Prototipo
```

Recomenda-se utilizar um ambiente virtual Python:

```bash
python -m venv .venv
```

No Windows:

```bash
.venv\Scripts\activate
```

Instale as dependências:

```bash
pip install -r requirements.txt
```

Certifique-se de que o PostgreSQL esteja em execução e que o banco de dados tenha sido criado e populado.

Também é necessário possuir o **Ollama** instalado e em execução.

O modelo utilizado pelo projeto deve estar disponível localmente no Ollama antes da execução do protótipo.

Depois, execute a aplicação conforme as instruções presentes na pasta `Prototipo`.

---

## 🔎 Consultas SQL

O projeto possui consultas destinadas a explorar diferentes informações do banco de dados.

As consultas podem envolver informações como:

* eventos cadastrados;
* participantes;
* atividades;
* sessões;
* espaços disponíveis;
* recursos;
* inscrições;
* relações entre participantes e atividades;
* informações relacionadas à programação dos eventos.

O enunciado determina que o projeto possua **5 consultas SQL relevantes**, com diferentes níveis de complexidade, e que elas representem perguntas pertinentes ao sistema.

---

## 🧪 Dados de Teste

O arquivo `dml.sql` contém os comandos responsáveis pela população do banco de dados.

Esses dados permitem testar as relações entre:

* pessoas;
* organizações;
* eventos;
* atividades;
* sessões;
* espaços;
* recursos;
* inscrições.

A existência de dados de teste é necessária para demonstrar o funcionamento das consultas e do protótipo.

---

## 📚 Arquivos do Projeto

| Arquivo/Pasta | Descrição                                   |
| ------------- | ------------------------------------------- |
| `ddl.sql`     | Script de criação do banco de dados         |
| `dml.sql`     | Script de inserção dos dados                |
| `Projeto.txt` | Documentação técnica e consultas do projeto |
| `Prototipo/`  | Aplicação em Python                         |
| `obs.txt`     | Observações do projeto                      |
| `README.md`   | Documentação e instruções do projeto        |

---

## 📋 Requisitos do Projeto

Para executar o projeto, é necessário possuir:

* **PostgreSQL**;
* **Python 3.11 ou superior**;
* **Ollama**;
* um modelo de linguagem compatível instalado no Ollama;
* ambiente para execução do protótipo Python.

O projeto segue os requisitos tecnológicos estabelecidos pela disciplina.

---

## 🎓 Disciplina

**SCC0640 – Bases de Dados**

Projeto de curso — **Sistema de Gestão de Eventos e Espaços**

O trabalho envolve modelagem conceitual, modelo relacional, implementação do banco de dados, consultas SQL, triggers e desenvolvimento de uma aplicação para acesso aos dados.

---

## 📌 Referências do Projeto

* [Repositório no GitHub](https://github.com/EduardoAPaiva/TrabalhoBD)
* Enunciado do Projeto — SCC0640/SCC0540 – Bases de Dados
