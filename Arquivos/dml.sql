-- ============================================================
-- DML - MASSA DE DADOS
-- SCC0640 - PROJETO DE BASES DE DADOS
-- ============================================================

-- ============================================================
-- 0. LIMPANDO TODAS TABELAS
-- ============================================================

DELETE FROM inscricao_sessao;
DELETE FROM inscricao_evento;
DELETE FROM sessao;
DELETE FROM atividade_pessoa;
DELETE FROM evento_pessoa;
DELETE FROM atividade_recurso;
DELETE FROM espaco_recurso;
DELETE FROM atividade;
DELETE FROM evento_organizacao_responsavel;
DELETE FROM evento_pessoa_responsavel;
DELETE FROM recurso;
DELETE FROM espaco;
DELETE FROM evento;
DELETE FROM organizacao;
DELETE FROM pessoa;

-- ============================================================
-- 1. PESSOAS
-- ============================================================

INSERT INTO pessoa (nome, email, telefone) VALUES
('Ana Beatriz Silva', 'ana.silva@email.com', '(16) 99111-1001'),
('Bruno Henrique Costa', 'bruno.costa@email.com', '(16) 99222-1002'),
('Carlos Eduardo Mendes', 'carlos.mendes@email.com', '(16) 99333-1003'),
('Daniela Martins Souza', 'daniela.souza@email.com', '(16) 99444-1004'),
('Eduardo Ferreira Lima', 'eduardo.lima@email.com', '(16) 99555-1005'),
('Fernanda Alves Rocha', 'fernanda.rocha@email.com', '(16) 99666-1006'),
('Gabriel Oliveira Santos', 'gabriel.santos@email.com', '(16) 99777-1007'),
('Helena Cristina Dias', 'helena.dias@email.com', '(16) 99888-1008'),
('Igor Almeida Ribeiro', 'igor.ribeiro@email.com', '(16) 99999-1009'),
('Juliana Pereira Gomes', 'juliana.gomes@email.com', '(16) 99000-1010'),
('Lucas Rodrigues Martins', 'lucas.martins@email.com', '(16) 99111-1011'),
('Mariana Carvalho Lopes', 'mariana.lopes@email.com', '(16) 99222-1012'),
('Nicolas Barbosa Freitas', 'nicolas.freitas@email.com', '(16) 99333-1013'),
('Olivia Mendes Castro', 'olivia.castro@email.com', '(16) 99444-1014'),
('Paulo Roberto Nunes', 'paulo.nunes@email.com', '(16) 99555-1015'),
('Rafaela Moreira Pinto', 'rafaela.pinto@email.com', '(16) 99666-1016'),
('Samuel Teixeira Alves', 'samuel.alves@email.com', '(16) 99777-1017'),
('Tatiana Fernandes Dias', 'tatiana.dias@email.com', '(16) 99888-1018'),
('Victor Hugo Martins', 'victor.martins@email.com', '(16) 99999-1019'),
('Yasmin Cardoso Lima', 'yasmin.lima@email.com', '(16) 99000-1020'),
('André Luiz Barbosa', 'andre.barbosa@email.com', '(16) 99111-1021'),
('Beatriz Ramos Silva', 'beatriz.silva@email.com', '(16) 99222-1022'),
('Caio Henrique Souza', 'caio.souza@email.com', '(16) 99333-1023'),
('Débora Cristina Alves', 'debora.alves@email.com', '(16) 99444-1024'),
('Enzo Gabriel Costa', 'enzo.costa@email.com', '(16) 99555-1025'),
('Flávia Regina Mendes', 'flavia.mendes@email.com', '(16) 99666-1026'),
('Gustavo Rocha Pereira', 'gustavo.pereira@email.com', '(16) 99777-1027'),
('Isabela Martins Oliveira', 'isabela.oliveira@email.com', '(16) 99888-1028'),
('João Pedro Carvalho', 'joao.carvalho@email.com', '(16) 99999-1029'),
('Larissa Fernandes Souza', 'larissa.souza@email.com', '(16) 99000-1030');


-- ============================================================
-- 2. ORGANIZAÇÕES
-- ============================================================

INSERT INTO organizacao (nome, email, telefone) VALUES
('Universidade de São Paulo', 'contato@usp.br', '(11) 3091-0000'),
('Escola de Engenharia de São Carlos', 'eesc@usp.br', '(16) 3373-9000'),
('Centro Acadêmico de Computação', 'cac@usp.br', '(16) 3373-9100'),
('Instituto de Tecnologia e Inovação', 'contato@iti.org.br', '(16) 3373-9200'),
('Associação Brasileira de Tecnologia', 'contato@abt.org.br', '(11) 3000-1000'),
('Núcleo de Empreendedorismo Universitário', 'neu@usp.br', '(16) 3373-9300'),
('Sociedade de Computação Aplicada', 'sca@org.br', '(11) 3000-2000'),
('Fundação para Pesquisa e Desenvolvimento', 'fpd@org.br', '(16) 3373-9400');


-- ============================================================
-- 3. ESPAÇOS
-- ============================================================

INSERT INTO espaco (nome, localizacao, capacidade) VALUES
('Auditório Principal', 'Bloco A - Térreo', 300),
('Auditório de Computação', 'Bloco B - Térreo', 180),
('Sala de Seminários 1', 'Bloco B - 1º andar', 80),
('Sala de Seminários 2', 'Bloco B - 1º andar', 60),
('Laboratório de Computação 1', 'Bloco C - 1º andar', 40),
('Laboratório de Computação 2', 'Bloco C - 1º andar', 35),
('Sala de Reuniões A', 'Bloco Administrativo', 20),
('Sala de Reuniões B', 'Bloco Administrativo', 15),
('Espaço Maker', 'Bloco de Inovação', 50),
('Sala Multiuso', 'Centro de Eventos', 100);


-- ============================================================
-- 4. RECURSOS
-- ============================================================

INSERT INTO recurso (nome, descricao) VALUES
('Projetor', 'Projetor multimídia para apresentações'),
('Computador', 'Computador de uso geral'),
('Microfone', 'Microfone para palestras e apresentações'),
('Sistema de Som', 'Sistema de amplificação sonora'),
('Quadro Branco', 'Quadro branco para aulas e apresentações'),
('Internet Wi-Fi', 'Acesso à rede sem fio'),
('Ar Condicionado', 'Sistema de climatização'),
('Câmera', 'Câmera para gravação ou transmissão'),
('Notebook', 'Computador portátil para apresentações'),
('Mesa de Trabalho', 'Mesa para atividades práticas'),
('Kit Arduino', 'Kit de desenvolvimento baseado em Arduino'),
('Kit Robótica', 'Kit para atividades de robótica');


-- ============================================================
-- 5. RECURSOS DOS ESPAÇOS
-- ============================================================

INSERT INTO espaco_recurso (id_espaco, id_recurso, quantidade) VALUES
-- Auditório Principal
(1, 1, 2),
(1, 3, 4),
(1, 4, 1),
(1, 6, 1),
(1, 7, 1),
(1, 8, 2),

-- Auditório de Computação
(2, 1, 2),
(2, 3, 3),
(2, 4, 1),
(2, 6, 1),
(2, 7, 1),
(2, 8, 1),

-- Sala de Seminários 1
(3, 1, 1),
(3, 3, 2),
(3, 5, 1),
(3, 6, 1),
(3, 7, 1),

-- Sala de Seminários 2
(4, 1, 1),
(4, 3, 2),
(4, 5, 1),
(4, 6, 1),

-- Laboratório 1
(5, 1, 1),
(5, 2, 40),
(5, 5, 1),
(5, 6, 1),
(5, 7, 1),
(5, 10, 40),

-- Laboratório 2
(6, 1, 1),
(6, 2, 35),
(6, 5, 1),
(6, 6, 1),
(6, 7, 1),
(6, 10, 35),

-- Sala de Reuniões A
(7, 1, 1),
(7, 5, 1),
(7, 6, 1),
(7, 7, 1),

-- Sala de Reuniões B
(8, 5, 1),
(8, 6, 1),
(8, 7, 1),

-- Espaço Maker
(9, 1, 1),
(9, 2, 10),
(9, 5, 2),
(9, 6, 1),
(9, 7, 1),
(9, 10, 10),
(9, 11, 15),
(9, 12, 8),

-- Sala Multiuso
(10, 1, 2),
(10, 3, 4),
(10, 4, 1),
(10, 5, 2),
(10, 6, 1),
(10, 7, 1),
(10, 8, 1);


-- ============================================================
-- 6. EVENTOS
-- ============================================================

INSERT INTO evento
(nome, descricao, data_inicio, data_fim, status)
VALUES
(
    'Semana de Computação 2026',
    'Evento acadêmico com palestras, minicursos e atividades relacionadas à computação.',
    '2026-10-05',
    '2026-10-09',
    'ABERTO'
),
(
    'Simpósio de Inteligência Artificial',
    'Simpósio sobre aplicações atuais de inteligência artificial.',
    '2026-10-19',
    '2026-10-21',
    'PLANEJADO'
),
(
    'Workshop de Banco de Dados',
    'Workshop sobre modelagem, SQL e administração de bancos de dados.',
    '2026-11-03',
    '2026-11-04',
    'ABERTO'
),
(
    'Hackathon Universitário',
    'Competição de desenvolvimento de soluções tecnológicas.',
    '2026-11-10',
    '2026-11-12',
    'PLANEJADO'
),
(
    'Encontro de Empreendedorismo',
    'Evento voltado ao empreendedorismo e criação de startups.',
    '2026-11-18',
    '2026-11-18',
    'PLANEJADO'
),
(
    'Congresso de Tecnologia Aplicada',
    'Congresso multidisciplinar sobre tecnologia e inovação.',
    '2026-12-01',
    '2026-12-04',
    'PLANEJADO'
),
(
    'Feira de Projetos de Engenharia',
    'Apresentação de projetos desenvolvidos por estudantes.',
    '2026-12-10',
    '2026-12-11',
    'PLANEJADO'
),
(
    'Curso de Desenvolvimento Web',
    'Curso intensivo de desenvolvimento de aplicações web.',
    '2027-01-11',
    '2027-01-15',
    'PLANEJADO'
),
(
    'Semana de Inovação',
    'Palestras e oficinas sobre inovação tecnológica.',
    '2027-02-01',
    '2027-02-03',
    'PLANEJADO'
),
(
    'Festival de Tecnologia e Cultura',
    'Evento aberto com atividades tecnológicas e culturais.',
    '2027-02-15',
    '2027-02-17',
    'PLANEJADO'
),
(
    'Seminário de Engenharia de Software',
    'Seminário sobre processos e ferramentas de desenvolvimento.',
    '2027-03-01',
    '2027-03-02',
    'PLANEJADO'
),
(
    'Encontro de Pesquisa Científica',
    'Apresentação de trabalhos e pesquisas acadêmicas.',
    '2027-03-15',
    '2027-03-17',
    'PLANEJADO'
);


-- ============================================================
-- 7. RESPONSÁVEIS - PESSOAS
-- ============================================================

INSERT INTO evento_pessoa_responsavel (id_evento, id_pessoa) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(4, 6),
(5, 7),
(6, 8),
(7, 9),
(8, 10),
(9, 11),
(10, 12),
(11, 13),
(12, 14);


-- ============================================================
-- 8. RESPONSÁVEIS - ORGANIZAÇÕES
-- ============================================================

INSERT INTO evento_organizacao_responsavel
(id_evento, id_organizacao)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4),
(3, 2),
(3, 3),
(4, 3),
(4, 6),
(5, 6),
(6, 1),
(6, 4),
(6, 5),
(7, 2),
(7, 4),
(8, 3),
(8, 7),
(9, 4),
(9, 6),
(10, 1),
(10, 5),
(11, 2),
(11, 7),
(12, 1),
(12, 8);


-- ============================================================
-- 9. ATIVIDADES
-- ============================================================

INSERT INTO atividade (id_evento, titulo, descricao) VALUES

-- Evento 1
(1, 'Abertura da Semana de Computação',
    'Cerimônia de abertura e apresentação da programação.'),
(1, 'Palestra sobre Inteligência Artificial',
    'Palestra introdutória sobre inteligência artificial.'),
(1, 'Minicurso de PostgreSQL',
    'Minicurso prático de PostgreSQL e SQL.'),
(1, 'Mesa Redonda sobre Carreiras',
    'Discussão sobre carreiras na área de tecnologia.'),

-- Evento 2
(2, 'Palestra: IA Generativa',
    'Discussão sobre modelos generativos e suas aplicações.'),
(2, 'Workshop de Machine Learning',
    'Workshop prático de aprendizado de máquina.'),
(2, 'Debate sobre Ética em IA',
    'Debate sobre aspectos éticos do uso de inteligência artificial.'),

-- Evento 3
(3, 'Modelagem Relacional',
    'Aula sobre modelagem de bancos de dados relacionais.'),
(3, 'SQL Avançado',
    'Atividade prática envolvendo consultas SQL avançadas.'),
(3, 'Otimização de Consultas',
    'Discussão sobre índices e otimização de consultas.'),

-- Evento 4
(4, 'Abertura do Hackathon',
    'Apresentação das regras e desafios da competição.'),
(4, 'Mentoria Técnica',
    'Sessão de mentoria para equipes participantes.'),
(4, 'Apresentação dos Projetos',
    'Apresentação final dos projetos desenvolvidos.'),

-- Evento 5
(5, 'Empreendedorismo Universitário',
    'Introdução ao empreendedorismo no ambiente acadêmico.'),
(5, 'Painel com Startups',
    'Painel com fundadores de empresas de tecnologia.'),

-- Evento 6
(6, 'Tecnologias Emergentes',
    'Palestra sobre tecnologias emergentes.'),
(6, 'Internet das Coisas',
    'Workshop sobre IoT e sistemas embarcados.'),
(6, 'Computação de Alto Desempenho',
    'Palestra sobre computação de alto desempenho.'),

-- Evento 7
(7, 'Exposição de Projetos',
    'Exposição de projetos desenvolvidos por estudantes.'),
(7, 'Avaliação dos Projetos',
    'Avaliação dos projetos por uma banca convidada.'),

-- Evento 8
(8, 'HTML e CSS',
    'Introdução ao desenvolvimento de páginas web.'),
(8, 'JavaScript',
    'Introdução à programação para aplicações web.'),
(8, 'Desenvolvimento de APIs',
    'Desenvolvimento de APIs utilizando tecnologias modernas.'),

-- Evento 9
(9, 'Inovação Aberta',
    'Palestra sobre inovação aberta.'),
(9, 'Design Thinking',
    'Workshop de Design Thinking.'),

-- Evento 10
(10, 'Tecnologia e Sociedade',
    'Discussão sobre os impactos da tecnologia na sociedade.'),
(10, 'Oficina de Robótica',
    'Oficina prática de robótica.'),

-- Evento 11
(11, 'Metodologias Ágeis',
    'Apresentação de metodologias ágeis.'),
(11, 'Integração Contínua',
    'Workshop sobre CI/CD.'),
(11, 'Testes Automatizados',
    'Workshop sobre testes automatizados.'),

-- Evento 12
(12, 'Apresentação de Pesquisas',
    'Sessão de apresentação de trabalhos científicos.'),
(12, 'Sessão de Pôsteres',
    'Apresentação de pôsteres acadêmicos.');


-- ============================================================
-- 10. RECURSOS NECESSÁRIOS PELAS ATIVIDADES
-- ============================================================

INSERT INTO atividade_recurso (id_atividade, id_recurso, quantidade) VALUES

-- Semana de Computação
(1, 1, 1),
(1, 3, 2),
(1, 4, 1),

(2, 1, 1),
(2, 3, 2),
(2, 8, 1),

(3, 1, 1),
(3, 2, 20),
(3, 6, 1),

(4, 1, 1),
(4, 3, 3),

-- IA
(5, 1, 1),
(5, 3, 2),
(5, 8, 1),

(6, 1, 1),
(6, 2, 20),
(6, 6, 1),

(7, 1, 1),
(7, 3, 2),

-- Banco de Dados
(8, 1, 1),
(8, 2, 20),
(8, 6, 1),

(9, 1, 1),
(9, 2, 20),
(9, 6, 1),

(10, 1, 1),
(10, 2, 15),

-- Hackathon
(11, 1, 1),
(11, 3, 2),

(12, 1, 1),
(12, 2, 10),
(12, 6, 1),

(13, 1, 1),
(13, 3, 4),
(13, 4, 1),

-- Empreendedorismo
(14, 1, 1),
(14, 3, 2),

(15, 1, 1),
(15, 3, 4),
(15, 4, 1),

-- Tecnologia
(16, 1, 1),
(16, 3, 2),

(17, 1, 1),
(17, 2, 10),
(17, 11, 10),

(18, 1, 1),
(18, 3, 2),

-- Projetos
(19, 1, 2),
(19, 3, 4),
(19, 4, 1),

(20, 1, 1),
(20, 3, 3),

-- Web
(21, 1, 1),
(21, 2, 20),
(21, 6, 1),

(22, 1, 1),
(22, 2, 20),
(22, 6, 1),

(23, 1, 1),
(23, 2, 20),
(23, 6, 1),

-- Inovação
(24, 1, 1),
(24, 3, 2),

(25, 1, 1),
(25, 2, 10),
(25, 6, 1),

-- Tecnologia e Cultura
(26, 1, 1),
(26, 3, 2),

(27, 1, 1),
(27, 11, 8),
(27, 12, 5),

-- Engenharia de Software
(28, 1, 1),
(28, 3, 2),

(29, 1, 1),
(29, 2, 15),
(29, 6, 1),

(30, 1, 1),
(30, 2, 15),
(30, 6, 1),

-- Pesquisa
(31, 1, 1),
(31, 3, 2),
(31, 8, 1),

(32, 1, 2),
(32, 3, 2);


-- ============================================================
-- 11. PAPÉIS DAS PESSOAS NOS EVENTOS
-- ============================================================

INSERT INTO evento_pessoa (id_evento, id_pessoa, papel) VALUES

(1, 1, 'ORGANIZADOR'),
(1, 2, 'COLABORADOR'),
(1, 3, 'COLABORADOR'),
(1, 4, 'COLABORADOR'),

(2, 3, 'ORGANIZADOR'),
(2, 4, 'COLABORADOR'),
(2, 5, 'COLABORADOR'),

(3, 5, 'ORGANIZADOR'),
(3, 6, 'COLABORADOR'),
(3, 7, 'COLABORADOR'),

(4, 6, 'ORGANIZADOR'),
(4, 7, 'COLABORADOR'),
(4, 8, 'COLABORADOR'),

(5, 7, 'ORGANIZADOR'),
(5, 8, 'COLABORADOR'),
(5, 9, 'COLABORADOR'),

(6, 8, 'ORGANIZADOR'),
(6, 9, 'COLABORADOR'),
(6, 10, 'COLABORADOR'),

(7, 9, 'ORGANIZADOR'),
(7, 10, 'COLABORADOR'),
(7, 11, 'COLABORADOR'),

(8, 10, 'ORGANIZADOR'),
(8, 11, 'COLABORADOR'),
(8, 12, 'COLABORADOR'),

(9, 11, 'ORGANIZADOR'),
(9, 12, 'COLABORADOR'),
(9, 13, 'COLABORADOR'),

(10, 12, 'ORGANIZADOR'),
(10, 13, 'COLABORADOR'),
(10, 14, 'COLABORADOR'),

(11, 13, 'ORGANIZADOR'),
(11, 14, 'COLABORADOR'),
(11, 15, 'COLABORADOR'),

(12, 14, 'ORGANIZADOR'),
(12, 15, 'COLABORADOR'),
(12, 16, 'COLABORADOR');


-- ============================================================
-- 12. PAPÉIS DAS PESSOAS NAS ATIVIDADES
-- ============================================================

INSERT INTO atividade_pessoa (id_atividade, id_pessoa, papel) VALUES

(1, 1, 'ORGANIZADOR'),
(2, 3, 'PALESTRANTE'),
(3, 5, 'INSTRUTOR'),
(4, 2, 'MEDIADOR'),

(5, 4, 'PALESTRANTE'),
(6, 6, 'INSTRUTOR'),
(7, 3, 'MEDIADOR'),

(8, 5, 'INSTRUTOR'),
(9, 7, 'INSTRUTOR'),
(10, 6, 'PALESTRANTE'),

(11, 8, 'ORGANIZADOR'),
(12, 9, 'INSTRUTOR'),
(13, 10, 'PALESTRANTE'),

(14, 11, 'PALESTRANTE'),
(15, 12, 'MEDIADOR'),

(16, 13, 'PALESTRANTE'),
(17, 14, 'INSTRUTOR'),
(18, 15, 'PALESTRANTE'),

(19, 16, 'ORGANIZADOR'),
(20, 17, 'MEDIADOR'),

(21, 18, 'INSTRUTOR'),
(22, 19, 'INSTRUTOR'),
(23, 20, 'INSTRUTOR'),

(24, 21, 'PALESTRANTE'),
(25, 22, 'INSTRUTOR'),

(26, 23, 'PALESTRANTE'),
(27, 24, 'INSTRUTOR'),

(28, 25, 'PALESTRANTE'),
(29, 26, 'INSTRUTOR'),
(30, 27, 'INSTRUTOR'),

(31, 28, 'PALESTRANTE'),
(32, 29, 'ORGANIZADOR');


-- ============================================================
-- 13. SESSÕES
-- ============================================================

-- Evento 1
INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(1, 1, '2026-10-05 09:00', '2026-10-05 10:00', FALSE, NULL);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(2, 1, '2026-10-05 10:30', '2026-10-05 12:00', TRUE, 250);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(3, 5, '2026-10-06 09:00', '2026-10-06 12:00', TRUE, 35);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(4, 2, '2026-10-07 14:00', '2026-10-07 16:00', TRUE, 150);


-- Evento 2
INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(5, 1, '2026-10-19 09:00', '2026-10-19 11:00', FALSE, NULL);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(6, 5, '2026-10-19 14:00', '2026-10-19 17:00', TRUE, 35);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(7, 3, '2026-10-20 10:00', '2026-10-20 12:00', TRUE, 70);


-- Evento 3
INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(8, 5, '2026-11-03 09:00', '2026-11-03 11:00', TRUE, 35);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(9, 6, '2026-11-03 14:00', '2026-11-03 17:00', TRUE, 30);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(10, 5, '2026-11-04 10:00', '2026-11-04 12:00', FALSE, NULL);


-- Evento 4
INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(11, 1, '2026-11-10 09:00', '2026-11-10 10:00', TRUE, 250);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(12, 9, '2026-11-10 10:30', '2026-11-10 12:30', TRUE, 40);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(13, 1, '2026-11-12 14:00', '2026-11-12 17:00', TRUE, 250);


-- Evento 5
INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(14, 2, '2026-11-18 09:00', '2026-11-18 11:00', FALSE, NULL);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(15, 10, '2026-11-18 14:00', '2026-11-18 16:00', TRUE, 100);


-- Evento 6
INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(16, 1, '2026-12-01 09:00', '2026-12-01 11:00', FALSE, NULL);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(17, 9, '2026-12-02 09:00', '2026-12-02 12:00', TRUE, 40);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(18, 2, '2026-12-03 14:00', '2026-12-03 16:00', TRUE, 150);


-- Evento 7
INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(19, 1, '2026-12-10 09:00', '2026-12-10 17:00', FALSE, NULL);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(20, 2, '2026-12-11 09:00', '2026-12-11 12:00', TRUE, 150);


-- Evento 8
INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(21, 5, '2027-01-11 09:00', '2027-01-11 12:00', TRUE, 35);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(22, 5, '2027-01-12 09:00', '2027-01-12 12:00', TRUE, 35);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(23, 6, '2027-01-13 09:00', '2027-01-13 12:00', TRUE, 30);


-- Evento 9
INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(24, 2, '2027-02-01 09:00', '2027-02-01 11:00', FALSE, NULL);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(25, 9, '2027-02-02 09:00', '2027-02-02 12:00', TRUE, 40);


-- Evento 10
INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(26, 10, '2027-02-15 09:00', '2027-02-15 11:00', FALSE, NULL);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(27, 9, '2027-02-16 14:00', '2027-02-16 17:00', TRUE, 40);


-- Evento 11
INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(28, 2, '2027-03-01 09:00', '2027-03-01 11:00', FALSE, NULL);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(29, 5, '2027-03-01 14:00', '2027-03-01 17:00', TRUE, 35);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(30, 6, '2027-03-02 09:00', '2027-03-02 12:00', TRUE, 30);


-- Evento 12
INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(31, 1, '2027-03-15 09:00', '2027-03-15 12:00', TRUE, 250);

INSERT INTO sessao
(id_atividade, id_espaco, data_inicio, data_fim, requer_inscricao, limite_vagas)
VALUES
(32, 10, '2027-03-16 14:00', '2027-03-16 17:00', TRUE, 100);


-- ============================================================
-- 14. INSCRIÇÕES NOS EVENTOS
-- ============================================================

INSERT INTO inscricao_evento
(id_evento, id_pessoa, data_inscricao, status)
VALUES
-- Evento 1
(1, 5, '2026-09-20 10:00', 'CONFIRMADA'),
(1, 6, '2026-09-20 10:15', 'CONFIRMADA'),
(1, 7, '2026-09-21 09:30', 'CONFIRMADA'),
(1, 8, '2026-09-21 10:00', 'CONFIRMADA'),
(1, 9, '2026-09-22 11:00', 'CONFIRMADA'),
(1, 10, '2026-09-22 14:00', 'LISTA_ESPERA'),
(1, 11, '2026-09-23 09:00', 'CANCELADA'),

-- Evento 2
(2, 1, '2026-09-25 09:00', 'CONFIRMADA'),
(2, 2, '2026-09-25 09:30', 'CONFIRMADA'),
(2, 5, '2026-09-26 10:00', 'CONFIRMADA'),
(2, 8, '2026-09-26 11:00', 'LISTA_ESPERA'),

-- Evento 3
(3, 1, '2026-10-10 09:00', 'CONFIRMADA'),
(3, 4, '2026-10-10 09:30', 'CONFIRMADA'),
(3, 8, '2026-10-11 10:00', 'CONFIRMADA'),
(3, 12, '2026-10-11 11:00', 'CONFIRMADA'),
(3, 15, '2026-10-12 14:00', 'CANCELADA'),

-- Evento 4
(4, 2, '2026-10-15 09:00', 'CONFIRMADA'),
(4, 3, '2026-10-15 09:30', 'CONFIRMADA'),
(4, 4, '2026-10-15 10:00', 'CONFIRMADA'),
(4, 5, '2026-10-16 11:00', 'CONFIRMADA'),
(4, 9, '2026-10-16 12:00', 'LISTA_ESPERA'),

-- Evento 5
(5, 1, '2026-10-20 09:00', 'CONFIRMADA'),
(5, 6, '2026-10-20 10:00', 'CONFIRMADA'),
(5, 7, '2026-10-21 11:00', 'CONFIRMADA'),

-- Evento 6
(6, 3, '2026-11-01 09:00', 'CONFIRMADA'),
(6, 4, '2026-11-01 09:30', 'CONFIRMADA'),
(6, 5, '2026-11-02 10:00', 'CONFIRMADA'),
(6, 10, '2026-11-02 11:00', 'LISTA_ESPERA'),

-- Evento 7
(7, 1, '2026-11-15 09:00', 'CONFIRMADA'),
(7, 2, '2026-11-15 10:00', 'CONFIRMADA'),
(7, 3, '2026-11-15 11:00', 'CONFIRMADA'),
(7, 4, '2026-11-16 12:00', 'CONFIRMADA'),

-- Evento 8
(8, 5, '2026-12-20 09:00', 'CONFIRMADA'),
(8, 6, '2026-12-20 10:00', 'CONFIRMADA'),
(8, 7, '2026-12-21 11:00', 'CONFIRMADA'),
(8, 8, '2026-12-21 12:00', 'LISTA_ESPERA'),

-- Evento 9
(9, 9, '2027-01-10 09:00', 'CONFIRMADA'),
(9, 10, '2027-01-10 10:00', 'CONFIRMADA'),
(9, 11, '2027-01-11 11:00', 'CONFIRMADA'),

-- Evento 10
(10, 12, '2027-02-01 09:00', 'CONFIRMADA'),
(10, 13, '2027-02-01 10:00', 'CONFIRMADA'),
(10, 14, '2027-02-02 11:00', 'CONFIRMADA'),

-- Evento 11
(11, 15, '2027-02-20 09:00', 'CONFIRMADA'),
(11, 16, '2027-02-20 10:00', 'CONFIRMADA'),
(11, 17, '2027-02-21 11:00', 'LISTA_ESPERA'),

-- Evento 12
(12, 18, '2027-03-01 09:00', 'CONFIRMADA'),
(12, 19, '2027-03-01 10:00', 'CONFIRMADA'),
(12, 20, '2027-03-02 11:00', 'CONFIRMADA'),
(12, 21, '2027-03-02 12:00', 'CANCELADA');


-- ============================================================
-- 15. INSCRIÇÕES ESPECÍFICAS NAS SESSÕES
-- ============================================================

-- Sessão 2 - palestra de IA
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(2, 5, '2026-09-25 10:00', 'CONFIRMADA'),
(2, 6, '2026-09-25 10:30', 'CONFIRMADA'),
(2, 7, '2026-09-26 09:00', 'CONFIRMADA'),
(2, 8, '2026-09-26 09:30', 'CONFIRMADA'),
(2, 9, '2026-09-27 10:00', 'CANCELADA');

-- Sessão 3 - PostgreSQL
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(3, 5, '2026-09-25 11:00', 'CONFIRMADA'),
(3, 6, '2026-09-25 11:30', 'CONFIRMADA'),
(3, 7, '2026-09-26 12:00', 'CONFIRMADA');

-- Sessão 4 - mesa redonda
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(4, 5, '2026-09-26 13:00', 'CONFIRMADA'),
(4, 8, '2026-09-26 14:00', 'CONFIRMADA'),
(4, 9, '2026-09-27 09:00', 'CONFIRMADA');

-- Sessão 6 - workshop de Machine Learning
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(6, 1, '2026-09-28 10:00', 'CONFIRMADA'),
(6, 2, '2026-09-28 10:30', 'CONFIRMADA'),
(6, 5, '2026-09-29 09:00', 'CONFIRMADA');

-- Sessão 7 - debate
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(7, 1, '2026-09-29 10:00', 'CONFIRMADA'),
(7, 2, '2026-09-29 10:30', 'CONFIRMADA');

-- Sessão 8 - modelagem
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(8, 1, '2026-10-15 09:00', 'CONFIRMADA'),
(8, 4, '2026-10-15 09:30', 'CONFIRMADA'),
(8, 8, '2026-10-16 10:00', 'CONFIRMADA');

-- Sessão 9 - SQL
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(9, 1, '2026-10-15 11:00', 'CONFIRMADA'),
(9, 4, '2026-10-15 11:30', 'CONFIRMADA');

-- Sessão 12 - mentoria
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(12, 2, '2026-10-20 09:00', 'CONFIRMADA'),
(12, 3, '2026-10-20 09:30', 'CONFIRMADA');

-- Sessão 13 - apresentação
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(13, 2, '2026-10-20 10:00', 'CONFIRMADA'),
(13, 3, '2026-10-20 10:30', 'CONFIRMADA'),
(13, 4, '2026-10-21 09:00', 'CONFIRMADA');

-- Sessão 15 - painel de startups
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(15, 1, '2026-10-25 09:00', 'CONFIRMADA'),
(15, 6, '2026-10-25 10:00', 'CONFIRMADA'),
(15, 7, '2026-10-26 11:00', 'CONFIRMADA');

-- Sessão 17 - IoT
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(17, 3, '2026-11-05 09:00', 'CONFIRMADA'),
(17, 4, '2026-11-05 10:00', 'CONFIRMADA'),
(17, 5, '2026-11-06 11:00', 'CONFIRMADA');

-- Sessão 18
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(18, 3, '2026-11-05 12:00', 'CONFIRMADA'),
(18, 4, '2026-11-05 13:00', 'CONFIRMADA');

-- Sessão 20
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(20, 1, '2026-11-20 09:00', 'CONFIRMADA'),
(20, 2, '2026-11-20 10:00', 'CONFIRMADA'),
(20, 3, '2026-11-21 11:00', 'CONFIRMADA');

-- Sessão 21
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(21, 5, '2026-12-20 09:00', 'CONFIRMADA'),
(21, 6, '2026-12-20 10:00', 'CONFIRMADA');

-- Sessão 22
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(22, 5, '2026-12-20 11:00', 'CONFIRMADA'),
(22, 7, '2026-12-20 12:00', 'CONFIRMADA');

-- Sessão 23
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(23, 5, '2026-12-21 09:00', 'CONFIRMADA');

-- Sessão 25
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(25, 9, '2027-01-20 09:00', 'CONFIRMADA'),
(25, 10, '2027-01-20 10:00', 'CONFIRMADA');

-- Sessão 27
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(27, 12, '2027-02-05 09:00', 'CONFIRMADA'),
(27, 13, '2027-02-05 10:00', 'CONFIRMADA');

-- Sessão 29
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(29, 15, '2027-02-25 09:00', 'CONFIRMADA'),
(29, 16, '2027-02-25 10:00', 'CONFIRMADA');

-- Sessão 30
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(30, 15, '2027-02-25 11:00', 'CONFIRMADA');

-- Sessão 31
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(31, 18, '2027-03-05 09:00', 'CONFIRMADA'),
(31, 19, '2027-03-05 10:00', 'CONFIRMADA'),
(31, 20, '2027-03-05 11:00', 'CONFIRMADA');

-- Sessão 32
INSERT INTO inscricao_sessao
(id_sessao, id_pessoa, data_inscricao, status)
VALUES
(32, 18, '2027-03-05 12:00', 'CONFIRMADA'),
(32, 19, '2027-03-05 13:00', 'CONFIRMADA');