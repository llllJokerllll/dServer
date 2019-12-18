CREATE DATABASE bd_tarefa9;
USE bd_tarefa9;


CREATE TABLE tbl_Proyecto (
	codProyecto varchar NOT NULL CONSTRAINT pk_tbl_Proyecto PRIMARY KEY,
	nome varchar NOT NULL,
	descripcion varchar NULL,
	codDepartamento varchar NOT NULL,
	subProyecto nvarchar NOT NULL,
);

CREATE TABLE tbl_Departamento (
	codDepartamento varchar NOT NULL CONSTRAINT pk_tbl_Departamento PRIMARY KEY,
	nome varchar NOT NULL,
	localizacion nvarchar NOT NULL,
	dniDiri varchar NOT NULL,
);

CREATE TABLE tbl_Localizacion (
	nome varchar NOT NULL,
	codDepartamento varchar NOT NULL,
	CONSTRAINT pk_tbl_Localizacion PRIMARY KEY(nome,codDepartamento),
);

CREATE TABLE tbl_Participa (
	codParticipa varchar NOT NULL CONSTRAINT pk_tbl_Participa PRIMARY KEY,
	dataInicio date NOT NULL,
	dataFin date NOT NULL,
	horas int NOT NULL,
	dni varchar(15) NOT NULL,
	codProyecto varchar NOT NULL,
);

CREATE TABLE tbl_Empregado (
	dni varchar(15) NOT NULL CONSTRAINT pk_tbl_Empregado PRIMARY KEY,
	nss varchar NOT NULL,
	salario decimal(2) NOT NULL,
	codDepartamento varchar NOT NULL,
);

CREATE TABLE tbl_Persoal (
	dni varchar(15) NOT NULL CONSTRAINT pk_tbl_Persoal PRIMARY KEY,
	nome varchar NOT NULL,
	provincia nvarchar NULL,
	localidade nvarchar NULL,
	rua nvarchar NULL,
	dataNacemento date NOT NULL,
	codPostal nvarchar(5) NOT NULL,
);

CREATE TABLE tbl_Supervisa (
	dniSupervisor varchar NOT NULL,
	codProyecto varchar NOT NULL,
	dniSupervisado varchar NOT NULL,
);

CREATE TABLE tbl_Asiste (
	codCurso varchar NOT NULL,
	codEdicion varchar NOT NULL,
	dni varchar(15) NOT NULL,
	CONSTRAINT pk_tbl_Asiste PRIMARY KEY(codEdicion,codCurso)
);

CREATE TABLE tbl_Edicion (
	codEdicion varchar NOT NULL,
	codCurso varchar NOT NULL,
	numPrazasEmpregados int NULL,
	numPrazasPracticas int NULL,
	dataRealizacion date NOT NULL,
	CONSTRAINT pk_tbl_Edicion PRIMARY KEY(codEdicion,codCurso)
);

CREATE TABLE tbl_Curso (
	codCurso varchar NOT NULL CONSTRAINT pk_tbl_Curso PRIMARY KEY,
	nome varchar NOT NULL,
	descripcion varchar NULL,
	nivel varchar NOT NULL,
	numHoras int NOT NULL,
);

CREATE TABLE tbl_Documenta (
	codProyecto varchar NOT NULL,
	dni varchar(15) NOT NULL,
	CONSTRAINT pk_tbl_Documenta PRIMARY KEY(dni,codProyecto)
);

ALTER TABLE tbl_Documenta ADD CONSTRAINT fk_Documenta_Persoal FOREIGN KEY(dni) REFERENCES tbl_Persoal(dni) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE tbl_Documenta ADD CONSTRAINT fk_Documenta_Proyecto FOREIGN KEY(codProyecto) REFERENCES tbl_Proyecto(codProyecto) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE tbl_Edicion ADD CONSTRAINT fk_Edicion_Curso FOREIGN KEY(codCurso) REFERENCES tbl_Curso(codCurso) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE tbl_Asiste ADD CONSTRAINT fk_Asiste_Persoal FOREIGN KEY(dni) REFERENCES tbl_Persoal(dni) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE tbl_Asiste ADD CONSTRAINT fk_Asiste_Edicion FOREIGN KEY(codEdicion) REFERENCES tbl_Edicion(codEdicion) ON DELETE NO ACTION ON UPDATE CASCADE;