CREATE DATABASE bd_Xogos;
USE bd_Xogos;
DROP DATABASE bd_Xogos;

CREATE TABLE tbl_Estudante (
	idEstudante varchar NOT NULL CONSTRAINT pk_tbl_Estudante PRIMARY KEY,
	nome varchar NOT NULL,
	apelido1 varchar NOT NULL,
	apelido2 varchar NOT NULL,
	dataNacemento date NOT NULL,
	nacionalidade nvarchar(25) NOT NULL,
	telefono nvarchar(25) NOT NULL,
	sexo char(2) NOT NULL,
	tipo nvarchar(25) NOT NULL,
);

DROP TABLE tbl_Estudante;

CREATE DATABASE bd_TarefasU4;
USE bd_TarefasU4;

CREATE TABLE tbl_Empregado (
	dni nvarchar(10) NOT NULL CONSTRAINT pk_tbl_Empregado PRIMARY KEY,
	nss nvarchar(10) NOT NULL CONSTRAINT uq_tbl_Empregado UNIQUE,
	nome nvarchar(25) NOT NULL,
	apelido1 varchar(50) NOT NULL,
	apelido2 varchar(50) NULL,
	dataNacemento date NOT NULL,
	nacionalidade nvarchar(25) NOT NULL,
	telefono nvarchar(25) NULL,
	sexo char(2) NOT NULL,
	tipo nvarchar(25) NULL,
);

CREATE TABLE tbl_Nacionalidade (
	codNacionalidade varchar NOT NULL CONSTRAINT pk_tbl_Nacionalidade PRIMARY KEY,
	codNacion varchar NOT NULL,
	descricion varchar NULL,
	idEmpregado nvarchar(10) NOT NULL,
	CONSTRAINT fk_Nacionalidade_Empregados FOREIGN KEY(idEmpregado) REFERENCES tbl_Empregado(dni) ON DELETE NO ACTION ON UPDATE CASCADE,
);
DROP TABLE tbl_Nacionalidade;

CREATE TABLE tbl_Profesor (
	idProfesor nvarchar(10) NOT NULL CONSTRAINT pk_tbl_Profesor PRIMARY KEY,
	nome nvarchar(25) NOT NULL,
	apelido1 varchar(50) NOT NULL,
	apelido2 varchar(50) NULL,
	dataNacemento date NOT NULL,
	enderezoElectronico varchar(50) NULL,
	corpo varchar NOT NULL,
	especialidade varchar NOT NULL,
	telefono nvarchar(25) NULL,
);

CREATE TABLE tbl_Modulo (
	codModulo nvarchar(10) NOT NULL CONSTRAINT pk_tbl_Modulo PRIMARY KEY,
	nome nvarchar(25) NOT NULL,
	descricion varchar NULL,
	idProfesor nvarchar(10) NOT NULL,
	CONSTRAINT fk_Modulo_Profesor FOREIGN KEY(idProfesor) REFERENCES tbl_Profesor(idProfesor) ON DELETE NO ACTION ON UPDATE CASCADE,
);

CREATE TABLE tbl_Ciclo (
	codCiclo nvarchar(10) NOT NULL CONSTRAINT pk_tbl_Ciclo PRIMARY KEY,
	nome nvarchar(25) NOT NULL,
	descricion varchar NULL,
);

CREATE TABLE tbl_Ciclo_Modulo (
	codCicloModulo nvarchar(10) NOT NULL CONSTRAINT pk_tbl_Ciclo_Modulo PRIMARY KEY,
	codCiclo nvarchar(10) NOT NULL,
	codModulo nvarchar(10) NOT NULL,
	observaciones varchar NULL,
	CONSTRAINT fk_Ciclo_Modulo_Ciclo FOREIGN KEY(codCiclo) REFERENCES tbl_Ciclo(codCiclo) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_Ciclo_Modulo_Modulo FOREIGN KEY(codModulo) REFERENCES tbl_Modulo(codModulo) ON DELETE NO ACTION ON UPDATE CASCADE,
);

CREATE TABLE tbl_Piso (
	codPiso nvarchar(10) NOT NULL CONSTRAINT pk_tbl_Piso PRIMARY KEY,
	domicilio varchar NOT NULL,
	localidade varchar NOT NULL,
	codPostal char(5) NOT NULL,
);

CREATE TABLE tbl_Contador (
	codContador nvarchar(10) NOT NULL CONSTRAINT pk_tbl_Contador PRIMARY KEY,
	modelo varchar(3) NOT NULL CONSTRAINT ck_tbl_Contador CHECK (modelo IN ('aeg235', 'samsung20', 'aeg55') ),
	codPiso nvarchar(10) NOT NULL CONSTRAINT uq_tbl_Contador_codPiso UNIQUE,
	CONSTRAINT fk_Contador_Piso FOREIGN KEY(codPiso) REFERENCES tbl_Piso(codPiso) ON DELETE NO ACTION ON UPDATE CASCADE, 
);

CREATE TABLE tbl_Estudante (
	idEstudante nvarchar(10) NOT NULL CONSTRAINT pk_tbl_Estudante PRIMARY KEY,
	nome nvarchar(25) NOT NULL,
	apelido1 varchar(50) NOT NULL,
	apelido2 varchar(50) NULL,
	dataNacemento date NOT NULL,
	enderezoElectronico varchar(50) NULL,
	telefono nvarchar(25) NULL,
);

CREATE TABLE tbl_Opina (
	codOpina nvarchar(10) NOT NULL CONSTRAINT pk_tbl_Opina PRIMARY KEY,
	idProfesor nvarchar(10) NOT NULL,
	idEstudante nvarchar(10) NOT NULL,
	codModulo nvarchar(10) NOT NULL,
	Opinion varchar NULL,
	CONSTRAINT fk_Opina_Profesor FOREIGN KEY(idProfesor) REFERENCES tbl_Profesor(idProfesor) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_Opina_Estudante FOREIGN KEY(idEstudante) REFERENCES tbl_Estudante(idEstudante) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_Opina_Modulo FOREIGN KEY(codModulo) REFERENCES tbl_Modulo(codModulo) ON DELETE NO ACTION,
);

-- Como meter un alter table
-- ALTER TABLE tbl_Opina ADD/MODIFY/DROP CONSTRAINT fk_Opina_Profesor FOREIGN KEY(idProfesor) REFERENCES tbl_Profesor(idProfesor) ON DELETE NO ACTION ON UPDATE CASCADE;

DROP TABLE tbl_Opina;

CREATE INDEX idx_tbl_Empregado_apelido1 ON tbl_Empregado(apelido1);

DROP INDEX idx_tbl_Empregado_apelido1;