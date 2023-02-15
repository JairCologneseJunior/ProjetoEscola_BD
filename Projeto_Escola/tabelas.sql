--CREATE DATABASE ESCOLA
--USE ESCOLA;
--use msdb
--DROP DATABASE ESCOLA

CREATE TABLE ALUNO(
CPF varchar(20),
Nome varchar(200),
Endereco varchar(120),
Telefone varchar(50),
Data_Nasc date,
primary key(CPF)
);

CREATE TABLE CURSO(
Codigo int,
Nome varchar(30),
Descricao varchar(500),
Codigo_Dpto int,
primary key (Codigo),
Constraint fk_DPT_CUR Foreign key (Codigo_Dpto) references DEPARTAMENTO(Codigo)
);

create sequence Codigo_do_Cur
	start with 1
	increment by 1;

CREATE TABLE MATRICULA(
Codigo_curso int,
CPF_Aluno varchar(20),
Data_Matricula date,
primary key (Codigo_curso, CPF_Aluno),
Constraint fk_CUR_Mat Foreign key (Codigo_curso) references CURSO(Codigo),
Constraint fk_ALUNO_Mat Foreign key (CPF_Aluno) references ALUNO(CPF)
);

CREATE TABLE DISCIPLINA(
Codigo int,
nome varchar(100),
Qtde_Credito int,
Matricula_Prof int,
primary key(Codigo),
Constraint fk_PROF_DISC Foreign key (Matricula_Prof) references PROFESSOR(Matricula)
);
create sequence Codigo_do_DIS
	start with 1
	increment by 1;

CREATE TABLE CURSA(
CPF_Aluno varchar(20),
Codigo_Disc int,
primary key(CPF_Aluno, Codigo_Disc),
Constraint fk_ALU_CURSA Foreign key (CPF_Aluno) references ALUNO(CPF),
Constraint fk_DISC_CURSA Foreign key (Codigo_Disc) references DISCIPLINA(Codigo)
);

CREATE TABLE COMPOE(
Codigo_Curso int,
Codigo_Disc int,
primary key (Codigo_Curso, Codigo_Disc),
Constraint fk_CUR_COM Foreign key (Codigo_Curso) references CURSO(Codigo),
Constraint fk_DISC_COM Foreign key (Codigo_Disc) references DISCIPLINA(Codigo)
);

CREATE TABLE PROFESSOR(
Matricula int,
Nome varchar (200),
Endereco varchar(500),
Telefone varchar(50),
Data_Nasc date,
Codigo_Depto int,
Data_Contratacao date,
primary key (Matricula),
Constraint fk_DPT_PROF Foreign key (Codigo_Depto) references DEPARTAMENTO(Codigo)
);

create sequence Codigo_do_Pro
	start with 1
	increment by 1;
	
CREATE TABLE DEPARTAMENTO(
Codigo int,
nome varchar (50),
primary key (Codigo)
);

create sequence Codigo_do_dpt
	start with 1
	increment by 1;

CREATE TABLE PRE_REQ(
Codigo_Disc int,
Codigo_Disc_Dependencia int,
primary key (Codigo_Disc, Codigo_Disc_Dependencia),
constraint Fk_Disc_PR foreign key (Codigo_Disc) references DISCIPLINA (Codigo),
constraint Fk_Disc_PRE foreign key (Codigo_Disc_Dependencia) references DISCIPLINA (Codigo),
);
