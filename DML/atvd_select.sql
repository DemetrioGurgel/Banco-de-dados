mysql -u root

-- Cria um arquivo que salva tudo que é exibido no terminal
tee comandos.txt

CREATE TABLE Departamento (
ID_Depto INT NOT NULL,
NomeDepto VARCHAR(30) NOT NULL,
ID_Gerente INT NULL,
CONSTRAINT pk_depto PRIMARY KEY (ID_Depto),
CONSTRAINT uk_nome UNIQUE (NomeDepto)
);

CREATE TABLE Funcionario (
ID_Func INT NOT NULL,
NomeFunc VARCHAR(30) NOT NULL,
Endereco VARCHAR(50) NOT NULL,
DataNasc DATE NOT NULL,
Sexo CHAR(1) NOT NULL,
Salario NUMERIC(8,2) NOT NULL,
E_mail VARCHAR(50) NULL,
ID_Depto INT NOT NULL,
CONSTRAINT pk_func PRIMARY KEY (ID_Func),
CONSTRAINT ck_sexo CHECK (Sexo='M' or Sexo='F')

ALTER TABLE Funcionario
ADD CONSTRAINT fk_func_depto FOREIGN KEY (ID_Depto) REFERENCES Departamento
(ID_Depto);

ALTER TABLE Departamento
ADD CONSTRAINT fk_depto_func FOREIGN KEY (ID_Gerente) REFERENCES Funcionario
(ID_Func);

-- 1 questão)
INSERT INTO Departamento (ID_Depto, NomeDepto) VALUES (1, 'Pesquisa');
INSERT INTO Departamento (ID_Depto, NomeDepto) VALUES (2, 'Administração');
INSERT INTO Departamento (ID_Depto, NomeDepto) VALUES (3, 'Informática');

-- 2 questão)
INSERT INTO Funcionario (ID_Func, NomeFunc, Endereco, DataNasc, Sexo, Salario, E_mail, ID_Depto)
VALUES (1, 'Caio', 'Rua A, 123', '2000-05-12', 'M', 1500.00, 'caio@gmail.com', 1);

INSERT INTO Funcionario (ID_Func, NomeFunc, Endereco, DataNasc, Sexo, Salario, E_mail, ID_Depto)
VALUES (2, 'Maria', 'Rua B, 456', '2001-10-10', 'F', 2200.00, 'maria@gmail.com', 2);

INSERT INTO Funcionario (ID_Func, NomeFunc, Endereco, DataNasc, Sexo, Salario, E_mail, ID_Depto)
VALUES (3, 'Demetrio', 'Rua C, 789', '2002-12-10', 'M', 9000.00, 'demetrio@gmail.com', 3);

-- 3 questão)
UPDATE Departamento SET ID_Gerente = 1 WHERE ID_Depto = 1;
UPDATE Departamento SET ID_Gerente = 2 WHERE ID_Depto = 2;
UPDATE Departamento SET ID_Gerente = 3 WHERE ID_Depto = 3;

-- 4 questão)
SELECT * FROM Funcionario WHERE ID_Depto = 1;

-- 5 questão)
SELECT * FROM Funcionario WHERE Salario BETWEEN 800.00 AND 1200.00;

-- 6 questão)
SELECT * FROM Funcionario WHERE NomeFunc LIKE 'A%';

-- 7 questão)
SELECT NomeFunc, DataNasc, Salario
FROM Funcionario
WHERE Sexo = 'F' AND Salario > 1000.00
ORDER BY Salario DESC;

-- 8 questão) 
SELECT * FROM Funcionario WHERE Sexo = 'M' AND NomeFunc LIKE '%Silva%';

-- 9 questão)
SELECT ID_Func, NomeFunc, Endereco
FROM Funcionario
WHERE ID_Depto = 2 AND E_mail IS NULL;

-- 10 questão)
UPDATE departamento set ID_Gerente=null;
DELETE FROM Funcionario WHERE ID_Depto = 3;


-- Criar tabela Secao
CREATE TABLE Secao (
    idsec INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

-- Inserir dados na tabela Secao
INSERT INTO Secao (idsec, nome, cidade) VALUES
(10, 'Fabrica', 'Recife'),
(20, 'Comercial', 'Recife'),
(30, 'Marketing', 'Campina Grande'),
(40, 'Planejamento', 'João Pessoa'),
(50, 'Administração', 'Recife'),
(60, 'Informática', 'Campina Grande'),
(70, 'Recursos Humanos', 'João Pessoa');


-- Criar tabela Empregado
CREATE TABLE Empregado (
    idemp INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    secao INT NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    chefe INT,
    salario DECIMAL(8,2) NOT NULL,
    comissao DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (secao) REFERENCES Secao(idsec),
    FOREIGN KEY (chefe) REFERENCES Empregado(idemp)
);

-- Inserir dados na tabela Empregado
INSERT INTO Empregado (idemp, nome, secao, cargo, salario, comissao) VALUES
(1, 'Ana Paula', 10, 'Programador', 3000.00, 10.00),
(2, 'Gustavo Henrique', 70, 'Engenheiro', 2500.00, 40.00),
(3, 'Álvaro Dias', 50, 'Administrador', 2500.00, 0.00),
(4, 'Antônio Carlos', 10, 'Engenheiro', 2400.00, 20.00),
(5, 'Susana Silva', 20, 'Administrador', 2750.00, 30.00),
(6, 'Cláudio José', 60, 'Vendedor', 1000.00, 50.00);


-- 1 questão)
SELECT MIN(salario) AS menor_salario, AVG(salario) AS media_salarios
FROM Empregado;

-- 2 questão)
SELECT cidade, COUNT(DISTINCT idsec) AS quantidade_secoes
FROM Secao
GROUP BY cidade;

-- 3 questão)
SELECT e.secao, COUNT(e.idemp) AS quantidade_empregados, SUM(e.salario) AS total_salarios_sem_comissao
FROM Empregado e
GROUP BY e.secao;

-- 4 questão)
SELECT cargo, COUNT(idemp) AS quantidade_empregados, AVG(salario) AS salario_medio
FROM Empregado
GROUP BY cargo;

-- 5 questão)
SELECT MAX(salario + (salario * comissao / 100)) AS salario_mais_alto
FROM Empregado;

-- 6 questão)
SELECT cargo, COUNT(idemp) AS quantidade_empregados, AVG(salario) AS salario_medio
FROM Empregado
GROUP BY cargo
HAVING COUNT(idemp) >= 2;

-- 7 questão)
SELECT cargo, MAX(salario + (salario * comissao / 100)) AS salario_mais_alto_por_cargo
FROM Empregado
GROUP BY cargo;

-- 8 questão)
SELECT cargo, AVG(salario) AS salario_medio
FROM Empregado
WHERE cargo <> 'Administrador'
GROUP BY cargo;

-- 9 questão)
SELECT COUNT(DISTINCT cidade) AS quantidade_cidades_atendidas
FROM Secao;

-- 10 questão)
SELECT COUNT(idemp) AS quantidade_empregados_sem_chefe
FROM Empregado
WHERE chefe IS NULL;

-- 11 questão)
SELECT secao, SUM(salario) AS custo_total
FROM Empregado
GROUP BY secao
HAVING SUM(salario) > 2500.00;

-- 12 questão)
SELECT
    cargo,
    SUM(salario) AS total_salario
FROM
    Empregado
WHERE
    cargo IN ('Programador', 'Engenheiro', 'Administrador', 'Vendedor')
GROUP BY
    cargo
ORDER BY
    CASE cargo
        WHEN 'Programador' THEN 1
        WHEN 'Engenheiro' THEN 2
        WHEN 'Administrador' THEN 3
        WHEN 'Vendedor' THEN 4
    END;