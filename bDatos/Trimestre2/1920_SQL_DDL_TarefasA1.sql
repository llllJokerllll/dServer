-- SQL DDL - Data Definition Language: CREATE, DROP
/* Esto es un comentario de varias líneas
Nombre:
Fecha de creación: 29-11-2019
Versión: 1.0 
Descripción: Sentencias tareas. */

-- Ejemplo sentencia create dabase

create database bd_Departamentos2
on
(
-- Definición del archivo principal
-- Nombre lógico del archivo
NAME=bd_Departamentos2_Data,
FILENAME='c:\Datos\bd_Departamentos2_Data.mdf',
SIZE=14, MAXSIZE=34, FILEGROWTH=2
),
-- Definicón de un archivo secundario
(NAME=bd_Departamentos2_Data_Sec,
FILENAME='c:\Datos\bd_Departamentos2_Data_Sec.ndf',
SIZE=14, MAXSIZE=34, FILEGROWTH=2
),
-- Definicón de un archivo de transacciones
(NAME=bd_Departamentos2_Datos_Log,
FILENAME='c:\Datos\bd_Departamentos2_Datos_Log.ldf',
SIZE=10, MAXSIZE=34, FILEGROWTH=2
)

-- Tarefa 1
-- Creación da base de datos bd_Xogos

CREATE DATABASE bd_xogos
ON PRIMARY
( NAME = bd_xogos_Arch1,
FILENAME = 'C:\datos\bd_xogos_archdat1.mdf',
SIZE = 100MB, MAXSIZE = 200, FILEGROWTH = 20),
( NAME = bd_xogos_Arch2,
FILENAME = 'C:\datos\bd_xogos_archdat2.ndf',
SIZE = 100MB, MAXSIZE = 200, FILEGROWTH = 20),
( NAME = bd_Xogos_Arch3,
FILENAME = 'C:\datos\bd_xogos_archdat3.ndf',
SIZE = 100MB, MAXSIZE = 200, FILEGROWTH = 20)
LOG ON
( NAME = bd_Xogos_Archlog1,
FILENAME = 'C:\datos\bd_xogos_archlog1.ldf',
SIZE = 100MB, MAXSIZE = 200, FILEGROWTH = 20),
( NAME = bd_Xogos_Archlog2,
FILENAME = 'C:\datos\bd_xogos_archlog2.ldf',
SIZE = 100MB, MAXSIZE = 200, FILEGROWTH = 20)
GO

-- Tarefa 2
USE bd_xogos;

-- Tarefa 3
DROP DATABASE bd_xogos;

-- Tarefa 4

CREATE TABLE tbl_estudante(
	idEstudante		nchar(10) NOT NULL,
	nome			nchar(25) NOT NULL,
	apelido1		nchar(50) NOT NULL,
	apelido2		nchar(50) NULL,
	dataNacemento		date NOT NULL,
	enderezoElectronico	nchar(235) NULL,
	telefono		nchar(25) NOT NULL,
	sexo			varchar(2) NULL,
	tipo			nchar(25) NULL,
)



-- Tarefa 6

-- Tarefa 6.1

/* Creación da base de datos bd_TarefasU4 */
CREATE DATABASE bd_tarefasU4;

/* Activación da base de datos tarefas bd_TarefasU4 */
USE bd_tarefasU4;

/* Creación da táboa tbl_Empregado */
CREATE TABLE tbl_empregado(
	dni			nchar(10) NOT NULL,
	nss			nchar(10) NOT NULL,
	nome			nchar(25) NOT NULL,
	apelido1		nchar(50) NOT NULL,
	apelido2		nchar(50) NULL,
	enderezo		nchar(50) NOT NULL,
	dataNacemento		date NOT NULL,
	nacionalidade		nchar(25) NOT NULL,
	telefono		nchar(25) NULL,
	sexo			char(2) NOT NULL,
	tipo			nchar(25) NULL,
-- Definición da restrición de clave primaria
CONSTRAINT PK_tbl_empregado_dni PRIMARY KEY (dni),
-- Definición da restrición de clave única
CONSTRAINT UK_tbl_empregado_nss UNIQUE (nss)
)

-- Tarefa 6.2
/* Activación da base de datos tarefas bd_TarefasU4 */
USE bd_TarefasU4;

/* Creación da táboa tbl_Nacionalidade */
CREATE TABLE tbl_nacionalidade(
	codNacionalidade	int IDENTITY (1,1) NOT NULL,
	codNacion		nchar(30),
	descricion		nchar(240),
	idEmpregado		nchar(10),
	-- Creación da restrición de clave primaria
	CONSTRAINT PK_tbl_nacionalidade_codNacionalidade 
	PRIMARY KEY (codNacionalidade),
	-- Cración da restrición de clave allea referenciando á táboa tbl_Empregado
	CONSTRAINT FK_tblNacionalidade_idEmpregado 
	FOREIGN KEY (idEmpregado) REFERENCES tbl_empregado(dni)
)
-- Tarefa 6.3
/* Activación da base de datos tarefas bd_TarefasU4 */
USE bd_tarefasU4;

/* Creación da táboa tbl_Profesor */

CREATE TABLE tbl_profesor(
	idProfesor			nchar(10) NOT NULL,
	nome				nchar(25) NOT NULL,
	apelido1			nchar(50) NOT NULL,
	apelido2			nchar(50) NULL,
	dataNacemento		date NOT NULL,
	enderezoElectronico	nchar(235) NULL,
	corpo				nchar(100) NOT NULL,
	especialidade		nchar(150) NOT NULL,
	telefono			nchar(25) NOT NULL,
-- Definición da restrición de clave primaria
CONSTRAINT PK_tbl_profesor_dni PRIMARY KEY (idProfesor)
)

/* Creación da táboa tbl_Modulo */
CREATE TABLE tbl_modulo(	
	codModulo	nchar(10)  NOT NULL,
	nome		nchar(25)  NOT NULL,
	descricion	nchar(240) NULL,
	idProfesor	nchar(10)  NULL,
	-- Definición da restrición de clave primaria
	CONSTRAINT PK_tbl_modulo_codModulo PRIMARY KEY (codModulo),
	-- Definición da restrición de clave allea apuntando á táboa tbl_Profesor
	CONSTRAINT FK_tbl_modulo_tbl_profesor FOREIGN KEY (idProfesor) REFERENCES tbl_profesor(idProfesor)
)

-- Tarefa 6.4
/* Activación da base de datos tarefas bd_TarefasU4 */
USE bd_TarefasU4;

/* Creación da táboa tbl_Ciclo */
CREATE TABLE tbl_ciclo(
	codCiclo	nchar(10)  NOT NULL,
	nome		nchar(25)  NOT NULL,
	descricion	nchar(240) NULL,
	codModulo	nchar(10)  NOT NULL,
	-- Definición da restrición de clave primaria
	CONSTRAINT PK_tbl_ciclo_codCiclo 
	PRIMARY KEY (codCiclo),
)
/* Creación da táboa tbl_CicloModulo */
CREATE TABLE tbl_ciclo_modulo (
	codCicloModulo	int IDENTITY (5,2),
	codCiclo	nchar(10)  NOT NULL,
	codModulo	nchar(10)  NOT NULL,
	observacions	nchar(10)   NULL,
	-- Definición da restrición de clave primaria
	CONSTRAINT PK_tbl_ciclo_modulo_codCicloModulo 
PRIMARY KEY (codCicloModulo),
	-- Definición das restricións de clave allea referenciando as táboas tbl_Ciclo e tbl_Modulo
	CONSTRAINT FK_tbl_ciclo_modulo_tbl_ciclo 
FOREIGN KEY (codCiclo) REFERENCES tbl_ciclo(codCiclo),
CONSTRAINT FK_tbl_ciclo_modulo_tbl_modulo 
FOREIGN KEY (codModulo) REFERENCES tbl_modulo(codModulo)
)

-- Tarefa 6.5
/* Activación da base de datos tarefasU4*/
USE bd_tarefasU4;

/* Creación da táboa tbl_Piso */
CREATE TABLE tbl_piso
(
	codPiso		smallint NOT NULL, 
	domicilio		nchar(150) NOT NULL,
	localidade		nchar(80),
	codPostal		nchar(15),
	-- Creación da restrición de clave primaria
	CONSTRAINT PK_tbl_piso_codPiso 
	PRIMARY KEY (codPiso)
) 

/* Creación da táboa tbl_contador */
CREATE TABLE tbl_contador
(
	codContador smallint IDENTITY(1,1) NOT NULL,
	modelo nchar(15) NOT NULL,
	codPiso smallint NOT NULL,   -- NOT NULL especifica a cardinalidade mínima 1
	-- Creación da restrición de clave primaria
	CONSTRAINT PK_tbl_contador_codContador PRIMARY KEY (codContador),
	-- Creación da restrición de clave única
	CONSTRAINT UK_tbl_contador_codPiso UNIQUE (codPiso),
	-- Creación da restrición CHECK ou de validación
	CONSTRAINT CK_tbl_contador_modelo CHECK (modelo IN ('aeg235','samsung20','aeg55')),
	-- Creación da restrición de clave allea referencia á táboa tbl_Piso
	CONSTRAINT Fk_tbl_contador_tbl_Piso FOREIGN KEY (codPiso)
	REFERENCES tbl_piso(codPiso)
		ON DELETE CASCADE
 		ON UPDATE CASCADE
)



-- Tarefa 5

DROP TABLE tbl_nacionalide;

-- Tarefa 7


CREATE INDEX IDX_tbl_Empregado_apelido1 ON tbl_Empregado(apelido1) 

-- Tarefa 8

DROP INDEX tbl_Empregado.IDX_tbl_Empregado_apelido1

-- Tarefa 9

/* Activación da base de datos tarefas bd_TarefasU4 */
USE bd_TarefasU4;

/* Creación da táboa tbl_Estudante */
CREATE TABLE tbl_Estudante(
	idEstudante		nchar(10) NOT NULL,
	nome			nchar(25) NOT NULL,
	apelido1		nchar(50) NOT NULL,
	apelido2		nchar(50) NULL,
	dataNacemento		date NOT NULL,
	enderezoElectronico	nchar(235) NULL,
	telefono		nchar(25) NOT NULL,
-- Creación da restrición de clave primaria
CONSTRAINT PK_tbl_Estudante_idEstudante PRIMARY KEY (idEstudante)
)

/* Creación da táboa tbl_Opina */
CREATE TABLE tbl_Opina(
	codOpina	char(10),
	idProfesor	nchar(10) NOT NULL,
	idEstudante nchar(10) NOT NULL,
	codModulo	nchar(10)  NOT NULL,
	Opinion		nchar(240) NOT NULL,
-- Definición da restrición de clave primaria
CONSTRAINT PK_tbl_Opina_codOpina PRIMARY KEY (codOpina),
-- Definición das restricións de clave allea 
CONSTRAINT FK_tbl_Opina_tbl_Estudante 
FOREIGN KEY (idEstudante) REFERENCES tbl_Estudante(idEstudante),
CONSTRAINT FK_tbl_Opina_tbl_Profesor 
FOREIGN KEY (idProfesor) REFERENCES tbl_Profesor(idProfesor),
CONSTRAINT FK_tbl_Opina_tbl_Modulo 
FOREIGN KEY (codModulo) REFERENCES tbl_Modulo(codModulo),
)

/* Creación do índice simple */
CREATE INDEX IDX_tbl_Estudante_apelido1 ON tbl_Estudante(apelido1) 
/* Creación do índice composto */
CREATE INDEX IDX_tbl_Profesor_nome_e_apelidos ON tbl_Profesor(apelido1, apelido2, nome) 
/* Borrado do índice */
DROP INDEX tbl_Profesor.IDX_tbl_Profesor_nome_e_apelidos

/* Borrado da táboa tbl_Opina */
DROP TABLE tbl_Opina

