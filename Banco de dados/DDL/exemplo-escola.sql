-- Criação de uma tabela
CREATE DATABASE escola;

-- Selecionar o BD para uso
USE escola;

-- Criar tabela do aluno
-- Armazena os dados dos estudantes
CREATE TABLE alunos(
	-- Identificador único (PK - chave primária)
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Nome completo do aluno (NOT NULL- obrigatório)
    nome VARCHAR(100) NOT NULL,
    
    -- Data de Nascimento
    data_nascimento DATE,
    
	-- CPF único p/ cada aluno (Restrição de unicidade - UNIQUE)
     cpf VARCHAR(14)UNIQUE,
      
	-- E-mail do aluno
    email VARCHAR(100) NOT NULL UNIQUE,
    
    -- Telefone de contato
    telefone VARCHAR(20),
    
    -- Data em que o aluno foi matriculado
    data_matricula DATE NOT NULL
);

CREATE TABLE professores(
	-- Identificador único professor
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Nome do professor (Obrigatório - NOT NULL)
	nome VARCHAR(100) NOT NULL,
    
    -- Área de especialização (ex: Matemática, Informática)
    especialidade VARCHAR (100),
    
    -- E-mail do professor
    email VARCHAR(100),
    
    -- Telefone de contato
    telefone VARCHAR(20)
    
    
);

-- Tabela de Cursos
-- Representa cursos oferecidos pela escola

CREATE TABLE cursos(
	-- Identificador único do curso
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Nome do curso (obrigatório - NOT NULL)
    nome VARCHAR(100) NOT NULL,
    
    -- Carga horária total do curso em horas
    carga_horaria INT NOT NULL

);

-- Tabela Turmas
-- Cada turma pertence a um curso e a um professor
    
CREATE TABLE turmas(
    -- Identificador único da turma
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    
    -- FK para curso (cada turma pertence a um curso)
    id_curso INT NOT NULL,
    
    -- FK para professor (responsável pela turma)
    id_professor INT NOT NULL,
    
    -- Ano da turma(ex.: 2026)
    ano INT NOT NULL,
    
    -- Série (1°, 2°, 3° ano)
	serie INT NOT NULL,
    
    -- Chave estrangeira -> cursos (1 curso tem várias turmas)
    FOREIGN KEY (id_curso)
		REFERENCES cursos(id_curso)
        ON DELETE RESTRICT,
        -- RESTRICT impede apagar curso com turmas vinculadas
	-- Chave estrangeira -. professores (1 professor pode ter várias turmas)
    FOREIGN KEY (id_professor)
		REFERENCES professores(id_professor)
        ON DELETE RESTRICT
        -- Impede excluir professor se ele estiver vinculado a uma turma)

);
-- Tabela: disciplina
CREATE TABLE disciplinas(
	-- Identificador da disciplina
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Nome da disciplina
    nome VARCHAR(100) NOT NULL,
    
     -- Carga horária da disciplina
     carga_horaria INT NOT NULL
);
-- Tabela: curso_disciplinas
-- Relacionamento N:N entre cursos e disciplinas

CREATE TABLE curso_disciplinas(
	-- FK para disciplina
    id_disciplina INT NOT NULL,
   
   -- FK para curso
    id_curso INT NOT NULL,
    
    -- Chave Primária composta (evita duplicidade)
    PRIMARY KEY (id_curso, id_disciplina),
    
    -- FK -> cursos
    FOREIGN KEY(id_curso)
		REFERENCES cursos(id_curso)
        ON DELETE CASCADE,
        -- CASCADE: Ao excluir curso, remove automaticamente relações


	    -- FK -> disciplinas
    FOREIGN KEY(id_disciplina)
		REFERENCES disciplinas(id_disciplina)
        ON DELETE CASCADE
        -- CASCADE: Ao excluir disciplina, remove automaticamente relações
);

-- Tabela: notas
-- Armazena notas dos alunos por disciplina

CREATE TABLE notas(
	-- Identificador da nota
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    
    -- FK por aluno
    id_aluno INT NOT NULL,
    
    -- FK para disciplina
    id_disciplina INT NOT NULL,
    
    -- Nota (ex.: 7.5)
    nota DECIMAL(5,2),
    
    -- FK -> alunos (1 aluno pode ter várias notas)
    FOREIGN KEY (id_aluno)
		REFERENCES alunos(id_aluno)
        ON DELETE CASCADE,
        -- Se o aluno for excluído, suas notas também serão
    
    
     -- FK -> disciplinas 
	FOREIGN KEY (id_disciplina)
		REFERENCES disciplinas(id_disciplina)
        ON DELETE RESTRICT,
        -- Impede excluir disciplina com notas cadastradas
        
	-- Garante que o aluno tenha apenas uma nota por disciplina
    UNIQUE (id_aluno, id_disciplina)

);
 -- ALTER TABLE (Adição do FK alunos -> Turmas)
 
 -- 1. Adiciona a coluna id_turma na tabela alunos
 -- Essa coluna irá armazenar a referência da turma do aluno
 ALTER TABLE alunos
 ADD COLUMN id_turma INT;
 
 -- 2. Tornar a coluna obrigatória (NOT NULL)
 -- Garante que todo aluno esteja vinculado a uma turma
 
 ALTER TABLE alunos
 MODIFY COLUMN id_turma INT NOT NULL;
 
 -- 3. Cria chave estrangeira (relacionamento)
 ALTER TABLE alunos
 ADD CONSTRAINT fk_aluno_turma
 FOREIGN KEY (id_turma)
 REFERENCES turmas(id_turma)
 ON DELETE RESTRICT;
 
 -- Explicação
 -- A chave estrangeira garante que:
 -- 1. Todo aluno deve estar vinculado a uma turma existente
 -- 2. Não é possível inserir um aluno com uma turma inexistente
 -- 3. Não é possível excluir uma turma que possua alunos vinculados (RESTRICT)

