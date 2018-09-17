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
	CONSTRAINT PK_fornecedor
	PRIMARY KEY (cod)

);

-- DROP TABLE estoque;
CREATE TABLE estoque
(
	cod SMALLINT not null,
	codfor SMALLINT not null,
	qtd SMALLINT not null,
	preco_venda DEC(9,2) not null,
	nome char(30),
	CONSTRAINT PK_estoque
		PRIMARY KEY (cod),
	CONSTRAINT FK_for_est
		FOREIGN KEY (codfor) REFERENCES fornecedor
			ON DELETE NO ACTION
			ON UPDATE CASCADE
);


--DROP TABLE funcionario
CREATE TABLE funcionario
(
	matr SMALLINT not null,
	nome char(60),
	cod_filial SMALLINT not null, --references filial
	salario DEC(9,2) not null,
	CONSTRAINT PK_fun
		PRIMARY KEY (matr)

)

--DROP TABLE filial
CREATE TABLE filial
(
	cod SMALLINT not null,
	nome char(30),
	matr_ger SMALLINT not null,

	CONSTRAINT PK_filial
		PRIMARY KEY(cod),
	CONSTRAINT FK_gerente
		FOREIGN KEY (matr_ger) REFERENCES funcionario
			ON DELETE NO ACTION
			ON UPDATE CASCADE
	
)


ALTER TABLE funcionario
	ADD CONSTRAINT FK_filial 
	FOREIGN KEY (cod_filial) REFERENCES filial

--DROP TABLE historico
CREATE TABLE historico
(
	dt_hora_venda DATETIME not null,
	cod_item SMALLINT not null,
	matr_vend SMALLINT not null,
	preco_venda DEC(9,2) not null,
	qtd SMALLINT not null,
	CONSTRAINT PK_historico
		PRIMARY KEY (dt_hora_venda, cod_item, matr_vend),
	CONSTRAINT FK_vendedor 
		FOREIGN KEY (matr_vend) REFERENCES funcionario 
)