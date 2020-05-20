USE traballadores;
/*Ej 1*/
/*Borrar vista*/
/*DROP VIEW vista_empleados;*/
/*Crear vista*/
create view vista_empleados(id,nombre,ext,depNum,dep)
AS SELECT e.empNumero, e.empNome, e.empExtension, e.empDepartamento, d.depNome  FROM empregado as e
join departamento as d on empDepartamento = depNumero;
/*Crear los empleados de prueba*/
INSERT INTO vista_empleados(nombre,ext,depNum) values("Pepe",777,110); /*Funciona*/
INSERT INTO vista_empleados(nombre,ext,depNum) values("Pipo Vive",777,5); /*Funciona*/
INSERT INTO vista_empleados(nombre,ext,depNum) values(NULL,777,5); /*No funciona, el nombre no puede ser null*/
INSERT INTO vista_empleados(ext,depNum) values(777,5); /*No funciona, el nombre es un campo obligatorio*/
/*Mostrar los empleados de la vista*/
SELECT * FROM vista_empleados ORDER BY nombre;
/*Borar los empleados de prueba*/
/*DELETE FROM empregado where empNumero > 644;*/

/*Ej 2*/
/*Borrar vista*/
/*DROP VIEW vista_departamento;*/
/*Crear vista*/
create view vista_departamento
AS SELECT *  FROM departamento 
where 
depNumero IN (SELECT depNumero FROM empregado) AND
depCentro IN (SELECT cenNumero FROM centro) AND
depPresuposto between 100000 AND 2000000 AND
(deptipoDirector LIKE "P" OR deptipoDirector LIKE "F")
WITH CHECK OPTION;
/*Mostrar los departamentos de la vista*/
SELECT * FROM vista_departamento;
insert into vista_departamento values(1,"Beagle",1,"R",4,NULL,5,NULL); /*No se pueden meter valores que no cumplan las condiciones*/

/*Ej 3*/
/*Borrar vista*/
/*DROP VIEW empleados_dep_111;*/
/*Crear vista*/
create view empleados_dep_111
AS SELECT *  FROM empregado 
where 
empDepartamento = 111
WITH CHECK OPTION;
/*Modificar valores de la vista*/
UPDATE empleados_dep_111 SET empFillos = 5 WHERE empNumero = 240; /*Funciona*/
UPDATE empleados_dep_111 SET empDepartamento = 5 WHERE empNumero = 240; /*No funciona, ya que dejaría de cumplirse la condición*/
UPDATE empleados_dep_111 SET empFillos = 5 WHERE empNumero = 900; /*La sentencia se ejecuta pero no modifica al empleado ya que no existe/
/*Mostrar los departamentos de la vista*/
SELECT * FROM empleados_dep_111;

/*Ej 4*/
/*Borrar vista*/
DROP VIEW empleados_pros;
/*Crear vista*/
create view empleados_pros
AS SELECT *  FROM empregado 
where 
empFillos >= 2 AND
timestampdiff(year,empDataIngreso,now()) > 20
WITH CHECK OPTION;
/*Modificar valores de la vista*/
DELETE FROM empleados_pros where empNumero = 120; /* No ocurre nada ya que no está en la vista*/
DELETE FROM empleados_pros where empNumero = 900; /* No ocurre nada ya que no existe*/
DELETE FROM empleados_pros where empNumero = 260; /* El empleado se borra de la lista y de la tabla empleados*/
/*Mostrar los departamentos de la vista*/
SELECT * FROM empleados_pros;

/* Ejercicios tendabd */
USE tendabd;
SELECT * FROM artigos;
/*Ej 5*/
/*Borrar vista*/
DROP VIEW view_artigos_proveedor;
/*Crear vista*/
CREATE VIEW view_artigos_proveedor
AS SELECT a.art_codigo, a.art_nome, p.prv_nome  FROM artigos as a
join provedores as p
on p.prv_id = a.art_provedor;
/*Insertar datos*/
INSERT INTO view_artigos_proveedor(art_codigo,prv_nome) 
values("4065091",(SELECT prv_nome from provedores WHERE prv_id=1)); /*No funciona porque tiene que modificar varias tablas*/
INSERT INTO view_artigos_proveedor(art_codigo,prv_nome) 
values("0001122",(SELECT prv_nome from provedores WHERE prv_id=100)); /*No funciona porque tiene que modificar varias tablas*/
INSERT INTO view_artigos_proveedor(art_codigo,prv_nome) 
values("0001122",(SELECT prv_nome from provedores WHERE prv_id=1)); /*No funciona porque tiene que modificar varias tablas*/
/*Mostrar la vista*/
select * FROM view_artigos_proveedor ORDER BY art_nome;

/*Ej 6*/
/*Borrar vista*/
DROP VIEW view_detalle_vendas;
/*Crear vista*/
CREATE VIEW view_detalle_vendas(codigo,ventas)
AS SELECT dev_artigo, sum(dev_cantidade) 
FROM detalle_vendas
GROUP BY dev_artigo
ORDER BY 1;
/*Insertar datos*/
INSERT INTO view_detalle_vendas values("AAAAAA",777); /*No funciona porque hay campos obligatorios que no tienen valor*/
DELETE FROM view_detalle_vendas where codigo=0713242; /*No se puede borrar*/
/*Mostrar la vista*/
select * FROM view_detalle_vendas;

/*Ej 7*/
/*Borrar vista*/
DROP VIEW view_vendas_30;
/*Crear vista*/
CREATE VIEW view_vendas_30
AS SELECT *
FROM vendas
where ven_tenda = 30
WITH CHECK OPTION;
/*Insertar datos*/
update view_vendas_30 set ven_cliente = 101 where ven_id = 98; /*Da error porque no se puede meter un cliente que no existe, ya que es una clave foranea*/
update view_vendas_30 set ven_cliente = 100 where ven_id = 200; 
update view_vendas_30 set ven_cliente = 100 where ven_id = 98; /*Funciona y cambia el valor tanto en la vista como en la tabla vendas*/
/*Mostrar la vista*/
select * FROM view_vendas_30;

/*Ej 8*/
/*Borrar vista*/
DROP VIEW view_artigos;
/*Crear vista*/
CREATE VIEW view_artigos
AS SELECT art_codigo, art_nome, art_stock, art_alta, art_provedor
FROM artigos
WHERE art_alta > '2010-01-01'
ORDER BY 5, 3 DESC, 1;
/*Borrar datos*/
DELETE FROM view_artigos where art_codigo="00112233"; /*No se puede borrar*/
/*Mostrar la vista*/
select * FROM view_artigos ORDER BY art_nome;


