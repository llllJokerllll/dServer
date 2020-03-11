-- SQL DDL - Data Definition Language: CREATE, ALTER, DROP
/* Esto es un comentario de varias líneas
Nombre:
Fecha de creación: 20-11-2019
Versión: 1.0 
Descripción: Sentencias ejemplo. */

create database bd_ejemplo;

use bd_ejemplo;

drop database bd_ejemplo;

-- Una forma de definir la clave primaria
create table tbl_empleado (
	codigoEmpleado varchar(7) CONSTRAINT PK_tbl_empleado PRIMARY KEY,
	nombre varchar(30),
	apellido1 varchar(50),
	apellido2 varchar(50),
	fehcaNacimiento date,
	codigoOficina integer,
);

-- Otra forma de definir la restricción de clave primaria
create table tbl_empleado (
	codigoEmpleado varchar(7),
	nombre varchar(30),
	apellido1 varchar(50),
	apellido2 varchar(50),
	fehcaNacimiento date,
	codigoOficina integer,
	CONSTRAINT PK_tbl_empleado PRIMARY KEY(codigoEmpleado),
	CONSTRAINT FK_tbl_empleado_tbl_oficina FOREIGN KEY(codigoOficina)
	REFERENCES tbl_Oficina(codigoOficina) 
						ON DELETE NO ACTION 
						ON UPDATE CASCADE,
);

create table tbl_Oficina (
	codigoOficina integer,
	nombreOficina varchar(60),
	direccion varchar(80),
	codigoPostal char(5),
	telefono char(9),
	CONSTRAINT PK_tbl_Oficina PRIMARY KEY(codigoOficina)
);

drop table tbl_empleado;

-- Obtención de las restricciones consultando el esquema de información

-- Obtención de las restricciones de claves de tabla: primarias, candodata y ajena
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS;

-- Obtención de las restricciones de integridad referencial
SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS;