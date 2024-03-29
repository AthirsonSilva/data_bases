CREATE DATABASE bdEstoque
GO
USE bdEstoque

--Criacao de tabelas
CREATE TABLE tbCliente(
codCliente INT PRIMARY KEY IDENTITY(1,1)
, nomeCliente VARCHAR(40) NOT NULL
, cpfCliente CHAR(11) NOT NULL
, emailCliente NVARCHAR(80) NOT NULL
, sexoCliente VARCHAR(20) NOT NULL
, dataNascimentoCliente SMALLDATETIME NOT NULL
);
CREATE TABLE tbFornecedor(
codFornecedor INT PRIMARY KEY IDENTITY(1,1)
, nomeFornecedor VARCHAR(40) NOT NULL
, contatoFonecedor VARCHAR(60) NOT NULL
);
CREATE TABLE tbFabricante(
codFabricante INT PRIMARY KEY IDENTITY(1,1)
, nomeFabricante VARCHAR(40) NOT NULL
);
CREATE TABLE tbVenda(
codVenda INT PRIMARY KEY IDENTITY(1,1)
, dataVenda SMALLDATETIME NOT NULL
, valorTotalVenda SMALLMONEY NOT NULL
, codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
);
CREATE TABLE tbProduto(
codProduto INT PRIMARY KEY IDENTITY(1,1)
, descricaoProduto VARCHAR(200) NOT NULL
, valorProduto SMALLMONEY NOT NULL
, quantidadeProduto SMALLINT NOT NULL
, codFabricante INT FOREIGN KEY REFERENCES tbFabricante(codFabricante)
, codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(codFornecedor)
);
CREATE TABLE tbItensVenda(
codItensVenda INT PRIMARY KEY IDENTITY(1,1)
, codVenda INT FOREIGN KEY REFERENCES tbVenda(codVenda)
, codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto)
, quantidadeItensVenda SMALLINT NOT NULL
, subTotalItensVenda SMALLMONEY NOT NULL
);
CREATE TABLE tbSaidaProduto (
	codSaidaProduto INT PRIMARY KEY IDENTITY(1,1),
	dataSaidaProduto SMALLDATETIME NOT NULL,
	codProduto INT FOREIGN KEY REFERENCES tbProduto (codProduto),
	quantidadeSaidaProduto INT NOT NULL
);
CREATE TABLE tbEntradaProduto (
	codEntradaProduto INT PRIMARY KEY IDENTITY(1,1),
	dataEntradaProduto SMALLDATETIME NOT NULL,
	codProduto INT FOREIGN KEY REFERENCES tbProduto (codProduto),
	quantidadeEntradaProduto INT NOT NULL
);
