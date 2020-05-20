-- Ej1
drop procedure if exists Ej1;
-- Proceso
delimiter //
create procedure Ej1()
begin
declare vNumero integer;
declare vFinal bit;

set vNumero = 0;
set vFinal = 0;

select vNumero;
select vFinal;
end ;
//
delimiter ;
-- Llamada
call Ej1();

-- Ej2
drop procedure if exists Ej2;

delimiter //
create procedure Ej2()
begin
declare vEstado varchar(10);
declare vNomeProvincia varchar(10);

set vEstado = 'servido';
set @idade = 26;
set @@autocommit = false;
-- El siguiente lo comento porque no tengo la base de datos de la provincia, pero debería ser algo así
-- set vNomeProvincia = (SELECT nomeProvincia  FROM codigoProvincia where edad=15);

select vEstado;
select @idade;
select @@autocommit;
-- select vNomeProvincia;
end ;
//delimiter ;
call Ej2();

-- Ej3
drop procedure if exists evaluaNumero;
delimiter //
create procedure evaluaNumero()
begin
declare vNumero integer;
set vNumero = -3;
    IF vNumero > 0 THEN SELECT'POSITIVO';
    ELSEIF vNumero < 0 THEN SELECT 'NEGATIVO';
    ELSE SELECT "CERO";
    END IF;
end ;
//
delimiter ;
call evaluaNumero();

-- Ej4
drop procedure if exists Ej5;
delimiter //
create procedure Ej5()
begin
declare vNumeroInicio int;
declare vNumeroFinal int;
declare total int;
set vNumeroInicio = 50;
set vNumeroFinal = 100;
set total = 0;
if vNumeroInicio % 2 != 0 then
	set vNumeroInicio = vNumeroInicio + 1;
end if;
bucle: while (vNumeroInicio < vNumeroFinal) do
    set total = total + 1;
	set vNumeroInicio = vNumeroInicio + 2;
end while bucle;
	select total;
end ;
//
delimiter ;
call Ej5();

-- Ej6
drop procedure if exists Ej6;
delimiter //
create procedure Ej6()
begin
declare intentos int;
declare valor int;
declare valorActual int;
set intentos = 0;
set valor = 58;
         REPEAT
           SET intentos = intentos + 1;
           SET valorActual = FLOOR(RAND() * 101);
         UNTIL valorActual = valor
         END repeat;
	select intentos;
end ;
//
delimiter ;
call Ej6();

