CREATE DATABASE Loja_Franklyn;

USE Loja_Franklyn;


--DROP TABLE fornecedor;

CREATE TABLE fornecedor
(
	cod SMALLINT not null ,
	nome VARCHAR(80) not null,
	rua VARCHAR(80) not null,
	numero VARCHAR(8) not null,
	cep INT not null,
	CONSTRAINT PKFornecedor
	PRIMARY KEY (cod)

);

-- DROP TABLE estoque;
CREATE TABLE estoque
(
	cod SMALLINT not null,
	codfor SMALLINT not null,
	qtd SMALLINT not null,
	preco_venda DEC(9,2) not null,
	CONSTRAINT PKEstoque
		PRIMARY KEY (cod),
	CONSTRAINT FK_for_est
		FOREIGN KEY (codFor) REFERENCES fornecedor
			ON DELETE NO ACTION
			ON UPDATE CASCADE
);


--select * from fornecedor

