-- Crear bases de Datos, version extendida
CREATE DATABASE bd_Departamentos ON (
-- Definir el archivo principal
NAME = bd_Departamentos_data_bis,
FILENAME = 'E:\dual110\BDs\bd_Departamentos_data_bis.mdf',
SIZE=10, MAXSIZE=20, FILEGROWTH=2
),
-- Definir el archivo secundario
(
NAME = bd_Departamentos_data_sec_bis,
FILENAME = 'E:\dual110\BDs\bd_Departamentos_data_sec_bis.ndf',
SIZE=10, MAXSIZE=20, FILEGROWTH=2
),
-- Definir el archivo de transacciones
(
NAME = bd_Departamentos_data_log_bis,
FILENAME = 'E:\dual110\BDs\bd_Departamentos_data_log_bis.ldf',
SIZE=5, MAXSIZE=10, FILEGROWTH=2
);

DROP DATABASE bd_Departamentos;

CREATE DATABASE bd_ejemplo;
USE bd_ejemplo;

-- Definición de claves primarias
-- tipo datos uniqueidentifier
-- asociado NEWID()

CREATE TABLE tbl_estudiante2 (
idEstudiante uniqueidentifier DEFAULT NEWID(),
nombre varchar(15) NOT NULL,
apellido1 varchar(30) NOT NULL,
apellido2 varchar(30) NULL,
);

-- Crear tipos de datos
CREATE TYPE tipoNomes FROM varchar(50) NOT NULL;

CREATE TABLE tbl_estudiante3 (
idEstudiante uniqueidentifier DEFAULT NEWID(),
nombre tipoNomes,
apellido1 tipoNomes,
apellido2 varchar(30) NULL,
);

-- Se necesita borrar o quitar de las tablas contengan este TYPE antes de poder eliminarlo.
DROP TYPE tipoNomes;

-- Alternativa de creación al CREATE TYPE
EXEC sp_addtype tipoCidade, 'varchar(30)', NULL;

-- Alternativa de borrado al DROP TYPE
EXEC sp_droptype tipoCidade;

-- SELECT * FROM SYS_column_type_usages; ??????? la profe no sabe como funciona