USE traballadores;
select* FROM departamento;
/* Ej 1 */
drop procedure if exists contarEmpleados;
delimiter //
create procedure contarEmpleados()
begin
UPDATE departamento as d 
set depEmpregados = (SELECT count(*) FROM empregado where empDepartamento = depNumero);
end ;
//
delimiter ;

call contarEmpleados();


/* Ej 2 */
CREATE database utilidades;
use utilidades;

drop procedure if exists vertaboas;
delimiter //
create procedure vertaboas(bd varchar(30))
begin
if bd LIKE "*" THEN
	 select table_schema, table_name, table_type, engine, table_rows
	 from information_schema.tables
	 ORDER BY 1, 2;
ELSE 
	SELECT count(*) into @existe
	from information_schema.SCHEMATA
	where SCHEMA_NAME = bd;

	IF @existe THEN
    SELECT  table_name, table_type, engine, table_rows FROM information_schema.tables where table_schema = bd;
    ELSE
    SELECT concat("La base de datos ", bd, " non existe en el servidor");
    END IF;
END IF;
end ;
//
delimiter ;

call vertaboas("*");
call vertaboas("traballadores");
call vertaboas("jidaomdjoqdmqp");

