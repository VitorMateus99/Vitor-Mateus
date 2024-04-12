-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12/04/2024 às 02:06
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja_artigos_esportivos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `Id_Categorias` int(11) NOT NULL,
  `Nome_Categorias` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`Id_Categorias`, `Nome_Categorias`) VALUES
(1, 'Futebol'),
(2, 'Basquete'),
(3, 'Corrida'),
(4, 'Futebol Americano');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `Id_Cliente` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Sexo` char(1) NOT NULL CHECK (`Sexo` in ('F','M')),
  `CPF` bigint(20) NOT NULL,
  `DataNascimento` date NOT NULL,
  `Telefone` int(11) NOT NULL,
  `Cep` int(8) NOT NULL,
  `Rua` varchar(100) NOT NULL,
  `Cidade` varchar(100) NOT NULL,
  `Estado` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`Id_Cliente`, `Nome`, `Sexo`, `CPF`, `DataNascimento`, `Telefone`, `Cep`, `Rua`, `Cidade`, `Estado`) VALUES
(1, 'Maria Silva', 'F', 12345678901, '1990-05-15', 2147483647, 91000000, 'Rua A', 'Porto Alegre', 'RS'),
(2, 'João Santos', 'M', 98765432109, '1985-10-20', 2147483647, 91011111, 'Rua B', 'Alvorada', 'RS'),
(3, 'Ana Oliveira', 'F', 45678912301, '1988-07-12', 2147483647, 91022222, 'Rua C', 'Canoas', 'RS'),
(4, 'Pedro Lima', 'M', 78945612309, '1992-02-28', 2147483647, 91033333, 'Rua D', 'Santa Maria', 'RS'),
(5, 'Vitor Mateus', 'M', 12345678900, '1990-05-15', 2147483647, 91010101, 'Rua das Flores', 'Porto Alegre', 'RS'),
(6, 'Nathan', 'M', 98765432100, '1985-08-20', 2147483647, 90210100, 'Avenida Central', 'Caxias do Sul', 'RS'),
(7, 'Jumanjy Scobyloo', 'M', 11122233344, '1992-12-10', 2147483647, 93020202, 'Rua da Praia', 'Pelotas', 'RS');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `Id_Estoque` int(11) NOT NULL,
  `Id_Produto` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL CHECK (`Quantidade` > 0),
  `Id_Fornecedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estoque`
--

INSERT INTO `estoque` (`Id_Estoque`, `Id_Produto`, `Quantidade`, `Id_Fornecedor`) VALUES
(1, 1, 38, 2),
(2, 2, 48, 1),
(3, 3, 199, 4),
(4, 4, 100, 1),
(5, 5, 27, 3),
(6, 6, 200, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `Id_Fornecedor` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `CNPJ` bigint(20) NOT NULL,
  `CIDADE` varchar(100) NOT NULL,
  `ESTADO` char(2) NOT NULL,
  `PAIS` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fornecedor`
--

INSERT INTO `fornecedor` (`Id_Fornecedor`, `Nome`, `CNPJ`, `CIDADE`, `ESTADO`, `PAIS`) VALUES
(1, 'Nike', 12345678900001, 'São Paulo', 'SP', 'Brasil'),
(2, 'Wilson', 98765432100002, 'São Paulo', 'SP', 'Brasil'),
(3, 'Puma', 12341234000003, 'Rio de Janeiro', 'RJ', 'Brasil'),
(4, 'Adidas', 56785678500004, 'Rio de Janeiro', 'RJ', 'Brasil');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `Id_Pedido` int(11) NOT NULL,
  `Id_Cliente` int(11) NOT NULL,
  `ID_Produto` int(11) NOT NULL,
  `DATA_Pedido` date NOT NULL,
  `Forma_Pagamento` varchar(100) NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`Id_Pedido`, `Id_Cliente`, `ID_Produto`, `DATA_Pedido`, `Forma_Pagamento`, `valor`) VALUES
(1, 1, 3, '2024-04-06', 'Cartão de crédito', 269.99),
(2, 1, 4, '2024-04-06', 'Cartão de crédito', 99.99),
(3, 5, 3, '2024-04-11', 'Cartão de Crédito', 269.99),
(4, 7, 4, '2024-04-11', 'Cartão de Débito', 99.99),
(5, 6, 3, '2024-03-30', 'Pix', 269.99);

--
-- Acionadores `pedidos`
--
DELIMITER $$
CREATE TRIGGER `trigger_AtualizarEstoque` AFTER INSERT ON `pedidos` FOR EACH ROW BEGIN
    UPDATE estoque SET Quantidade = Quantidade - 1 WHERE Id_Produto = NEW.ID_Produto;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `Id_Produto` int(11) NOT NULL,
  `Nome_Produto` varchar(100) NOT NULL,
  `Preco` float NOT NULL,
  `Descricao` varchar(200) NOT NULL,
  `Id_Subcatg` int(11) NOT NULL,
  `Id_Categorias` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`Id_Produto`, `Nome_Produto`, `Preco`, `Descricao`, `Id_Subcatg`, `Id_Categorias`) VALUES
(1, 'Bola de Basquete', 49.99, 'Bola oficial de basquete', 6, 2),
(2, 'Camisa NBA Lakers', 279.99, 'Camisa oficial de basquete', 2, 2),
(3, 'Camisa Internacional RS 2024', 269.99, 'Camisa oficial do Maior do Sul', 1, 1),
(4, 'Bola Society Nike', 99.99, 'Bola  oficial ', 5, 1),
(5, 'Tênis Puma Deviate Nitro 2 Psychedelic Rush Feminino - Preto', 1499.99, 'Indicado para Corrida', 3, 3),
(6, 'Bola de Futebol Americano Wilson The Duke Pro Color NFL - Marrom', 149.99, 'Importado e Licenciado Oficialmente pela NFL.', 4, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sub_categorias`
--

CREATE TABLE `sub_categorias` (
  `Id_Subcatg` int(11) NOT NULL,
  `Nome_SubCatg` varchar(100) NOT NULL,
  `Id_Categorias` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sub_categorias`
--

INSERT INTO `sub_categorias` (`Id_Subcatg`, `Nome_SubCatg`, `Id_Categorias`) VALUES
(1, 'Camisas de Futebol Nacionais', 1),
(2, 'Camisas NBA', 2),
(3, 'Tenis Corrida', 3),
(4, 'Bola Futebol Americano', 4),
(5, 'Bola de Futebol Society', 1),
(6, 'Bola de Basquete', 2);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `visualizar_clientes_pedidos`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `visualizar_clientes_pedidos` (
`Nome` varchar(100)
,`DATA_Pedido` date
,`Forma_Pagamento` varchar(100)
,`valor` float
,`Item` varchar(100)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vizu_estoquebaixo`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vizu_estoquebaixo` (
`ID` int(11)
,`Nome` varchar(100)
,`Quantidade_Estoque` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura para view `visualizar_clientes_pedidos`
--
DROP TABLE IF EXISTS `visualizar_clientes_pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `visualizar_clientes_pedidos`  AS SELECT `clientes`.`Nome` AS `Nome`, `pedidos`.`DATA_Pedido` AS `DATA_Pedido`, `pedidos`.`Forma_Pagamento` AS `Forma_Pagamento`, `pedidos`.`valor` AS `valor`, (select `produtos`.`Nome_Produto` from `produtos` where `produtos`.`Id_Produto` = `pedidos`.`ID_Produto`) AS `Item` FROM (`clientes` join `pedidos` on(`clientes`.`Id_Cliente` = `pedidos`.`Id_Cliente`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vizu_estoquebaixo`
--
DROP TABLE IF EXISTS `vizu_estoquebaixo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vizu_estoquebaixo`  AS SELECT `produtos`.`Id_Produto` AS `ID`, `produtos`.`Nome_Produto` AS `Nome`, (select `estoque`.`Quantidade` from `estoque` where `estoque`.`Id_Produto` = `produtos`.`Id_Produto`) AS `Quantidade_Estoque` FROM `produtos` WHERE (select `estoque`.`Quantidade` from `estoque` where `estoque`.`Id_Produto` = `produtos`.`Id_Produto`) < 50 ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`Id_Categorias`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Id_Cliente`),
  ADD UNIQUE KEY `AK_Cpfunico` (`CPF`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`Id_Estoque`),
  ADD KEY `FK_EstoqueProd` (`Id_Produto`),
  ADD KEY `FK_EstoqueFornecedor` (`Id_Fornecedor`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`Id_Fornecedor`),
  ADD UNIQUE KEY `AK_CnpjUnico` (`CNPJ`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`Id_Pedido`),
  ADD KEY `Fk_PedidoProd` (`ID_Produto`),
  ADD KEY `Fk_ClientePed` (`Id_Cliente`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`Id_Produto`),
  ADD KEY `Fk_ProdCategorias` (`Id_Categorias`),
  ADD KEY `fk_ProdSubCatg` (`Id_Subcatg`);

--
-- Índices de tabela `sub_categorias`
--
ALTER TABLE `sub_categorias`
  ADD PRIMARY KEY (`Id_Subcatg`),
  ADD KEY `FK_Categoria` (`Id_Categorias`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `Id_Categorias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Id_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `Id_Estoque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `Id_Fornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `Id_Pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `Id_Produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `sub_categorias`
--
ALTER TABLE `sub_categorias`
  MODIFY `Id_Subcatg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `FK_EstoqueFornecedor` FOREIGN KEY (`Id_Fornecedor`) REFERENCES `fornecedor` (`Id_Fornecedor`),
  ADD CONSTRAINT `FK_EstoqueProd` FOREIGN KEY (`Id_Produto`) REFERENCES `produtos` (`Id_Produto`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `Fk_ClientePed` FOREIGN KEY (`Id_Cliente`) REFERENCES `clientes` (`Id_Cliente`),
  ADD CONSTRAINT `Fk_PedidoProd` FOREIGN KEY (`ID_Produto`) REFERENCES `produtos` (`Id_Produto`);

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `Fk_ProdCategorias` FOREIGN KEY (`Id_Categorias`) REFERENCES `categorias` (`Id_Categorias`),
  ADD CONSTRAINT `fk_ProdSubCatg` FOREIGN KEY (`Id_Subcatg`) REFERENCES `sub_categorias` (`Id_Subcatg`);

--
-- Restrições para tabelas `sub_categorias`
--
ALTER TABLE `sub_categorias`
  ADD CONSTRAINT `FK_Categoria` FOREIGN KEY (`Id_Categorias`) REFERENCES `categorias` (`Id_Categorias`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
