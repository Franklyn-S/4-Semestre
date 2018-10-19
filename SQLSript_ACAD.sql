use master;
DROP DATABASE acad;
create database acad;
use acad;

create table unidade_academica(
	cod_ua smallint not null,
	nome char(50) not null,
	endereco varchar(100) not null,
	CONSTRAINT PK_UA
	Primary key(Cod_UA)
);

INSERT INTO unidade_academica Values (1,'Centro de Ciências', 'Campus do pici');
INSERT INTO unidade_academica Values (2,'Centro de Tecnologia', 'Campus do pici');
INSERT INTO unidade_academica Values (3,'ICA', 'Campus do pici');
INSERT INTO unidade_academica Values (4,'Centro de Humanidades', 'Benfica');
INSERT INTO unidade_academica Values (5,'SEM_DEP', 'Campus do pici');
INSERT INTO unidade_academica Values (6,'SEM_CURSO', 'Campus do pici');


--drop table telefones_ua;

CREATE TABLE telefones_ua (
	cod_ua SMALLINT NOT NULL,
	num_fone VARCHAR(20) NOT NULL,
	tipo_fone VARCHAR(20),
	CONSTRAINT PK_TEL_UA
	PRIMARY KEY (cod_ua, Num_fone),
	CONSTRAINT FK_TEL_UA
	FOREIGN KEY (cod_ua) REFERENCES unidade_academica
);

INSERT INTO telefones_ua Values (1,'(85)999999999', 'fixo');
INSERT INTO telefones_ua Values (1,'(85)85999999999', 'celular');
INSERT INTO telefones_ua Values (2,'(85)85999999999', 'celular');
INSERT INTO telefones_ua Values (3,'(85)99999-9999', 'celular');
INSERT INTO telefones_ua Values (4,'(85)85999999999', 'celular');


CREATE TABLE departamento(
	cod_dep smallint NOT NULL,
	cod_ua SMALLINT NOT NULL,
	nome char(50) NOT NULL,
	endereco varchar(100) NOT NULL,
	CONSTRAINT PK_DEP
	Primary key(cod_dep),
	CONSTRAINT FK_DEP_UA
	FOREIGN KEY (cod_ua) REFERENCES unidade_academica
);

CREATE TABLE telefones_dep (
	cod_dep SMALLINT NOT NULL,
	num_fone char(11) NOT NULL,
	tipo_fone varchar(8),
	CONSTRAINT PK_TEL_DEP
	PRIMARY KEY (cod_dep, num_fone),
	CONSTRAINT FK_TEL_DEP
	FOREIGN KEY (cod_dep) REFERENCES departamento
);

CREATE TABLE curso(
	cod_curso smallint NOT NULL,
	nome char(50) NOT NULL,
	CONSTRAINT PK_CURSO
	PRIMARY KEY(cod_curso),
);

CREATE TABLE dep_curso(
	cod_curso smallint NOT NULL,
	cod_dep SMALLINT NOT NULL,
	CONSTRAINT PK_DEP_CURSO
	PRIMARY KEY(cod_dep, cod_curso),
	CONSTRAINT FK_DEP
	FOREIGN KEY(cod_dep) REFERENCES departamento,
	CONSTRAINT FK_CURSO
	FOREIGN KEY(cod_curso) REFERENCES curso
);

CREATE TABLE professor(
	matr INTEGER NOT NULL,
	nome char(50) NOT NULL,
	lotacao SMALLINT NOT NULL,
	diretor_cod_UA  SMALLINT,
	chefe_cod_dep SMALLINT,
	coordenador_cod_curso SMALLINT,
	CONSTRAINT PK_PROF
	PRIMARY KEY(matr),
	CONSTRAINT FK_PROF_DEP
	FOREIGN KEY(lotacao) REFERENCES departamento,
	CONSTRAINT FK_COORD
	FOREIGN KEY(coordenador_cod_curso) REFERENCES curso,
	CONSTRAINT FK_DIRETOR
	FOREIGN KEY(diretor_cod_UA) REFERENCES unidade_academica,
	CONSTRAINT FK_CHEFE
	FOREIGN KEY(chefe_cod_dep) REFERENCES departamento,
);

CREATE TABLE disciplina(
	cod_disc SMALLINT NOT NULL,
	nome char(50) NOT NULL,
	CONSTRAINT PK_DISCIPLINA
	PRIMARY KEY(cod_disc)
);

CREATE TABLE pre_requisito(
	cod_disc SMALLINT NOT NULL,
	cod_pre_requisito SMALLINT NOT NULL,
	CONSTRAINT PK_PRE_REQUISITO
	PRIMARY KEY(cod_disc, cod_pre_requisito),
	CONSTRAINT FK_DISC_PRE_REQUISITO
	FOREIGN KEY(cod_disc) REFERENCES disciplina,
	CONSTRAINT FK_PRE_REQUISITO
	FOREIGN KEY(cod_pre_requisito) REFERENCES disciplina,
);

CREATE TABLE prof_disc(
	matr_prof INTEGER NOT NULL,
	cod_disc SMALLINT NOT NULL,
	semestre char(6),
	CONSTRAINT PK_PROF_DISC
	PRIMARY KEY(matr_prof, cod_disc, semestre),
	CONSTRAINT FK_PROF
	FOREIGN KEY(matr_prof) REFERENCES professor,
	CONSTRAINT FK_DISC
	FOREIGN KEY(cod_disc) REFERENCES disciplina,
);

CREATE TABLE cur_disc(
	cod_disc SMALLINT NOT NULL,
	cod_curso SMALLINT NOT NULL,
	CONSTRAINT PK_CUR_DISC
	PRIMARY KEY(cod_disc, cod_curso),
	CONSTRAINT FK_CURSO_DISC
	FOREIGN KEY(cod_curso) REFERENCES curso,
	CONSTRAINT FK_DISC_CURSO
	FOREIGN KEY(cod_disc) REFERENCES disciplina,
);

CREATE TABLE aluno(
	matr_aluno INTEGER NOT NULL,
	nome char(50) NOT NULL,
	CONSTRAINT PK_ALUNO
	PRIMARY KEY(matr_aluno)
);

CREATE TABLE aluno_disc (
	matr_aluno INTEGER NOT NULL,
	cod_disc SMALLINT NOT NULL,
	semestre char(6) NOT NULL,
	AP1 DEC(2,2) NOT NULL,
	AP2 DEC(2,2) NOT NULL,
	AF DEC(2,2),
	CONSTRAINT PK_ALUNO_DISC
	PRIMARY KEY(matr_aluno, cod_disc),
	CONSTRAINT FK_ALUNO
	FOREIGN KEY(matr_aluno) REFERENCES aluno,
	CONSTRAINT FK_DISC_ALUNO
	FOREIGN KEY(cod_disc) REFERENCES disciplina
);



