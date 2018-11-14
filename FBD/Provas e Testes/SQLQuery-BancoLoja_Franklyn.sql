USE master
DROP DATABASE Loja_Franklyn
CREATE DATABASE Loja_Franklyn;

USE Loja_Franklyn;


--DROP TABLE fornecedor;

CREATE TABLE fornecedor
(
	cod SMALLINT not null ,
	nome VARCHAR(80) not null,
	rua VARCHAR(80) not null,
	numero INT not null,
	cep VARCHAR(15) not null,
	cidade VARCHAR(30) not null,
	CONSTRAINT PK_fornecedor
	PRIMARY KEY (cod)
);


-- DROP TABLE estoque;
CREATE TABLE estoque
(
	cod INTEGER not null,
	codfor smallint not null,
	qtd INTEGER not null,
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
	numero int not null,
	cep varchar(15),
	cnpj varchar(20) not null,

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
	cod_item INTEGER not null,
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


--VIEWS
create view v1(nome_filial, nome_vendedor) as 
select f.nome, v.nome
from filial f inner join vendedor v on cod=cod_filial;

--select * from v1;


create view v2 (nome_filial, num_vend) as 
select f.nome, (select count(*) from vendedor where f.cod=cod_filial)
from filial f

select * from v2;

create view v3 (matricula, filial, salario) as
select nome, cod_filial, salario from vendedor where salario <2000 with check option;



insert into estoque (cod, codfor, qtd, preco_venda, nome) values (1,1,10, 5.50,'item1')
insert into estoque (cod, codfor, qtd, preco_venda, nome) values (2,2,20, 10.50,'item2')
insert into estoque (cod, codfor, qtd, preco_venda, nome) values (3,3,30, 15.50,'item3')

insert into fornecedor (cod, nome, rua, numero, cep, cidade) values (1,'fornecedor1', 'rua fornecedor1', 3700, '60861-634',  'fortaleza')
insert into fornecedor (cod, nome, rua, numero, cep, cidade) values (2,'fornecedor2', 'rua fornecedor2', 3701, '60861-634',  'fortaleza')
insert into fornecedor (cod, nome, rua, numero, cep, cidade) values (3,'fornecedor3', 'rua fornecedor3', 3702, '60861-634',  'fortaleza')

insert into filial (cod, nome, rua, numero, cep, cnpj) values (1,'filial1', 'rua filial1', 123, '60861-634','5456132156')
insert into filial (cod, nome, rua, numero, cep, cnpj) values (2,'filial2', 'rua filial2', 456, '60861-634','5465198797')
insert into filial (cod, nome, rua, numero, cep, cnpj) values (3,'filial3', 'rua filial3', 789, '60861-634','5154799789')

INSERT INTO vendedor (matr, nome, cod_filial, gerencia_filial, salario) values (1,'Franklyn',1,1,2500.00)
INSERT INTO vendedor (matr, nome, cod_filial, salario) values (2,'func1',1, 1500.00)
INSERT INTO vendedor (matr, nome, cod_filial, gerencia_filial, salario) values (3,'Gerente',2,2,2500.00)