create database e_commerce;
use e_commerce;

 CREATE TABLE clientes (
  idCliente int NOT NULL AUTO_INCREMENT,
  Pnome varchar(10) NOT NULL,
  Nome_do_meio char(3) DEFAULT NULL,
  Sobrenome varchar(20) DEFAULT NULL,
  CPF char(11) NOT NULL,
  Endereço varchar(255) DEFAULT NULL,
  Data_do_aniversario date DEFAULT NULL,
  PRIMARY KEY (idCliente),
  UNIQUE KEY unico_cpf_cliente (CPF)
); 

alter table clientes auto_increment = 1;

CREATE TABLE estoque (
  idProdEstoque int NOT NULL AUTO_INCREMENT,
  localEstoque varchar(255) DEFAULT NULL,
  quantidade int DEFAULT '0',
  PRIMARY KEY (idProdEstoque)
); 

alter table estoque auto_increment = 1;

CREATE TABLE estoque_local (
  idLproduto int NOT NULL,
  idLestoque int NOT NULL,
  localização varchar(255) NOT NULL,
  PRIMARY KEY (idLproduto,idLestoque),
  CONSTRAINT fk_estoque_local_estoque FOREIGN KEY (idLestoque) REFERENCES estoque (idProdEstoque),
  CONSTRAINT fk_estoque_local_produto FOREIGN KEY (idLproduto) REFERENCES produtos (idProduto)
);

-- 1. Tabela Base (cadastro de vendedores CNPJ e CPF)
CREATE TABLE cadastro_vendedor (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_comercial VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tipo_vendedor ENUM('CPF', 'CNPJ') NOT NULL,
    documento_número VARCHAR(14) UNIQUE NOT NULL 
);
alter table  cadastro_vendedor auto_increment = 1; 

-- 2. Tabela de Pessoa Jurídica (Dados exclusivos de PJ)
CREATE TABLE fornecedor (
  idFornecedor int NOT NULL AUTO_INCREMENT primary key,
  NomeSocial varchar(255) NOT NULL,
  CNPJ char(14) NOT NULL,
  Contato char(11) NOT NULL,
  UNIQUE KEY unico_fornecedor (CNPJ),
  FOREIGN KEY (idFornecedor) REFERENCES vendedor(id_vendedor)
); 
alter table  fornecedor auto_increment = 1; 

-- 3. Tabela de Pessoa Física (Dados exclusivos de PF)
CREATE TABLE terceiro_vendedor (
  idVendedor int NOT NULL AUTO_INCREMENT,
  NomeSocial varchar(255) NOT NULL,
  Nome_fantasia varchar(255) DEFAULT NULL,
  CPF char(11) DEFAULT NULL,
  contato char(11) NOT NULL,
  localização varchar(255) DEFAULT NULL,
  PRIMARY KEY (idVendedor),
  UNIQUE KEY unico_cpf_vendedor (CPF),
  FOREIGN KEY (idVendedor) REFERENCES vendedor(id_vendedor) 
);

alter table terceiro_vendedor auto_increment = 1;


CREATE TABLE pagamentos (
  idCliente int NOT NULL,
  idPagamento int NOT NULL auto_increment,
  tipo_Pagamento enum('Boleto','Cartão','Dois cartões') DEFAULT NULL,
  limiteDisponivel float DEFAULT NULL,
  PRIMARY KEY (idCliente,idPagamento),
  INDEX idx_idPagamento (idPagamento),
  CONSTRAINT fk_id_cliente FOREIGN KEY (idCliente) REFERENCES clientes (idCliente)
);
alter table  pagamentos auto_increment = 1; 

CREATE TABLE pedido (
  idPedido int AUTO_INCREMENT primary key,
  Cliente_idCliente int,
  Pedido_Status enum('Cancelado','Confirmado','Em processamento') DEFAULT 'Em processamento',
  Descricao varchar(45) DEFAULT NULL,
  Pedido_Valor float DEFAULT '10',
  pagamento_Cash tinyint(1) DEFAULT '0',
  idpagamento int,
  CONSTRAINT fk_pagamento FOREIGN KEY (idpagamento) REFERENCES pagamentos (idPagamento),
  CONSTRAINT fk_pedido_cliente FOREIGN KEY (Cliente_idCliente) REFERENCES clientes (idCliente)
); 

alter table pedido auto_increment = 1;

CREATE TABLE produtos (
  idProduto int NOT NULL AUTO_INCREMENT,
  Pnome varchar(45) NOT NULL,
  Categoria varchar(45) NOT NULL,
  Avaliação varchar(45) NOT NULL,
  Valor varchar(45) DEFAULT NULL,
  PRIMARY KEY (idProduto)
);

alter table produtos auto_increment = 1;


CREATE TABLE produto_pedido (
  idPp_produto int NOT NULL,
  idPp_pedido int NOT NULL,
  Pp_Quantidade int DEFAULT '1',
  Pp_Status enum('Disponível','Sem estoque') DEFAULT 'Disponível',
  PRIMARY KEY (idPp_produto,idPp_pedido),
  CONSTRAINT fk_produtoPedido_pedido FOREIGN KEY (idPp_pedido) REFERENCES pedido (idPedido),
  CONSTRAINT fk_produtoPedido_produto FOREIGN KEY (idPp_produto) REFERENCES produtos (idProduto)
); 

CREATE TABLE produto_fornecedor (
  idPfornecedor int NOT NULL,
  idPproduto int NOT NULL,
  prod_quantidade int NOT NULL,
  PRIMARY KEY (idPfornecedor,idPproduto),
  CONSTRAINT fk_produto_fornecedor_fornecedor FOREIGN KEY (idPfornecedor) REFERENCES fornecedor (idFornecedor),
  CONSTRAINT fk_produto_fornecedor_produto FOREIGN KEY (idPproduto) REFERENCES produtos (idProduto)
); 


CREATE TABLE produtos_vendedor_terc (
  idPvendedor int NOT NULL,
  idPproduto int NOT NULL,
  prodQuantidade int DEFAULT '1',
  PRIMARY KEY (idPvendedor,idPproduto),
  CONSTRAINT fk_produto_produto FOREIGN KEY (idPproduto) REFERENCES produtos (idProduto),
  CONSTRAINT fk_produto_vendedor FOREIGN KEY (idPvendedor) REFERENCES terceiro_vendedor (idVendedor)
);

CREATE TABLE Entrega (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    status_entrega VARCHAR(40) NOT NULL,
    codigo_rastreio VARCHAR(50) UNIQUE NOT NULL,
    data_envio DATE,
    data_entrega DATE,
    FOREIGN KEY (id_pedido) REFERENCES pedido(idPedido)
);
