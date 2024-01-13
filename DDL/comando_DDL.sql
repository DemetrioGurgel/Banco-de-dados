-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Tempo de geração: 01-Nov-2023 às 19:04
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `consultorio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `consultas`
--

CREATE TABLE `consultas` (
  `Codigo_Consulta` int(11) NOT NULL,
  `Data_Horario` datetime DEFAULT NULL,
  `CRM_Medico` varchar(15) DEFAULT NULL,
  `RG_Paciente` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `medicos`
--

CREATE TABLE `medicos` (
  `CRM` varchar(15) NOT NULL,
  `Nome` varchar(40) NOT NULL,
  `Idade` int(11) DEFAULT NULL CHECK (`Idade` > 23),
  `Especialidade` char(20) NOT NULL DEFAULT 'Ortopedia',
  `CPF` varchar(15) NOT NULL,
  `Data_Admissao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pacientes`
--

CREATE TABLE `pacientes` (
  `RG` varchar(15) NOT NULL,
  `Nome` varchar(40) NOT NULL,
  `Data_Nascimento` date DEFAULT NULL,
  `Cidade` char(30) DEFAULT 'Itabuna',
  `Doenca` varchar(40) NOT NULL,
  `Plano_Saude` varchar(40) NOT NULL DEFAULT 'SUS'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sala`
--

CREATE TABLE `sala` (
  `Numero_Sala` int(11) NOT NULL,
  `Andar` int(11) DEFAULT NULL
) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`Codigo_Consulta`),
  ADD KEY `CRM_Medico` (`CRM_Medico`),
  ADD KEY `RG_Paciente` (`RG_Paciente`);

--
-- Índices para tabela `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`CRM`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- Índices para tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`RG`);

--
-- Índices para tabela `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`Numero_Sala`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`CRM_Medico`) REFERENCES `medicos` (`CRM`),
  ADD CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`RG_Paciente`) REFERENCES `pacientes` (`RG`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
