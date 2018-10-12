--DROP DATABASE dr_acad;
create database dr_acad;
use dr_acad;

create table unidade_academica(
	Cod_UA smallint not null,
	nome char(50) not null,
	endereco varchar(100) not null,
	CONSTRAINT PK_UA
	Primary key(Cod_UA)
);

CREATE TABLE telefones_UA (
	Cod_UA SMALLINT NOT NULL,
	Num_fone char(11) NOT NULL,
	tipo_fone varchar(8),
	CONSTRAINT PK_TEL_UA
	PRIMARY KEY (Cod_UA, Num_fone),
	CONSTRAINT FK_TEL_UA
	FOREIGN KEY (Cod_UA) REFERENCES unidade_academica
);

CREATE TABLE departamento(
	Cod_dep smallint NOT NULL,
	Cod_UA SMALLINT NOT NULL,
	nome char(50) NOT NULL,
	endereco varchar(100) NOT NULL,
	CONSTRAINT PK_DEP
	Primary key(Cod_dep),
	CONSTRAINT FK_DEP_UA
	FOREIGN KEY (Cod_UA) REFERENCES unidade_academica
);

CREATE TABLE telefones_dep (
	Cod_dep SMALLINT NOT NULL,
	Num_fone char(11) NOT NULL,
	tipo_fone varchar(8),
	CONSTRAINT PK_TEL_DEP
	PRIMARY KEY (Cod_dep, Num_fone),
	CONSTRAINT FK_TEL_DEP
	FOREIGN KEY (Cod_dep) REFERENCES departamento
);

CREATE TABLE curso(
	Cod_curso smallint NOT NULL,
	nome char(50) NOT NULL,
	CONSTRAINT PK_CURSO
	PRIMARY KEY(Cod_curso),
);

CREATE TABLE dep_curso(
	Cod_curso smallint NOT NULL,
	Cod_dep SMALLINT NOT NULL,
	CONSTRAINT PK_DEP_CURSO
	PRIMARY KEY(Cod_dep, Cod_curso),
	CONSTRAINT FK_DEP
	FOREIGN KEY(Cod_dep) REFERENCES departamento,
	CONSTRAINT FK_CURSO
	FOREIGN KEY(Cod_curso) REFERENCES curso
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