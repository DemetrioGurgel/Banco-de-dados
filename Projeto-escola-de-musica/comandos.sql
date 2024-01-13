--Definição das Tabelas 

CREATE DATABASE escola_de_musica CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE orquestra ( 
    pais VARCHAR(100) NOT NULL, 
    nome VARCHAR(100) NOT NULL, 
    cidade VARCHAR(100) NOT NULL, 
    data_criacao DATE NOT NULL, 
    id_orquestra INT PRIMARY KEY AUTO_INCREMENT 
);


CREATE TABLE maestro ( 
    data_nasc DATE NOT NULL, 
    nacionalidade VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL, 
    nome VARCHAR(100) NOT NULL, PRIMARY KEY (cpf) 
);


CREATE TABLE sinfonia (
    nome VARCHAR(255) NOT NULL,
    id_sinfonia INT PRIMARY KEY AUTO_INCREMENT,
    compositor VARCHAR(255) NOT NULL,
    data_criacao DATE NOT NULL
);


CREATE TABLE evento (
    nome VARCHAR(255) NOT NULL,
    id_local INT PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(50) NOT NULL
);


CREATE TABLE musico (
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) PRIMARY KEY,
    nacionalidade VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL
);


CREATE TABLE instrumento_musical (
    nome VARCHAR(255) NOT NULL,
    cod_instrumento INT PRIMARY KEY,
    classificacao VARCHAR(100) NOT NULL
);


CREATE TABLE especialidade (
    nome VARCHAR(255) NOT NULL,
    id_especialidade INT PRIMARY KEY AUTO_INCREMENT
);


CREATE TABLE apresenta (
    fk_sinfonia_id_sinfonia INT NOT NULL,
    fk_maestro_cpf VARCHAR(14) NOT NULL,
    PRIMARY KEY (fk_sinfonia_id_sinfonia, fk_maestro_cpf),
    FOREIGN KEY (fk_sinfonia_id_sinfonia) REFERENCES sinfonia(id_sinfonia),
    FOREIGN KEY (fk_maestro_cpf) REFERENCES maestro(cpf)
);




CREATE TABLE participa (
    fk_evento_id_local INT,
    fk_orquestra_id_orquestra INT,
    PRIMARY KEY (fk_evento_id_local, fk_orquestra_id_orquestra),
    FOREIGN KEY (fk_evento_id_local) REFERENCES evento(id_local),
    FOREIGN KEY (fk_orquestra_id_orquestra) REFERENCES orquestra(id_orquestra)
);


CREATE TABLE ocorre (
    fk_sinfonia_id_sinfonia INT NOT NULL,
    fk_evento_id_local INT NOT NULL,
    PRIMARY KEY (fk_sinfonia_id_sinfonia, fk_evento_id_local),
    FOREIGN KEY (fk_sinfonia_id_sinfonia) REFERENCES sinfonia(id_sinfonia),
    FOREIGN KEY (fk_evento_id_local) REFERENCES evento(id_local)
);


CREATE TABLE executa (
    fk_sinfonia_id_sinfonia INT NOT NULL,
    fk_musico_cpf VARCHAR(14) NOT NULL,
    PRIMARY KEY (fk_sinfonia_id_sinfonia, fk_musico_cpf),
    FOREIGN KEY (fk_sinfonia_id_sinfonia) REFERENCES sinfonia(id_sinfonia),
    FOREIGN KEY (fk_musico_cpf) REFERENCES musico(cpf)
);


CREATE TABLE toca (
    fk_instrumento_musical_cod_instrumento INT NOT NULL,
    fk_musico_cpf VARCHAR(14) NOT NULL,
    PRIMARY KEY (fk_instrumento_musical_cod_instrumento, fk_musico_cpf),
    FOREIGN KEY (fk_instrumento_musical_cod_instrumento) REFERENCES instrumento_musical(cod_instrumento),
    FOREIGN KEY (fk_musico_cpf) REFERENCES musico(cpf)
);


--Alteração das tabelas para adicionar chaves estrangeiras (se essa forma for utilizada)

ALTER TABLE orquestra
ADD COLUMN fk_maestro_cpf VARCHAR(14),
ADD CONSTRAINT fk_maestro
    FOREIGN KEY (fk_maestro_cpf) REFERENCES maestro(cpf);

ALTER TABLE musico
ADD COLUMN fk_especialidade_id_especialidade INT,
ADD COLUMN fk_orquestra_id_orquestra INT,
ADD CONSTRAINT fk_especialidade
    FOREIGN KEY (fk_especialidade_id_especialidade) REFERENCES especialidade(id_especialidade),
ADD CONSTRAINT fk_orquestra
    FOREIGN KEY (fk_orquestra_id_orquestra) REFERENCES orquestra(id_orquestra);

ALTER TABLE apresenta
ADD COLUMN data DATE;

--Inserção dos Dados

INSERT INTO maestro (cpf, nome, nacionalidade, data_nasc)
VALUES
    ('456.789.012-34', 'Antônio Silva', 'Brasileiro', '1985-04-20'),
    ('567.890.123-45', 'Maria Oliveira', 'Brasileira', '1977-08-15'),
    ('678.901.234-56', 'José Pereira', 'Portugues', '1989-01-30'),
    ('789.012.345-67', 'Isabel Costa', 'Espanhola', '1973-06-10'),
    ('890.123.456-78', 'Luís Santos', 'Italiano', '1982-11-25'),
    ('901.234.567-89', 'Ana Ferreira', 'Francesa', '1970-07-05');

INSERT INTO sinfonia (nome, compositor, data_criacao)
VALUES
    ('Sinfonia da Primavera', 'Antônio Silva', '2005-02-10'),
    ('Sinfonia do Outono', 'Maria Oliveira', '2010-09-15'),
    ('Sinfonia do Inverno', 'José Pereira', '2015-12-20'),
    ('Sinfonia da Juventude', 'Isabel Costa', '2008-06-05'),
    ('Sinfonia da Maturidade', 'Luís Santos', '2013-03-30'),
    ('Sinfonia do Tempo', 'Ana Ferreira', '2019-08-25'),
    ('Sinfonia do Amanhecer', 'Antonio Vivaldi', '1723-03-20'),
    ('Sinfonia da Noite Estrelada', 'Ludwig van Beethoven', '1808-12-16'),
    ('Sinfonia dos Planetas', 'Gustav Holst', '1916-09-29'),
    ('Sinfonia do Novo Mundo', 'Antonín Dvořák', '1893-12-16'),
    ('Sinfonia do Destino', 'Pyotr Ilyich Tchaikovsky', '1877-11-04'),
    ('Sinfonia dos Brinquedos', 'Leopold Mozart', '1756-01-27'),
    ('Sinfonia do Renascimento', 'William Byrd', '1590-06-01'),
    ('Sinfonia da Meia-Noite', 'Jean Sibelius', '1903-04-14'),
    ('Sinfonia da Alvorada', 'Ralph Vaughan Williams', '1910-09-05'),
    ('Sinfonia da Aurora', 'Edvard Grieg', '1875-06-24');


INSERT INTO evento (nome, id_local, cidade, estado)
VALUES
    ('Concerto de Verão', 1, 'São Paulo', 'SP'),
    ('Festival de Música', 2, 'Rio de Janeiro', 'RJ'),
    ('Recital Clássico', 3, 'Lisboa', 'Lisboa'),
    ('Apresentação Sinfônica', 4, 'Berlim', 'Berlim'),
    ('Gala de Música', 5, 'Tóquio', 'Tóquio'),
    ('Concerto Noturno', 6, 'Paris', 'Île-de-France');

INSERT INTO instrumento_musical (nome, cod_instrumento, classificacao)
VALUES
    ('Violino', 1, 'Corda'),
    ('Trombone', 2, 'Metal'),
    ('Piano', 3, 'Teclado'),
    ('Flauta', 4, 'Sopro'),
    ('Violoncelo', 5, 'Corda'),
    ('Trompete', 6, 'Metal'),
    ('Banjo', 7, 'Corda'),
    ('Contrabaixo', 8, 'Corda'),
    ('Cavaquinho', 9, 'Corda'),
    ('Harpa', 10, 'Corda'),
    ('Urucungo', 11, 'Corda'),
    ('Rabeca', 12, 'Corda'),
    ('Cravo', 13, 'Corda'),
    ('Sintetizador', 14, 'Eletrônico'),
    ('Teclado', 15, 'Eletrônico'),
    ('Teremim', 16, 'Eletrônico'),
    ('Otamatone', 17, 'Eletrônico'),
    ('Caixa de rufo', 18, 'Percussão'),
    ('Atabaque', 19, 'Percussão'),
    ('Furruco', 20, 'Percussão'),
    ('Zurna', 21, 'Sopro'),
    ('Clarone', 22, 'Sopro'),
    ('Gaita', 23, 'Sopro'),
    ('Oboé', 24, 'Sopro'),
    ('Adufe', 25, 'Percussão'),
    ('Reco-reco', 26, 'Percussão'),
    ('Tamborim', 27, 'Percussão'),
    ('Ceramofone', 28, 'Percussão');



INSERT INTO especialidade (nome)
VALUES
    ('Regência'),
    ('Violino'),
    ('Piano'),
    ('Flauta'),
    ('Trombone'),
    ('Composição');

INSERT INTO orquestra (nome, cidade, pais, data_criacao, fk_maestro_cpf)
VALUES
    ('Orquestra Filarmônica de São Paulo', 'São Paulo', 'Brasil', '2000-01-15', '456.789.012-34'),
    ('Orquestra Sinfônica do Rio de Janeiro', 'Rio de Janeiro', 'Brasil', '1995-05-20', '567.890.123-45'),
    ('Orquestra Nacional de Lisboa', 'Lisboa', 'Portugal', '1988-10-10', '678.901.234-56'),
    ('Orquestra de Câmara de Paris', 'Paris', 'França', '1998-03-25', '789.012.345-67'),
    ('Orquestra Nacional de Berlim', 'Berlim', 'Alemanha', '1990-07-12', '890.123.456-78'),
    ('Orquestra Sinfônica de Tóquio', 'Tóquio', 'Japão', '2005-12-05', '901.234.567-89');

INSERT INTO musico (nome, cpf, nacionalidade, data_nascimento, fk_especialidade_id_especialidade, fk_orquestra_id_orquestra)
VALUES
    ('João Silva', '012.345.678-90', 'Brasileira', '1990-03-15', 1, 7),
    ('Ana Oliveira', '123.456.789-01', 'Brasileira', '1985-08-20', 2, 8),
    ('Carlos Pereira', '234.567.890-12', 'Portuguesa', '1993-01-25', 3, 9),
    ('Mariana Costa', '345.678.901-23', 'Espanhola', '1980-06-05', 4, 10),
    ('Rodrigo Santos', '456.789.012-34', 'Italiana', '1989-11-30', 5, 11),
    ('Isabela Ferreira', '567.890.123-45', 'Francesa', '1975-07-10', 6, 12);

INSERT INTO participa (fk_evento_id_local, fk_orquestra_id_orquestra)
VALUES
    (1, 7),
    (2, 8),
    (3, 9),
    (4, 10),
    (5, 11),
    (6, 12);

INSERT INTO apresenta (fk_sinfonia_id_sinfonia, fk_maestro_cpf, data)
VALUES
    (1, '456.789.012-34', '2023-05-10'),
    (2, '567.890.123-45', '2023-06-15'),
    (3, '678.901.234-56', '2023-07-20'),
    (4, '789.012.345-67', '2023-08-25'),
    (5, '890.123.456-78', '2023-09-30'),
    (6, '901.234.567-89', '2023-10-05');

INSERT INTO ocorre (fk_sinfonia_id_sinfonia, fk_evento_id_local)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6);

INSERT INTO executa (fk_sinfonia_id_sinfonia, fk_musico_cpf)
VALUES
    (1, '012.345.678-90'),
    (2, '123.456.789-01'),
    (3, '234.567.890-12'),
    (4, '345.678.901-23'),
    (5, '456.789.012-34'),
    (6, '567.890.123-45');

INSERT INTO toca (fk_instrumento_musical_cod_instrumento, fk_musico_cpf)
VALUES
    (1, '012.345.678-90'),
    (2, '123.456.789-01'),
    (3, '234.567.890-12'),
    (4, '345.678.901-23'),
    (5, '456.789.012-34'),
    (6, '567.890.123-45');



--Consultas

--1. Nome e data de nascimento do músico mais velho cadastrado na escola

SELECT nome, data_nascimento
FROM musico
ORDER BY data_nascimento ASC
LIMIT 1;

--2. Quantidade de instrumentos musicais de cada um dos tipos cadastrados

SELECT classificacao, COUNT(*) AS quantidade
FROM instrumento_musical
GROUP BY classificacao;

--3. Nome do músico e da sinfonia mais recentemente apresentada;

SELECT
    m.nome AS nome_musico,
    s.nome AS nome_sinfonia
FROM
    musico m
JOIN
    executa e ON m.cpf = e.fk_musico_cpf
JOIN
    apresenta a ON e.fk_sinfonia_id_sinfonia = a.fk_sinfonia_id_sinfonia
JOIN
    sinfonia s ON a.fk_sinfonia_id_sinfonia = s.id_sinfonia
ORDER BY
    a.data DESC
LIMIT 1;

--4. Nome e compositor da sinfonias mais antiga do cadastro
SELECT nome, compositor
FROM sinfonia
ORDER BY data_criacao ASC
LIMIT 1;

--5. Tipos de instrumentos que um determinado músico está apto a tocar
SELECT DISTINCT i.classificacao
FROM musico m
JOIN toca t ON m.cpf = t.fk_musico_cpf
JOIN instrumento_musical i ON t.fk_instrumento_musical_cod_instrumento = i.cod_instrumento
WHERE m.cpf = '012.345.678-90';

--6. Orquestras que tocaram uma determinada sinfonia
SELECT m.cpf
FROM apresenta a
JOIN maestro m ON a.fk_maestro_cpf = m.cpf
WHERE a.fk_sinfonia_id_sinfonia = 1;

SELECT orq.nome
FROM orquestra orq
WHERE orq.fk_maestro_cpf = '456.789.012-34';


--7. Músicos que pertencem a uma determinada orquestra.

SELECT nome, cpf, nacionalidade, data_nascimento
FROM musico
WHERE fk_orquestra_id_orquestra = 9;


--8. Função do músico tal na sinfonia tal.
SELECT e.nome
FROM executa ex
JOIN musico m ON ex.fk_musico_cpf = m.cpf
JOIN especialidade e ON m.fk_especialidade_id_especialidade = e.id_especialidade
WHERE ex.fk_sinfonia_id_sinfonia = 4;

--9. Encontrar todos os eventos em uma determinada cidade.
SELECT *
FROM evento
WHERE cidade = 'São Paulo';

--10. Obter a contagem de músicos por especialidade:
SELECT e.nome AS especialidade, COUNT(*) AS quantidade
FROM musico m
JOIN especialidade e ON m.fk_especialidade_id_especialidade = e.id_especialidade
GROUP BY e.nome;

--11. Listar todas as sinfonias apresentadas por um maestro específico:
SELECT s.*
FROM sinfonia s
JOIN apresenta a ON s.id_sinfonia = a.fk_sinfonia_id_sinfonia
WHERE a.fk_maestro_cpf = '456.789.012-34';

--12. Listar todas as orquestras que apresentaram em um evento específico:
SELECT o.*
FROM orquestra o
JOIN participa p ON o.id_orquestra = p.fk_orquestra_id_orquestra
WHERE p.fk_evento_id_local = 3;
