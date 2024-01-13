-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/12/2023 às 02:40
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
-- Banco de dados: `escola_de_musica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `apresenta`
--

CREATE TABLE `apresenta` (
  `fk_sinfonia_id_sinfonia` int(11) NOT NULL,
  `fk_maestro_cpf` varchar(14) NOT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `apresenta`
--

INSERT INTO `apresenta` (`fk_sinfonia_id_sinfonia`, `fk_maestro_cpf`, `data`) VALUES
(1, '456.789.012-34', '2023-05-10'),
(2, '567.890.123-45', '2023-06-15'),
(3, '678.901.234-56', '2023-07-20'),
(4, '789.012.345-67', '2023-08-25'),
(5, '890.123.456-78', '2023-09-30'),
(6, '901.234.567-89', '2023-10-05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `especialidade`
--

CREATE TABLE `especialidade` (
  `nome` varchar(255) NOT NULL,
  `id_especialidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `especialidade`
--

INSERT INTO `especialidade` (`nome`, `id_especialidade`) VALUES
('Regência', 1),
('Violino', 2),
('Piano', 3),
('Flauta', 4),
('Trombone', 5),
('Composição', 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `evento`
--

CREATE TABLE `evento` (
  `nome` varchar(255) NOT NULL,
  `id_local` int(11) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `evento`
--

INSERT INTO `evento` (`nome`, `id_local`, `cidade`, `estado`) VALUES
('Concerto de Verão', 1, 'São Paulo', 'SP'),
('Festival de Música', 2, 'Rio de Janeiro', 'RJ'),
('Recital Clássico', 3, 'Lisboa', 'Lisboa'),
('Apresentação Sinfônica', 4, 'Berlim', 'Berlim'),
('Gala de Música', 5, 'Tóquio', 'Tóquio'),
('Concerto Noturno', 6, 'Paris', 'Île-de-France');

-- --------------------------------------------------------

--
-- Estrutura para tabela `executa`
--

CREATE TABLE `executa` (
  `fk_sinfonia_id_sinfonia` int(11) NOT NULL,
  `fk_musico_cpf` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `executa`
--

INSERT INTO `executa` (`fk_sinfonia_id_sinfonia`, `fk_musico_cpf`) VALUES
(1, '012.345.678-90'),
(2, '123.456.789-01'),
(3, '234.567.890-12'),
(4, '345.678.901-23'),
(5, '456.789.012-34'),
(6, '567.890.123-45');

-- --------------------------------------------------------

--
-- Estrutura para tabela `instrumento_musical`
--

CREATE TABLE `instrumento_musical` (
  `nome` varchar(255) NOT NULL,
  `cod_instrumento` int(11) NOT NULL,
  `classificacao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `instrumento_musical`
--

INSERT INTO `instrumento_musical` (`nome`, `cod_instrumento`, `classificacao`) VALUES
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

-- --------------------------------------------------------

--
-- Estrutura para tabela `maestro`
--

CREATE TABLE `maestro` (
  `data_nasc` date NOT NULL,
  `nacionalidade` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `maestro`
--

INSERT INTO `maestro` (`data_nasc`, `nacionalidade`, `cpf`, `nome`) VALUES
('1985-04-20', 'Brasileiro', '456.789.012-34', 'Antônio Silva'),
('1977-08-15', 'Brasileira', '567.890.123-45', 'Maria Oliveira'),
('1989-01-30', 'Portugues', '678.901.234-56', 'José Pereira'),
('1973-06-10', 'Espanhola', '789.012.345-67', 'Isabel Costa'),
('1982-11-25', 'Italiano', '890.123.456-78', 'Luís Santos'),
('1970-07-05', 'Francesa', '901.234.567-89', 'Ana Ferreira');

-- --------------------------------------------------------

--
-- Estrutura para tabela `musico`
--

CREATE TABLE `musico` (
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `nacionalidade` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `fk_especialidade_id_especialidade` int(11) DEFAULT NULL,
  `fk_orquestra_id_orquestra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `musico`
--

INSERT INTO `musico` (`nome`, `cpf`, `nacionalidade`, `data_nascimento`, `fk_especialidade_id_especialidade`, `fk_orquestra_id_orquestra`) VALUES
('João Silva', '012.345.678-90', 'Brasileira', '1990-03-15', 1, 7),
('Ana Oliveira', '123.456.789-01', 'Brasileira', '1985-08-20', 2, 8),
('Carlos Pereira', '234.567.890-12', 'Portuguesa', '1993-01-25', 3, 9),
('Mariana Costa', '345.678.901-23', 'Espanhola', '1980-06-05', 4, 10),
('Rodrigo Santos', '456.789.012-34', 'Italiana', '1989-11-30', 5, 11),
('Isabela Ferreira', '567.890.123-45', 'Francesa', '1975-07-10', 6, 12);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ocorre`
--

CREATE TABLE `ocorre` (
  `fk_sinfonia_id_sinfonia` int(11) NOT NULL,
  `fk_evento_id_local` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `ocorre`
--

INSERT INTO `ocorre` (`fk_sinfonia_id_sinfonia`, `fk_evento_id_local`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `orquestra`
--

CREATE TABLE `orquestra` (
  `pais` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `data_criacao` date NOT NULL,
  `id_orquestra` int(11) NOT NULL,
  `fk_maestro_cpf` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `orquestra`
--

INSERT INTO `orquestra` (`pais`, `nome`, `cidade`, `data_criacao`, `id_orquestra`, `fk_maestro_cpf`) VALUES
('Brasil', 'Orquestra Filarmônica de São Paulo', 'São Paulo', '2000-01-15', 1, '456.789.012-34'),
('Brasil', 'Orquestra Sinfônica do Rio de Janeiro', 'Rio de Janeiro', '1995-05-20', 2, '567.890.123-45'),
('Portugal', 'Orquestra Nacional de Lisboa', 'Lisboa', '1988-10-10', 3, '678.901.234-56'),
('França', 'Orquestra de Câmara de Paris', 'Paris', '1998-03-25', 4, '789.012.345-67'),
('Alemanha', 'Orquestra Nacional de Berlim', 'Berlim', '1990-07-12', 5, '890.123.456-78'),
('Japão', 'Orquestra Sinfônica de Tóquio', 'Tóquio', '2005-12-05', 6, '901.234.567-89'),
('Brasil', 'Orquestra Filarmônica de São Paulo', 'São Paulo', '2000-01-15', 7, '456.789.012-34'),
('Brasil', 'Orquestra Sinfônica do Rio de Janeiro', 'Rio de Janeiro', '1995-05-20', 8, '567.890.123-45'),
('Portugal', 'Orquestra Nacional de Lisboa', 'Lisboa', '1988-10-10', 9, '678.901.234-56'),
('França', 'Orquestra de Câmara de Paris', 'Paris', '1998-03-25', 10, '789.012.345-67'),
('Alemanha', 'Orquestra Nacional de Berlim', 'Berlim', '1990-07-12', 11, '890.123.456-78'),
('Japão', 'Orquestra Sinfônica de Tóquio', 'Tóquio', '2005-12-05', 12, '901.234.567-89');

-- --------------------------------------------------------

--
-- Estrutura para tabela `participa`
--

CREATE TABLE `participa` (
  `fk_evento_id_local` int(11) NOT NULL,
  `fk_orquestra_id_orquestra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `participa`
--

INSERT INTO `participa` (`fk_evento_id_local`, `fk_orquestra_id_orquestra`) VALUES
(1, 7),
(2, 8),
(3, 9),
(4, 10),
(5, 11),
(6, 12);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sinfonia`
--

CREATE TABLE `sinfonia` (
  `nome` varchar(255) NOT NULL,
  `id_sinfonia` int(11) NOT NULL,
  `compositor` varchar(255) NOT NULL,
  `data_criacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `sinfonia`
--

INSERT INTO `sinfonia` (`nome`, `id_sinfonia`, `compositor`, `data_criacao`) VALUES
('Sinfonia da Primavera', 1, 'Antônio Silva', '2005-02-10'),
('Sinfonia do Outono', 2, 'Maria Oliveira', '2010-09-15'),
('Sinfonia do Inverno', 3, 'José Pereira', '2015-12-20'),
('Sinfonia da Juventude', 4, 'Isabel Costa', '2008-06-05'),
('Sinfonia da Maturidade', 5, 'Luís Santos', '2013-03-30'),
('Sinfonia do Tempo', 6, 'Ana Ferreira', '2019-08-25'),
('Sinfonia do Amanhecer', 7, 'Antonio Vivaldi', '1723-03-20'),
('Sinfonia da Noite Estrelada', 8, 'Ludwig van Beethoven', '1808-12-16'),
('Sinfonia dos Planetas', 9, 'Gustav Holst', '1916-09-29'),
('Sinfonia do Novo Mundo', 10, 'Antonín Dvořák', '1893-12-16'),
('Sinfonia do Destino', 11, 'Pyotr Ilyich Tchaikovsky', '1877-11-04'),
('Sinfonia dos Brinquedos', 12, 'Leopold Mozart', '1756-01-27'),
('Sinfonia do Renascimento', 13, 'William Byrd', '1590-06-01'),
('Sinfonia da Meia-Noite', 14, 'Jean Sibelius', '1903-04-14'),
('Sinfonia da Alvorada', 15, 'Ralph Vaughan Williams', '1910-09-05'),
('Sinfonia da Aurora', 16, 'Edvard Grieg', '1875-06-24');

-- --------------------------------------------------------

--
-- Estrutura para tabela `toca`
--

CREATE TABLE `toca` (
  `fk_instrumento_musical_cod_instrumento` int(11) NOT NULL,
  `fk_musico_cpf` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `toca`
--

INSERT INTO `toca` (`fk_instrumento_musical_cod_instrumento`, `fk_musico_cpf`) VALUES
(1, '012.345.678-90'),
(2, '123.456.789-01'),
(3, '234.567.890-12'),
(4, '345.678.901-23'),
(5, '456.789.012-34'),
(6, '567.890.123-45');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `apresenta`
--
ALTER TABLE `apresenta`
  ADD PRIMARY KEY (`fk_sinfonia_id_sinfonia`,`fk_maestro_cpf`),
  ADD KEY `fk_maestro_cpf` (`fk_maestro_cpf`);

--
-- Índices de tabela `especialidade`
--
ALTER TABLE `especialidade`
  ADD PRIMARY KEY (`id_especialidade`);

--
-- Índices de tabela `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_local`);

--
-- Índices de tabela `executa`
--
ALTER TABLE `executa`
  ADD PRIMARY KEY (`fk_sinfonia_id_sinfonia`,`fk_musico_cpf`),
  ADD KEY `fk_musico_cpf` (`fk_musico_cpf`);

--
-- Índices de tabela `instrumento_musical`
--
ALTER TABLE `instrumento_musical`
  ADD PRIMARY KEY (`cod_instrumento`);

--
-- Índices de tabela `maestro`
--
ALTER TABLE `maestro`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `musico`
--
ALTER TABLE `musico`
  ADD PRIMARY KEY (`cpf`),
  ADD KEY `fk_especialidade` (`fk_especialidade_id_especialidade`),
  ADD KEY `fk_orquestra` (`fk_orquestra_id_orquestra`);

--
-- Índices de tabela `ocorre`
--
ALTER TABLE `ocorre`
  ADD PRIMARY KEY (`fk_sinfonia_id_sinfonia`,`fk_evento_id_local`),
  ADD KEY `fk_evento_id_local` (`fk_evento_id_local`);

--
-- Índices de tabela `orquestra`
--
ALTER TABLE `orquestra`
  ADD PRIMARY KEY (`id_orquestra`),
  ADD KEY `fk_maestro` (`fk_maestro_cpf`);

--
-- Índices de tabela `participa`
--
ALTER TABLE `participa`
  ADD PRIMARY KEY (`fk_evento_id_local`,`fk_orquestra_id_orquestra`),
  ADD KEY `fk_orquestra_id_orquestra` (`fk_orquestra_id_orquestra`);

--
-- Índices de tabela `sinfonia`
--
ALTER TABLE `sinfonia`
  ADD PRIMARY KEY (`id_sinfonia`);

--
-- Índices de tabela `toca`
--
ALTER TABLE `toca`
  ADD PRIMARY KEY (`fk_instrumento_musical_cod_instrumento`,`fk_musico_cpf`),
  ADD KEY `fk_musico_cpf` (`fk_musico_cpf`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `especialidade`
--
ALTER TABLE `especialidade`
  MODIFY `id_especialidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `evento`
--
ALTER TABLE `evento`
  MODIFY `id_local` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `orquestra`
--
ALTER TABLE `orquestra`
  MODIFY `id_orquestra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `sinfonia`
--
ALTER TABLE `sinfonia`
  MODIFY `id_sinfonia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `apresenta`
--
ALTER TABLE `apresenta`
  ADD CONSTRAINT `apresenta_ibfk_1` FOREIGN KEY (`fk_sinfonia_id_sinfonia`) REFERENCES `sinfonia` (`id_sinfonia`),
  ADD CONSTRAINT `apresenta_ibfk_2` FOREIGN KEY (`fk_maestro_cpf`) REFERENCES `maestro` (`cpf`);

--
-- Restrições para tabelas `executa`
--
ALTER TABLE `executa`
  ADD CONSTRAINT `executa_ibfk_1` FOREIGN KEY (`fk_sinfonia_id_sinfonia`) REFERENCES `sinfonia` (`id_sinfonia`),
  ADD CONSTRAINT `executa_ibfk_2` FOREIGN KEY (`fk_musico_cpf`) REFERENCES `musico` (`cpf`);

--
-- Restrições para tabelas `musico`
--
ALTER TABLE `musico`
  ADD CONSTRAINT `fk_especialidade` FOREIGN KEY (`fk_especialidade_id_especialidade`) REFERENCES `especialidade` (`id_especialidade`),
  ADD CONSTRAINT `fk_orquestra` FOREIGN KEY (`fk_orquestra_id_orquestra`) REFERENCES `orquestra` (`id_orquestra`);

--
-- Restrições para tabelas `ocorre`
--
ALTER TABLE `ocorre`
  ADD CONSTRAINT `ocorre_ibfk_1` FOREIGN KEY (`fk_sinfonia_id_sinfonia`) REFERENCES `sinfonia` (`id_sinfonia`),
  ADD CONSTRAINT `ocorre_ibfk_2` FOREIGN KEY (`fk_evento_id_local`) REFERENCES `evento` (`id_local`);

--
-- Restrições para tabelas `orquestra`
--
ALTER TABLE `orquestra`
  ADD CONSTRAINT `fk_maestro` FOREIGN KEY (`fk_maestro_cpf`) REFERENCES `maestro` (`cpf`);

--
-- Restrições para tabelas `participa`
--
ALTER TABLE `participa`
  ADD CONSTRAINT `participa_ibfk_1` FOREIGN KEY (`fk_evento_id_local`) REFERENCES `evento` (`id_local`),
  ADD CONSTRAINT `participa_ibfk_2` FOREIGN KEY (`fk_orquestra_id_orquestra`) REFERENCES `orquestra` (`id_orquestra`);

--
-- Restrições para tabelas `toca`
--
ALTER TABLE `toca`
  ADD CONSTRAINT `toca_ibfk_1` FOREIGN KEY (`fk_instrumento_musical_cod_instrumento`) REFERENCES `instrumento_musical` (`cod_instrumento`),
  ADD CONSTRAINT `toca_ibfk_2` FOREIGN KEY (`fk_musico_cpf`) REFERENCES `musico` (`cpf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
