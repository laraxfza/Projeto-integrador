-- =========================================================
-- DML - BANCO DE DADOS EDUPLAN
-- =========================================================
-- Demonstração dos principais comandos DML:
-- INSERT, SELECT, UPDATE e DELETE
-- =========================================================

USE eduplan;

-- =========================================================
-- INSERT
-- =========================================================

-- Cadastrando professores
INSERT INTO professores (nome, email, senha_hash)
VALUES
('Joel Santos', 'joel@eduplan.com', 'hash_joel'),
('Mateus Rodrigues', 'mateus@eduplan.com', 'hash_mateus');

-- Cadastrando disciplinas
INSERT INTO disciplinas (nome_disciplina, area_conhecimento)
VALUES
('Matemática', 'Ciências Exatas'),
('Programação', 'Tecnologia da Informação');

-- Cadastrando séries
INSERT INTO series (nome_serie, nivel)
VALUES
('8º Ano', 'Ensino Fundamental II'),
('2º Ano', 'Ensino Médio');

-- Cadastrando atividades
INSERT INTO atividades
(
    titulo,
    conteudo,
    metodologia,
    objetivos,
    id_professor,
    id_disciplina,
    id_serie
)
VALUES
(
    'Equações do 1º Grau',
    'Resolução de exercícios envolvendo equações.',
    'Aula expositiva e prática.',
    'Desenvolver o raciocínio lógico-matemático.',
    1,
    1,
    1
),
(
    'Introdução à Linguagem Python',
    'Primeiros conceitos de programação.',
    'Aula prática em laboratório.',
    'Compreender os fundamentos da programação.',
    2,
    2,
    2
);


-- =========================================================
-- SELECT
-- =========================================================

-- Consultando todos os professores
SELECT * FROM professores;

-- Consultando todas as disciplinas
SELECT * FROM disciplinas;

-- Consultando todas as séries
SELECT * FROM series;

-- Consultando todas as atividades
SELECT * FROM atividades;

-- Exibindo as atividades com informações relacionadas
-- O INNER JOIN une tabelas através das chaves relacionadas
SELECT
    a.id_atividade,
    a.titulo,
    p.nome AS professor,
    d.nome_disciplina AS disciplina,
    s.nome_serie AS serie
FROM atividades a
INNER JOIN professores p
    ON a.id_professor = p.id_professor
INNER JOIN disciplinas d
    ON a.id_disciplina = d.id_disciplina
INNER JOIN series s
    ON a.id_serie = s.id_serie;

-- Consultando apenas as atividades do professor Joel
SELECT
    a.titulo,
    d.nome_disciplina
FROM atividades a
INNER JOIN professores p
    ON a.id_professor = p.id_professor
INNER JOIN disciplinas d
    ON a.id_disciplina = d.id_disciplina
WHERE p.nome = 'Joel Santos';


-- =========================================================
-- UPDATE
-- =========================================================

-- Alterando o título da atividade de Matemática
UPDATE atividades
SET titulo = 'Equações do 1º Grau e Problemas Aplicados'
WHERE id_atividade = 1;

-- Atualizando a metodologia da atividade de Programação
UPDATE atividades
SET metodologia = 'Aula prática utilizando Python e desafios de lógica.'
WHERE id_atividade = 2;

-- Verificando as alterações
SELECT * FROM atividades;


-- =========================================================
-- DELETE
-- =========================================================

-- Removendo a atividade de Programação
DELETE FROM atividades
WHERE id_atividade = 2;

-- Consultando os registros restantes
SELECT
    a.id_atividade,
    a.titulo,
    p.nome AS professor,
    d.nome_disciplina AS disciplina
FROM atividades a
INNER JOIN professores p
    ON a.id_professor = p.id_professor
INNER JOIN disciplinas d
    ON a.id_disciplina = d.id_disciplina;