-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14/11/2023 às 13:49
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbaula`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamento`
--

CREATE TABLE `departamento` (
  `ID_Depto` int(11) NOT NULL,
  `NomeDepto` varchar(30) NOT NULL,
  `ID_Gerente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `departamento`
--

INSERT INTO `departamento` (`ID_Depto`, `NomeDepto`, `ID_Gerente`) VALUES
(1, 'Pesquisa', NULL),
(2, 'Administra??o', NULL),
(3, 'Inform?tica', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `empregado`
--

CREATE TABLE `empregado` (
  `idemp` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `secao` int(11) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `chefe` int(11) DEFAULT NULL,
  `salario` decimal(8,2) NOT NULL,
  `comissao` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `empregado`
--

INSERT INTO `empregado` (`idemp`, `nome`, `secao`, `cargo`, `chefe`, `salario`, `comissao`) VALUES
(1, 'Ana Paula', 10, 'Programador', NULL, 3000.00, 10.00),
(2, 'Gustavo Henrique', 70, 'Engenheiro', NULL, 2500.00, 40.00),
(3, '?lvaro Dias', 50, 'Administrador', NULL, 2500.00, 0.00),
(4, 'Ant?nio Carlos', 10, 'Engenheiro', NULL, 2400.00, 20.00),
(5, 'Susana Silva', 20, 'Administrador', NULL, 2750.00, 30.00),
(6, 'Cl?udio Jos?', 60, 'Vendedor', NULL, 1000.00, 50.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `ID_Func` int(11) NOT NULL,
  `NomeFunc` varchar(30) NOT NULL,
  `Endereco` varchar(50) NOT NULL,
  `DataNasc` date NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Salario` decimal(8,2) NOT NULL,
  `E_mail` varchar(50) DEFAULT NULL,
  `ID_Depto` int(11) NOT NULL
) ;

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`ID_Func`, `NomeFunc`, `Endereco`, `DataNasc`, `Sexo`, `Salario`, `E_mail`, `ID_Depto`) VALUES
(1, 'Caio', 'Rua A, 123', '2000-05-12', 'M', 1500.00, 'caio@gmail.com', 1),
(2, 'Maria', 'Rua B, 456', '2001-10-10', 'F', 2200.00, 'maria@gmail.com', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `secao`
--

CREATE TABLE `secao` (
  `idsec` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `secao`
--

INSERT INTO `secao` (`idsec`, `nome`, `cidade`) VALUES
(10, 'Fabrica', 'Recife'),
(20, 'Comercial', 'Recife'),
(30, 'Marketing', 'Campina Grande'),
(40, 'Planejamento', 'Jo?o Pessoa'),
(50, 'Administra??o', 'Recife'),
(60, 'Inform?tica', 'Campina Grande'),
(70, 'Recursos Humanos', 'Jo?o Pessoa');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`ID_Depto`),
  ADD UNIQUE KEY `uk_nome` (`NomeDepto`),
  ADD KEY `fk_depto_func` (`ID_Gerente`);

--
-- Índices de tabela `empregado`
--
ALTER TABLE `empregado`
  ADD PRIMARY KEY (`idemp`),
  ADD KEY `secao` (`secao`),
  ADD KEY `chefe` (`chefe`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`ID_Func`),
  ADD KEY `fk_func_depto` (`ID_Depto`);

--
-- Índices de tabela `secao`
--
ALTER TABLE `secao`
  ADD PRIMARY KEY (`idsec`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `fk_depto_func` FOREIGN KEY (`ID_Gerente`) REFERENCES `funcionario` (`ID_Func`);

--
-- Restrições para tabelas `empregado`
--
ALTER TABLE `empregado`
  ADD CONSTRAINT `empregado_ibfk_1` FOREIGN KEY (`secao`) REFERENCES `secao` (`idsec`),
  ADD CONSTRAINT `empregado_ibfk_2` FOREIGN KEY (`chefe`) REFERENCES `empregado` (`idemp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;