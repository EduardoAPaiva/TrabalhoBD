-- ============================================================
-- SCC0640 - PROJETO DE BASES DE DADOS
-- SISTEMA DE GESTÃO DE EVENTOS E ESPAÇOS
-- PostgreSQL
-- ============================================================

-- ============================================================
-- 0. REMOÇÃO DAS TABELAS EXISTENTES
-- ============================================================

DROP TABLE IF EXISTS inscricao_sessao CASCADE;
DROP TABLE IF EXISTS inscricao_evento CASCADE;
DROP TABLE IF EXISTS sessao CASCADE;
DROP TABLE IF EXISTS atividade_pessoa CASCADE;
DROP TABLE IF EXISTS evento_pessoa CASCADE;
DROP TABLE IF EXISTS atividade_recurso CASCADE;
DROP TABLE IF EXISTS espaco_recurso CASCADE;
DROP TABLE IF EXISTS atividade CASCADE;
DROP TABLE IF EXISTS evento_organizacao_responsavel CASCADE;
DROP TABLE IF EXISTS evento_pessoa_responsavel CASCADE;
DROP TABLE IF EXISTS recurso CASCADE;
DROP TABLE IF EXISTS espaco CASCADE;
DROP TABLE IF EXISTS evento CASCADE;
DROP TABLE IF EXISTS organizacao CASCADE;
DROP TABLE IF EXISTS pessoa CASCADE;

DROP FUNCTION IF EXISTS fn_verificar_sessao_evento() CASCADE;
DROP FUNCTION IF EXISTS fn_verificar_capacidade_sessao() CASCADE;
DROP FUNCTION IF EXISTS fn_verificar_conflito_espaco() CASCADE;
DROP FUNCTION IF EXISTS fn_verificar_recursos_sessao() CASCADE;
DROP FUNCTION IF EXISTS fn_verificar_inscricao_sessao() CASCADE;
DROP FUNCTION IF EXISTS fn_verificar_vagas_sessao() CASCADE;

DROP TYPE IF EXISTS status_evento CASCADE;
DROP TYPE IF EXISTS status_inscricao CASCADE;
DROP TYPE IF EXISTS papel_evento CASCADE;
DROP TYPE IF EXISTS papel_atividade CASCADE;

-- ============================================================
-- 1. TIPOS AUXILIARES
-- ============================================================

CREATE TYPE status_evento AS ENUM (
    'PLANEJADO',
    'ABERTO',
    'EM_ANDAMENTO',
    'ENCERRADO',
    'CANCELADO'
);

CREATE TYPE status_inscricao AS ENUM (
    'CONFIRMADA',
    'LISTA_ESPERA',
    'CANCELADA'
);

CREATE TYPE papel_evento AS ENUM (
    'ORGANIZADOR',
    'COLABORADOR'
);

CREATE TYPE papel_atividade AS ENUM (
    'PALESTRANTE',
    'INSTRUTOR',
    'MEDIADOR',
    'ORGANIZADOR'
);


-- ============================================================
-- 2. PESSOAS
-- ============================================================

CREATE TABLE pessoa (
    id_pessoa BIGINT GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telefone VARCHAR(30),

    CONSTRAINT pk_pessoa
        PRIMARY KEY (id_pessoa),

    CONSTRAINT uq_pessoa_email
        UNIQUE (email)
);


-- ============================================================
-- 3. ORGANIZAÇÕES
-- ============================================================

CREATE TABLE organizacao (
    id_organizacao BIGINT GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(200) NOT NULL,
    email VARCHAR(255),
    telefone VARCHAR(30),

    CONSTRAINT pk_organizacao
        PRIMARY KEY (id_organizacao),

    CONSTRAINT uq_organizacao_nome
        UNIQUE (nome)
);


-- ============================================================
-- 4. EVENTOS
-- ============================================================

CREATE TABLE evento (
    id_evento BIGINT GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(200) NOT NULL,
    descricao TEXT,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,

    status status_evento NOT NULL
        DEFAULT 'PLANEJADO',

    CONSTRAINT pk_evento
        PRIMARY KEY (id_evento),

    CONSTRAINT ck_evento_datas
        CHECK (data_fim >= data_inicio),

    CONSTRAINT uq_evento_nome_inicio
        UNIQUE (nome, data_inicio)
);


-- ============================================================
-- 5. RESPONSÁVEIS PELA PROMOÇÃO DO EVENTO
-- ============================================================

CREATE TABLE evento_pessoa_responsavel (
    id_evento BIGINT NOT NULL,
    id_pessoa BIGINT NOT NULL,

    CONSTRAINT pk_evento_pessoa_responsavel
        PRIMARY KEY (id_evento, id_pessoa),

    CONSTRAINT fk_epr_evento
        FOREIGN KEY (id_evento)
        REFERENCES evento(id_evento)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_epr_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoa(id_pessoa)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);


CREATE TABLE evento_organizacao_responsavel (
    id_evento BIGINT NOT NULL,
    id_organizacao BIGINT NOT NULL,

    CONSTRAINT pk_evento_organizacao_responsavel
        PRIMARY KEY (id_evento, id_organizacao),

    CONSTRAINT fk_eor_evento
        FOREIGN KEY (id_evento)
        REFERENCES evento(id_evento)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_eor_organizacao
        FOREIGN KEY (id_organizacao)
        REFERENCES organizacao(id_organizacao)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);


-- ============================================================
-- 6. ESPAÇOS
-- ============================================================

CREATE TABLE espaco (
    id_espaco BIGINT GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(150) NOT NULL,
    localizacao VARCHAR(255),
    capacidade INTEGER NOT NULL,

    CONSTRAINT pk_espaco
        PRIMARY KEY (id_espaco),

    CONSTRAINT uq_espaco_nome
        UNIQUE (nome),

    CONSTRAINT ck_espaco_capacidade
        CHECK (capacidade > 0)
);


-- ============================================================
-- 7. RECURSOS DISPONÍVEIS
-- ============================================================

CREATE TABLE recurso (
    id_recurso BIGINT GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,

    CONSTRAINT pk_recurso
        PRIMARY KEY (id_recurso),

    CONSTRAINT uq_recurso_nome
        UNIQUE (nome)
);


-- ============================================================
-- 8. RECURSOS DISPONÍVEIS EM CADA ESPAÇO
-- ============================================================

CREATE TABLE espaco_recurso (
    id_espaco BIGINT NOT NULL,
    id_recurso BIGINT NOT NULL,
    quantidade INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT pk_espaco_recurso
        PRIMARY KEY (id_espaco, id_recurso),

    CONSTRAINT fk_er_espaco
        FOREIGN KEY (id_espaco)
        REFERENCES espaco(id_espaco)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_er_recurso
        FOREIGN KEY (id_recurso)
        REFERENCES recurso(id_recurso)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT ck_er_quantidade
        CHECK (quantidade > 0)
);


-- ============================================================
-- 9. ATIVIDADES
-- ============================================================

CREATE TABLE atividade (
    id_atividade BIGINT GENERATED ALWAYS AS IDENTITY,
    id_evento BIGINT NOT NULL,

    titulo VARCHAR(200) NOT NULL,
    descricao TEXT,

    CONSTRAINT pk_atividade
        PRIMARY KEY (id_atividade),

    CONSTRAINT fk_atividade_evento
        FOREIGN KEY (id_evento)
        REFERENCES evento(id_evento)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT uq_atividade_evento_titulo
        UNIQUE (id_evento, titulo)
);


-- ============================================================
-- 10. RECURSOS NECESSÁRIOS PARA ATIVIDADES
-- ============================================================

CREATE TABLE atividade_recurso (
    id_atividade BIGINT NOT NULL,
    id_recurso BIGINT NOT NULL,
    quantidade INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT pk_atividade_recurso
        PRIMARY KEY (id_atividade, id_recurso),

    CONSTRAINT fk_ar_atividade
        FOREIGN KEY (id_atividade)
        REFERENCES atividade(id_atividade)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_ar_recurso
        FOREIGN KEY (id_recurso)
        REFERENCES recurso(id_recurso)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT ck_ar_quantidade
        CHECK (quantidade > 0)
);


-- ============================================================
-- 11. PAPÉIS DAS PESSOAS NO EVENTO
-- ============================================================

CREATE TABLE evento_pessoa (
    id_evento BIGINT NOT NULL,
    id_pessoa BIGINT NOT NULL,
    papel papel_evento NOT NULL,

    CONSTRAINT pk_evento_pessoa
        PRIMARY KEY (id_evento, id_pessoa, papel),

    CONSTRAINT fk_ep_evento
        FOREIGN KEY (id_evento)
        REFERENCES evento(id_evento)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_ep_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoa(id_pessoa)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);


-- ============================================================
-- 12. PAPÉIS DAS PESSOAS NAS ATIVIDADES
-- ============================================================

CREATE TABLE atividade_pessoa (
    id_atividade BIGINT NOT NULL,
    id_pessoa BIGINT NOT NULL,
    papel papel_atividade NOT NULL,

    CONSTRAINT pk_atividade_pessoa
        PRIMARY KEY (id_atividade, id_pessoa, papel),

    CONSTRAINT fk_ap_atividade
        FOREIGN KEY (id_atividade)
        REFERENCES atividade(id_atividade)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_ap_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoa(id_pessoa)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);


-- ============================================================
-- 13. SESSÕES
-- ============================================================

CREATE TABLE sessao (
    id_sessao BIGINT GENERATED ALWAYS AS IDENTITY,
    id_atividade BIGINT NOT NULL,
    id_espaco BIGINT NOT NULL,

    data_inicio TIMESTAMP NOT NULL,
    data_fim TIMESTAMP NOT NULL,

    requer_inscricao BOOLEAN NOT NULL DEFAULT FALSE,

    limite_vagas INTEGER,

    CONSTRAINT pk_sessao
        PRIMARY KEY (id_sessao),

    CONSTRAINT fk_sessao_atividade
        FOREIGN KEY (id_atividade)
        REFERENCES atividade(id_atividade)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_sessao_espaco
        FOREIGN KEY (id_espaco)
        REFERENCES espaco(id_espaco)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT ck_sessao_horario
        CHECK (data_fim > data_inicio),

    CONSTRAINT ck_sessao_limite_vagas
        CHECK (limite_vagas IS NULL OR limite_vagas > 0),

    CONSTRAINT uq_sessao_atividade_inicio
        UNIQUE (id_atividade, data_inicio)
);


-- ============================================================
-- 14. INSCRIÇÕES NOS EVENTOS
-- ============================================================

CREATE TABLE inscricao_evento (
    id_evento BIGINT NOT NULL,
    id_pessoa BIGINT NOT NULL,

    data_inscricao TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    status status_inscricao NOT NULL
        DEFAULT 'CONFIRMADA',

    CONSTRAINT pk_inscricao_evento
        PRIMARY KEY (id_evento, id_pessoa),

    CONSTRAINT fk_ie_evento
        FOREIGN KEY (id_evento)
        REFERENCES evento(id_evento)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_ie_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoa(id_pessoa)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);


-- ============================================================
-- 15. INSCRIÇÕES ESPECÍFICAS EM SESSÕES
-- ============================================================

CREATE TABLE inscricao_sessao (
    id_sessao BIGINT NOT NULL,
    id_pessoa BIGINT NOT NULL,

    data_inscricao TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    status status_inscricao NOT NULL
        DEFAULT 'CONFIRMADA',

    CONSTRAINT pk_inscricao_sessao
        PRIMARY KEY (id_sessao, id_pessoa),

    CONSTRAINT fk_is_sessao
        FOREIGN KEY (id_sessao)
        REFERENCES sessao(id_sessao)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_is_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoa(id_pessoa)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);


-- ============================================================
-- 16. FUNÇÃO:
--    VERIFICAR SE A SESSÃO ESTÁ DENTRO DO EVENTO
-- ============================================================

CREATE OR REPLACE FUNCTION fn_verificar_sessao_evento()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_inicio DATE;
    v_fim DATE;
BEGIN

    SELECT e.data_inicio, e.data_fim
    INTO v_inicio, v_fim
    FROM atividade a
    JOIN evento e
        ON e.id_evento = a.id_evento
    WHERE a.id_atividade = NEW.id_atividade;

    IF NEW.data_inicio::DATE < v_inicio
       OR NEW.data_fim::DATE > v_fim THEN

        RAISE EXCEPTION
            'A sessão deve ocorrer dentro do período do evento.';

    END IF;

    RETURN NEW;
END;
$$;


CREATE TRIGGER trg_verificar_sessao_evento
BEFORE INSERT OR UPDATE
ON sessao
FOR EACH ROW
EXECUTE FUNCTION fn_verificar_sessao_evento();


-- ============================================================
-- 17. FUNÇÃO:
--    VERIFICAR CAPACIDADE DO ESPAÇO
-- ============================================================

CREATE OR REPLACE FUNCTION fn_verificar_capacidade_sessao()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_capacidade INTEGER;
BEGIN

    SELECT capacidade
    INTO v_capacidade
    FROM espaco
    WHERE id_espaco = NEW.id_espaco;

    IF NEW.limite_vagas IS NOT NULL
       AND NEW.limite_vagas > v_capacidade THEN

        RAISE EXCEPTION
            'O limite de vagas da sessão (%) excede a capacidade do espaço (%).',
            NEW.limite_vagas,
            v_capacidade;

    END IF;

    RETURN NEW;
END;
$$;


CREATE TRIGGER trg_verificar_capacidade_sessao
BEFORE INSERT OR UPDATE
ON sessao
FOR EACH ROW
EXECUTE FUNCTION fn_verificar_capacidade_sessao();


-- ============================================================
-- 18. FUNÇÃO:
--    IMPEDIR CONFLITO DE ESPAÇOS
-- ============================================================

CREATE OR REPLACE FUNCTION fn_verificar_conflito_espaco()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

    IF EXISTS (
        SELECT 1
        FROM sessao s
        WHERE s.id_espaco = NEW.id_espaco
          AND s.id_sessao <> COALESCE(NEW.id_sessao, -1)

          AND NEW.data_inicio < s.data_fim
          AND NEW.data_fim > s.data_inicio
    ) THEN

        RAISE EXCEPTION
            'O espaço selecionado já está ocupado no período informado.';

    END IF;

    RETURN NEW;
END;
$$;


CREATE TRIGGER trg_verificar_conflito_espaco
BEFORE INSERT OR UPDATE
ON sessao
FOR EACH ROW
EXECUTE FUNCTION fn_verificar_conflito_espaco();


-- ============================================================
-- 19. FUNÇÃO:
--    VERIFICAR RECURSOS NECESSÁRIOS
-- ============================================================

CREATE OR REPLACE FUNCTION fn_verificar_recursos_sessao()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

    IF EXISTS (
        SELECT 1
        FROM atividade_recurso ar
        WHERE ar.id_atividade = (
            SELECT a.id_atividade
            FROM atividade a
            WHERE a.id_atividade = NEW.id_atividade
        )

        AND NOT EXISTS (
            SELECT 1
            FROM espaco_recurso er
            WHERE er.id_espaco = NEW.id_espaco
              AND er.id_recurso = ar.id_recurso
              AND er.quantidade >= ar.quantidade
        )
    ) THEN

        RAISE EXCEPTION
            'O espaço selecionado não possui todos os recursos necessários para a atividade.';

    END IF;

    RETURN NEW;
END;
$$;


CREATE TRIGGER trg_verificar_recursos_sessao
BEFORE INSERT OR UPDATE
ON sessao
FOR EACH ROW
EXECUTE FUNCTION fn_verificar_recursos_sessao();


-- ============================================================
-- 20. FUNÇÃO:
--    GARANTIR QUE INSCRIÇÃO EM SESSÃO EXIJA INSCRIÇÃO NO EVENTO
-- ============================================================

CREATE OR REPLACE FUNCTION fn_verificar_inscricao_sessao()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_evento BIGINT;
    v_requer_inscricao BOOLEAN;
BEGIN

    SELECT a.id_evento, s.requer_inscricao
    INTO v_evento, v_requer_inscricao
    FROM sessao s
    JOIN atividade a
        ON a.id_atividade = s.id_atividade
    WHERE s.id_sessao = NEW.id_sessao;

    IF NOT EXISTS (
        SELECT 1
        FROM inscricao_evento ie
        WHERE ie.id_evento = v_evento
          AND ie.id_pessoa = NEW.id_pessoa
          AND ie.status = 'CONFIRMADA'
    ) THEN

        RAISE EXCEPTION
            'A pessoa precisa estar inscrita no evento para se inscrever na sessão.';

    END IF;

    IF NOT v_requer_inscricao THEN

        RAISE EXCEPTION
            'Esta sessão não exige inscrição específica.';

    END IF;

    RETURN NEW;
END;
$$;


CREATE TRIGGER trg_verificar_inscricao_sessao
BEFORE INSERT OR UPDATE
ON inscricao_sessao
FOR EACH ROW
EXECUTE FUNCTION fn_verificar_inscricao_sessao();


-- ============================================================
-- 21. FUNÇÃO:
--    CONTROLAR LIMITE DE VAGAS DA SESSÃO
-- ============================================================

CREATE OR REPLACE FUNCTION fn_verificar_vagas_sessao()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_limite INTEGER;
    v_confirmadas INTEGER;
BEGIN

    IF NEW.status <> 'CONFIRMADA' THEN
        RETURN NEW;
    END IF;

    SELECT limite_vagas
    INTO v_limite
    FROM sessao
    WHERE id_sessao = NEW.id_sessao;

    IF v_limite IS NULL THEN
        RETURN NEW;
    END IF;

    SELECT COUNT(*)
    INTO v_confirmadas
    FROM inscricao_sessao
    WHERE id_sessao = NEW.id_sessao
      AND status = 'CONFIRMADA'
      AND NOT (
          id_pessoa = NEW.id_pessoa
      );

    IF v_confirmadas >= v_limite THEN

        RAISE EXCEPTION
            'Não há vagas disponíveis para esta sessão.';

    END IF;

    RETURN NEW;
END;
$$;


CREATE TRIGGER trg_verificar_vagas_sessao
BEFORE INSERT OR UPDATE
ON inscricao_sessao
FOR EACH ROW
EXECUTE FUNCTION fn_verificar_vagas_sessao();


-- ============================================================
-- 22. ÍNDICES AUXILIARES
-- ============================================================

CREATE INDEX idx_atividade_evento
    ON atividade(id_evento);

CREATE INDEX idx_sessao_atividade
    ON sessao(id_atividade);

CREATE INDEX idx_sessao_espaco
    ON sessao(id_espaco);

CREATE INDEX idx_sessao_periodo
    ON sessao(data_inicio, data_fim);

CREATE INDEX idx_inscricao_evento_pessoa
    ON inscricao_evento(id_pessoa);

CREATE INDEX idx_inscricao_sessao_pessoa
    ON inscricao_sessao(id_pessoa);

CREATE INDEX idx_evento_status
    ON evento(status);
