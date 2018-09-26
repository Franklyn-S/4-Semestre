--DROP DATABASE Loja_Franklyn
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
	cidade varchar(30) not null,
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

-- DROP TABLE filial
CREATE TABLE filial
(
	cod SMALLINT not null,
	nome char(30) not null,
	rua varchar(30) not null,
	numero smallint not null,
	cep smallint,
	cnpj smallint not null,

	CONSTRAINT PK_filial
		PRIMARY KEY(cod),
	CONSTRAINT cnpj_unico
		UNIQUE(cnpj)
);

--DROP TABLE vendedor
CREATE TABLE vendedor
(
	matr SMALLINT not null,
	nome char(60),
	cod_filial SMALLINT not null, --filial que ele pertence
	gerencia_filial SMALLINT, --filial que ele gerencia
	salario DEC(9,2) not null,
	CONSTRAINT PK_fun
		PRIMARY KEY (matr),
	CONSTRAINT Salario_maior_que_mil
		CHECK (salario > 1000),

	CONSTRAINT FK_gerencia
		FOREIGN KEY (gerencia_filial) REFERENCES filial
			ON DELETE CASCADE
			ON UPDATE CASCADE,
	CONSTRAINT FK_filial
		FOREIGN KEY (cod_filial) REFERENCES filial
			ON DELETE NO ACTION
			ON UPDATE NO ACTION
);



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
		FOREIGN KEY (matr_vend) REFERENCES vendedor
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	CONSTRAINT FK_estoque
		FOREIGN KEY (cod_item) REFERENCES estoque
		ON DELETE NO ACTION
		ON UPDATE CASCADE
);