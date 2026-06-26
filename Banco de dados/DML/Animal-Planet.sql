-- =========================================================
-- PROJETO: ANIMAL PLANET
-- TEMA: VETERINÁRIA
-- =========================================================

-- =========================================================
-- INSERTS - VETERINÁRIOS
-- =========================================================

INSERT INTO veterinario
(nome, email, telefone, senha_hash)
VALUES
('Carlos Silva', 'carlos@gmail.com', '(63)99999-1111', 'hash123'),
('Mariana Souza', 'mariana@gmail.com', '(63)99999-2222', 'hash456'),
('Pedro Alves', 'pedro@gmail.com', '(63)99999-3333', 'hash789'),
('Ana Lima', 'ana@gmail.com', '(63)99999-4444', 'hash101'),
('João Costa', 'joao@gmail.com', '(63)99999-5555', 'hash202');

-- =========================================================
-- INSERTS - ATENDIMENTOS
-- =========================================================

INSERT INTO atendimento
(tipo_atendimento, preco, data_atendimento, hora_atendimento)
VALUES
('Consulta', 80.00, '2026-06-15', '08:00:00'),
('Vacinação', 120.00, '2026-06-15', '09:00:00'),
('Cirurgia', 500.00, '2026-06-16', '10:00:00'),
('Banho e Tosa', 60.00, '2026-06-17', '11:00:00'),
('Exame', 150.00, '2026-06-18', '14:00:00');

-- =========================================================
-- INSERTS - CLIENTES
-- =========================================================

INSERT INTO cliente
(nome, cpf, telefone, email, endereco, cidade, estado, cep)
VALUES
('José Pereira', '111.111.111-11', '(63)99999-0001', 'jose@gmail.com', 'Rua A', 'Formoso do Araguaia', 'TO', '77470-000'),
('Maria Santos', '222.222.222-22', '(63)99999-0002', 'maria@gmail.com', 'Rua B', 'Formoso do Araguaia', 'TO', '77470-001'),
('Lucas Oliveira', '333.333.333-33', '(63)99999-0003', 'lucas@gmail.com', 'Rua C', 'Formoso do Araguaia', 'TO', '77470-002'),
('Fernanda Lima', '444.444.444-44', '(63)99999-0004', 'fernanda@gmail.com', 'Rua D', 'Formoso do Araguaia', 'TO', '77470-003'),
('Ricardo Costa', '555.555.555-55', '(63)99999-0005', 'ricardo@gmail.com', 'Rua E', 'Formoso do Araguaia', 'TO', '77470-004');

-- =========================================================
-- INSERTS - RECEPCIONISTAS
-- =========================================================

INSERT INTO recepcionista
(nome, email, senha)
VALUES
('Patricia Gomes', 'patricia@gmail.com', '123456'),
('Juliana Souza', 'juliana@gmail.com', '654321'),
('Marcos Silva', 'marcos@gmail.com', '111111'),
('Larissa Alves', 'larissa@gmail.com', '222222'),
('Rafael Lima', 'rafael@gmail.com', '333333');

-- =========================================================
-- INSERTS - ANIMAIS
-- =========================================================

INSERT INTO animal
(nome, raca, sexo, peso, data_nascimento, id_cliente, id_atendimento, id_veterinario)
VALUES
('Thor', 'Labrador', 'Macho', 25.50, '2021-05-10', 1, 1, 1),
('Luna', 'Poodle', 'Fêmea', 8.20, '2022-03-15', 2, 2, 2),
('Rex', 'Pastor Alemão', 'Macho', 32.00, '2020-08-20', 3, 3, 3),
('Mel', 'Shih Tzu', 'Fêmea', 6.50, '2023-01-05', 4, 4, 4),
('Max', 'Golden Retriever', 'Macho', 29.30, '2021-11-12', 5, 5, 5);

-- =========================================================
-- QUESTÃO 02 - SELECT
-- =========================================================

SELECT * FROM animal;

SELECT
    nome,
    raca,
    sexo,
    peso
FROM animal;

SELECT *
FROM animal
WHERE sexo = 'Macho';

-- =========================================================
-- QUESTÃO 03 - UPDATE
-- =========================================================

UPDATE veterinario
SET telefone = '(63)99999-7777'
WHERE id_veterinario = 1;

UPDATE cliente
SET
    nome = 'Maria Eduarda Santos',
    email = 'mariaeduarda@gmail.com'
WHERE id_cliente = 2;

SELECT * FROM veterinario;
SELECT * FROM cliente;

-- =========================================================
-- QUESTÃO 04 - DELETE
-- =========================================================

DELETE FROM recepcionista
WHERE id_recepcionista = 5;

-- Remove a referência antes de excluir o atendimento
UPDATE animal
SET id_atendimento = NULL
WHERE id_atendimento = 5;

DELETE FROM atendimento
WHERE id_atendimento = 5;

SELECT * FROM recepcionista;
SELECT * FROM atendimento;

-- =========================================================
-- QUESTÃO 05 - INNER JOIN
-- =========================================================

-- Animal e seu dono
SELECT
    a.nome AS animal,
    a.raca,
    a.sexo,
    c.nome AS cliente
FROM animal a
INNER JOIN cliente c
    ON a.id_cliente = c.id_cliente;

-- Animal, veterinário e atendimento
SELECT
    a.nome AS animal,
    a.raca,
    v.nome AS veterinario,
    at.tipo_atendimento,
    at.data_atendimento
FROM animal a
INNER JOIN veterinario v
    ON a.id_veterinario = v.id_veterinario
INNER JOIN atendimento at
    ON a.id_atendimento = at.id_atendimento;

-- =========================================================
-- DESAFIO EXTRA
-- =========================================================

SELECT
    a.nome AS animal,
    a.raca,
    a.sexo,
    c.nome AS dono,
    v.nome AS veterinario,
    at.tipo_atendimento
FROM animal a
INNER JOIN cliente c
    ON a.id_cliente = c.id_cliente
INNER JOIN veterinario v
    ON a.id_veterinario = v.id_veterinario
INNER JOIN atendimento at
    ON a.id_atendimento = at.id_atendimento
WHERE v.nome = 'Carlos Silva';