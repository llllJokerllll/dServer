CREATE DATABASE bd_Academia;
USE bd_Academia;

CREATE TABLE tbl_Asistentes (
	NIF nvarchar(10) NOT NULL CONSTRAINT pk_tbl_Asistentes PRIMARY KEY,
	nome nvarchar(25) NOT NULL,
	apelido1 varchar(50) NOT NULL,
	apelido2 varchar(50) NULL,
	dataDeNacemento date NOT NULL,
	enderezo varchar(50) NOT NULL,
	sexo char(2) NOT NULL,
	codConferencia nvarchar(10) NOT NULL CONSTRAINT uq_Asistentes_codConferencia UNIQUE,
);

CREATE TABLE tbl_Conferencias (
	codConferencia nvarchar(10) NOT NULL CONSTRAINT pk_tbl_Conferencias PRIMARY KEY,
	relatorNIF nvarchar(10) NOT NULL,
	nomeConferencia varchar(50) NOT NULL,
	numMaxAsistReco int NOT NULL,
	dataInicio date NOT NULL,
	dataFinal date NOT NULL,
	numHorasTotais int NOT NULL,
);

CREATE TABLE tbl_Instructores (
	instructorNIF nvarchar(10) NOT NULL CONSTRAINT pk_tbl_Instructores PRIMARY KEY,
	instructorNome nvarchar(25) NOT NULL,
	instructorApelido1 varchar(50) NOT NULL,
	instructorApelido2 varchar(50) NULL,
	instructorEnderezo varchar(50) NOT NULL,
	titulacion varchar(50) NOT NULL,
	salario int NOT NULL,
);

ALTER TABLE tbl_Conferencias ADD CONSTRAINT fk_Conferencias_Instructores FOREIGN KEY(relatorNIF) REFERENCES tbl_Instructores(instructorNIF) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE tbl_Asistentes ADD CONSTRAINT fk_Asistentes_Conferencias FOREIGN KEY(codConferencia) REFERENCES tbl_Conferencias(codConferencia) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE tbl_Conferencias ADD CONSTRAINT uq_Conferencias_nomeConferencia UNIQUE(nomeConferencia);
ALTER TABLE tbl_Instructores ADD CONSTRAINT uq_Instructores_instructorNome_instructorApelido1_instructorApelido2 UNIQUE(instructorNome,instructorApelido1,instructorApelido2);
ALTER TABLE tbl_Conferencias ADD CONSTRAINT ck_tbl_Conferencias_dataFinal CHECK (dataFinal IN ('22-01-2020', '29-02-2020', '08-03-2020') );

