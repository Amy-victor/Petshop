-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/08/2024 às 22:36
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `petshop`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `animais`
--

CREATE TABLE `animais` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `especie` varchar(100) DEFAULT NULL,
  `raca` varchar(100) DEFAULT NULL,
  `fk_clientes_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `animais`
--

INSERT INTO `animais` (`id`, `nome`, `especie`, `raca`, `fk_clientes_id`) VALUES
(1, 'Rex', 'Cão', 'Labrador', 1),
(2, 'Mia', 'Gato', 'Siamês', 2),
(3, 'Bob', 'Cão', 'Poodle', 3),
(4, 'Luna', 'Gato', 'Persa', 4),
(5, 'Max', 'Cão', 'Bulldog', 5),
(6, 'Rodinei', NULL, NULL, NULL),
(7, 'Maria', NULL, NULL, NULL),
(8, 'Aranha', NULL, NULL, NULL),
(9, 'Victor', 'Gay', 'Preto', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `animais_produtos`
--

CREATE TABLE `animais_produtos` (
  `fk_produtos_id` int(11) DEFAULT NULL,
  `fk_animais_id` int(11) DEFAULT NULL,
  `data_uso_produto` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `animais_produtos`
--

INSERT INTO `animais_produtos` (`fk_produtos_id`, `fk_animais_id`, `data_uso_produto`) VALUES
(1, 1, '2024-08-01'),
(4, 1, '2024-08-02'),
(2, 2, '2024-08-05'),
(3, 3, '2024-08-10'),
(5, 4, '2024-08-12'),
(1, 5, '2024-08-15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `animais_servicos`
--

CREATE TABLE `animais_servicos` (
  `fk_animais_id` int(11) DEFAULT NULL,
  `fk_servicos_id` int(11) DEFAULT NULL,
  `data_uso_servico` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `animais_servicos`
--

INSERT INTO `animais_servicos` (`fk_animais_id`, `fk_servicos_id`, `data_uso_servico`) VALUES
(1, 1, '2024-08-03'),
(2, 2, '2024-08-07'),
(3, 3, '2024-08-14'),
(4, 4, '2024-08-16'),
(5, 5, '2024-08-20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `telefone`, `endereco`) VALUES
(0, '', NULL, ''),
(1, 'Ana Silva', '1234-5678', 'Rua das Flores, 123'),
(2, 'Carlos Oliveira', '9876-5432', 'Avenida Brasil, 456'),
(3, 'Fernanda Santos', '5555-1234', 'Praça da Liberdade, 789'),
(4, 'João Pereira', '4444-5678', 'Rua das Acácias, 321'),
(5, 'Mariana Costa', '6666-7890', 'Rua dos Jacarandás, 654'),
(7, 'Victor', NULL, 'Rua das Flores, 567'),
(8, 'Amanda', NULL, 'Rua Roberto Carlos, 453'),
(10, 'victor', NULL, 'Rua das Flores, 567'),
(11, 'Rodinei', NULL, 'Rua das Flores, 567'),
(12, 'sabonete', NULL, 'Rua das Flores, 567'),
(13, 'Rodinei', '6768-3031', 'Rua Albeomiro Correia n.32'),
(14, 'Amy', '9445-4035', 'Rua Virg?nia Rocha n.405');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `preco`) VALUES
(1, 'Ração para Cães', 'Ração balanceada para cães adultos.', 150.00),
(2, 'Ração para Gatos', 'Ração nutritiva para gatos filhotes.', 120.00),
(3, 'Shampoo Pet', 'Shampoo antialérgico para pets.', 45.50),
(4, 'Brinquedo para Cães', 'Brinquedo resistente para cães.', 25.75),
(5, 'Cama para Gatos', 'Cama macia e confortável para gatos.', 80.00),
(99, 'sab?o', 'existe', 34.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servicos`
--

INSERT INTO `servicos` (`id`, `nome`, `descricao`, `preco`) VALUES
(1, 'Banho e Tosa', 'Serviço completo de banho e tosa para cães e gatos.', 80.00),
(2, 'Consulta Veterinária', 'Consulta com veterinário para avaliação geral.', 120.00),
(3, 'Vacinação', 'Aplicação de vacinas para cães e gatos.', 90.00),
(4, 'Check-up Geral', 'Exame completo para diagnóstico de saúde.', 150.00),
(5, 'Clínica de Emergência', 'Atendimento emergencial para situações urgentes.', 200.00);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `animais`
--
ALTER TABLE `animais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_animais_2` (`fk_clientes_id`);

--
-- Índices de tabela `animais_produtos`
--
ALTER TABLE `animais_produtos`
  ADD KEY `FK_animais_produtos_1` (`fk_produtos_id`),
  ADD KEY `FK_animais_produtos_2` (`fk_animais_id`);

--
-- Índices de tabela `animais_servicos`
--
ALTER TABLE `animais_servicos`
  ADD KEY `FK_animais_servicos_1` (`fk_animais_id`),
  ADD KEY `FK_animais_servicos_2` (`fk_servicos_id`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animais`
--
ALTER TABLE `animais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `animais`
--
ALTER TABLE `animais`
  ADD CONSTRAINT `FK_animais_2` FOREIGN KEY (`fk_clientes_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `animais_produtos`
--
ALTER TABLE `animais_produtos`
  ADD CONSTRAINT `FK_animais_produtos_1` FOREIGN KEY (`fk_produtos_id`) REFERENCES `produtos` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_animais_produtos_2` FOREIGN KEY (`fk_animais_id`) REFERENCES `animais` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `animais_servicos`
--
ALTER TABLE `animais_servicos`
  ADD CONSTRAINT `FK_animais_servicos_1` FOREIGN KEY (`fk_animais_id`) REFERENCES `animais` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_animais_servicos_2` FOREIGN KEY (`fk_servicos_id`) REFERENCES `servicos` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
