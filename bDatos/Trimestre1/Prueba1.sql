-- SQL DDL - Data Definition Language: CREATE, ALTER, DELETE
/*
Nombre: Jose Manuel Sabarís García
Fecha: 20/11/2019
Descripción: Ejemplos
*/

CREATE DATABASE db_prueba;
USE db_prueba;

/*
CREATE TABLE tbl_empleados (
	idEmpleado varchar(7) CONSTRAINT pk_tbl_empleados PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	apellido1 varchar(50) NOT NULL,
	apellido2 varchar(50) NOT NULL,
	fechaNacimiento date NOT NULL,
	codOficina int NOT NULL
);
*/
 
CREATE TABLE tbl_empleados (
	idEmpleado varchar(7),
	nombre varchar(50) NOT NULL,
	apellido1 varchar(50) NOT NULL,
	apellido2 varchar(50) NULL,
	fechaNacimiento date NOT NULL,
	codOficina int NULL,
	CONSTRAINT pk_tbl_empleados PRIMARY KEY(idEmpleado),
	CONSTRAINT fk_empleados_oficina FOREIGN KEY(codOficina) REFERENCES tbl_oficina(codOficina) ON DELETE NO ACTION ON UPDATE CASCADE,
); 
--DROP TABLE tbl_empleados;
CREATE TABLE tbl_oficina (
	codOficina int NOT NULL,
	nombreOficina varchar(50) NOT NULL,
	direccion varchar(70) NOT NULL,
	codPostal char(5) NOT NULL,
	telefono char(9) NOT NULL,
	CONSTRAINT pk_tbl_oficina PRIMARY KEY(codOficina),
);
--DROP TABLE tbl_oficina;

--Obtención de las restricciones consultando los esquemas.
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS;
--Obtención restricciones integridad referencial
SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS;


--USE master;
--DROP DATABASE db_prueba;

--Obtencion datos BD
SELECT * FROM tbl_empleados;
SELECT nombre FROM tbl_empleados;

--Mostrar restricciones
EXEC sp_helpconstraint tbl_empleados;

--Mostrar despues de sentencias ALTER
EXEC sp_helpdb bd_prueba;

SELECT * FROM sys.databases;_

--Insertar dentro de una tabla
INSERT INTO tbl_empleados VALUES('nmop','Luisa','Blanco','Blanco','1967-02-21', '456');

--Utilizar auto-incrementales
CREATE TABLE tbl_empleados (
	idEmpleado int IDENTITY (1,1),
	nombre varchar(50) NOT NULL,
	apellido1 varchar(50) NOT NULL,
	apellido2 varchar(50) NULL,
	fechaNacimiento date NOT NULL,
	codOficina int NULL,
	CONSTRAINT pk_tbl_empleados PRIMARY KEY(idEmpleado),
	CONSTRAINT fk_empleados_oficina FOREIGN KEY(codOficina) REFERENCES tbl_oficina(codOficina) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT ck_tbl_empleados_fechaNacimiento CHECK (fechaNacimiento < GETDATE()),
);

CREATE TABLE tbl_oficina (
	codOficina int IDENTITY (1,1),
	nombreOficina varchar(50) NOT NULL,
	direccion varchar(70) NOT NULL,
	codPostal char(5) NOT NULL,
	telefono char(9) NOT NULL,
	ciudad nvarchar(20) NOT NULL,
	CONSTRAINT pk_tbl_oficina PRIMARY KEY(codOficina),
	CONSTRAINT uq_tbl_oficina_ciudad UNIQUE(ciudad), --Una oficina SOLO puede estar en una ciudad y las ciudades no se peuden repetir.
);

--Para añadir una restricción tras crear una tabla.
ALTER TABLE tbl_oficina ADD CONSTRAINT df_tbl_oficina_codPostal DEFAULT '32001' FOR codPostal;

--Para borrar una restricción ya creada.
ALTER TABLE tbl_oficina DROP CONSTRAINT df_tbl_oficina_codPostal;

--Para añadir una columna a una tabla ya creada.
ALTER TABLE tbl_oficina ADD sexo varchar(50) NOT NULL;

--Para borrar una columna de una tabla, importante eliminar cualquier tipo de restriccion asociada a dicha columna antes de borrar.
ALTER TABLE tbl_oficina DROP COLUMN codPostal;