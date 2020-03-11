/*Sobre a base de datos tendaBD */
use tendabd;
/*  1.1. Seleccionar código e peso dos artigos que teñen o peso máis pequeno có peso do 
artigo de código '077WN45'. */
select art_codigo, art_peso
from artigos
where art_peso <(select art_peso from artigos where art_codigo='077WN45');

/* 1.2. Seleccionar código, nome, peso e cor dos artigos da mesma cor có artigo 
de código '242C283', e que teñan un peso maior ou igual co peso medio de todos os artigos. */
select art_codigo, art_nome, art_peso, art_color
from artigos
where art_color = (select art_color from artigos where art_codigo='242C283')
and art_peso>= ( select avg(art_peso) from artigos);

/* 1.3. Seleccionar código da tenda e nome do xerente das tendas nas que se vendeu 
polo menos unha unidade do artigo de código ' 077WN45'. */
select t.tda_id , e.emp_nome
from tendas t join empregados e
on e.emp_id=t.tda_xerente
where t.tda_id = any /* in */ (
select distinct v.ven_tenda 
from vendas v join detalle_vendas d
on v.ven_id = d.dev_venda
where d.dev_artigo ='077wn45');

/* 1.4. Mostrar a lista de artigos cun prezo de venta maior có 
prezo de venta do artigo máis barato de cor negra. Obter o mesmo 
resultado nos dous casos seguintes:
– Utilizando any.
– Utilizando a función min(). */
select * from artigos
where art_pv > any ( select art_pv from artigos where art_color like '%negro%');

select * from artigos
where art_pv >  (select min(art_pv) from artigos where art_color like '%negro%');
 
 /* 1.5. Seleccionar código de artigo, descrición do artigo e código do provedor
 para os artigos que subministra o provedor que ten o nome SEAGATE. */
 select a.art_codigo, a.art_nome, a.art_provedor, p.prv_nome
 from artigos a join provedores p
 on a.art_provedor=p.prv_id
 where p.prv_nome like '%SEAGATE%';
 
 Select art_codigo, art_nome, art_provedor
 from artigos where art_provedor = 
 (select prv_id from provedores where prv_nome like '%SEAGATE%');
 
 /* 1.6. Mostrar información do artigo máis caro, Seleccionando o seu código, 
 nome, prezo de venta e nome do provedor que o subministra. */
 select a.art_codigo, a.art_nome, a.art_pv, p.prv_nome
 from artigos a join provedores p
 on a.art_provedor=p.prv_id
 where a.art_pv = (select max(art_pv) from artigos);
 
 /* Sobre a base de datos traballadores*/
 use traballadores;
 /* 1.7. Mostrar nomes e salarios dos empregados que teñan salario maior có 
 salario de tódolos empregados do departamento 122. O resultado móstrase 
 ordenado por nome de empregado. */
 
 select empnome, empsalario from empregado
 where empsalario > all ( select empsalario from empregado where empdepartamento=122);

 select empnome, empsalario from empregado
 where empsalario > ( select max(empsalario) from empregado where empdepartamento=122);
 
/* 1.8. Mostrar os nomes e salarios dos empregados con salarios maiores ou 
iguais a o de Claudia Fierro, ordenados alfabeticamente. Resolver esta consulta:
– con subconsulta.
– sen subconsulta utilizando JOIN.*/
use traballadores;
select empnome, empsalario from empregado
where empsalario >= (select empsalario from empregado where empnome like '%fierro, claudia%')
order by empnome;

select e1.empnome, e1.empsalario 
from empregado e1 join empregado e2 on e2.empnome like '%fierro, claudia%'
where e1.empsalario>= e2.empsalario 
order by empnome;

select e1.empnome, e1.empsalario 
from empregado e1 join empregado e2 on e1.empsalario>= e2.empsalario
where e2.empnome like '%fierro, claudia%'
order by empnome;

/* 1.9. Mostrar nome e presuposto dos departamentos que teñen o presuposto 
máis alto e o máis baixo. */
select depnome, deppresuposto from departamento
where deppresuposto = (select min(deppresuposto) from departamento)
or deppresuposto = (select max(deppresuposto) from departamento);


/* 1.10. Mostrar número, nome, data de ingreso na empresa e nome do departamento 
no que traballa o empregado ou empregados que levan máis tempo na empresa.*/
select e.empnumero, e.empnome, e.empdataingreso, d.depnome
from empregado e join departamento d on d.depnumero=e.empdepartamento
where e.empdataingreso = (select min(empdataingreso) from empregado);

select * from empregado order by empdataingreso;

/* 1.11. Mostrar nome e salario dos empregados que cumpran algunha das seguintes condicións:
– Ingresaron na empresa despois do 1-1-88.
– Ingresaron na empresa antes do 1-1-88 pero teñen un salario inferior ao salario 
medio de todos os empregados da empresa. */
select empnome, empsalario from empregado
where empdataingreso > '1988-1-1' or 
(empdataingreso < '1988-1-1' and empsalario < (select avg(empsalario) from empregado) );

/*1.12. Mostrar a extensión telefónica asignada a máis empregados indicando o 
número de empregados que a comparten. Se hai máis dunha, deben aparecer todas. */

insert into  empregado ()
	values (610,110,760,'1953-03-12','1996-11-01','2000.00',null,1,' CABANILLAS, RAMON');

select count(*), empextension
from empregado
group by empExtension
having count(*) = (select count(*) from empregado group by empExtension
order by 1 desc limit 1);


/*Sobre a base de datos tendaBD
2.1. Mostrar nome e prezo de venda dos artigos que teñen un prezo de venda comprendido 
entre o prezo do artigo '0713242' e a media de prezos de todos os artigos. 
Os datos deben mostrarse ordenados alfabeticamente polo nome do artigo. */
use tendabdartigos;
select art_nome, art_pv from artigos
where art_pv between (select art_pv from artigos where art_codigo='0713242') and
(select avg(art_pv) from artigos)
order by art_nome;



/* Sobre a base de datos traballadores 
2.2. Seleccionar o nome e número de departamento dos empregados que pertenzan a un departamento 
cun presuposto comprendido entre os presupostos dos departamentos 122 e 121 (incluídos). 
Os datos deben mostrarse ordenados de menor a maior polo número do departamento. */
use traballadores;
select e.empnome, e.empdepartamento 
from empregado e join departamento d on e.empdepartamento=d.depnumero
where d.deppresuposto between 
(select deppresuposto from departamento where depnumero=122) and
(select deppresuposto from departamento where depnumero=121) 
order by 2;

select empnome, empdepartamento 
from empregado 
where empdepartamento = any 
(select depnumero from departamento
where deppresuposto between 
	(select deppresuposto from departamento where depnumero=122) and
	(select deppresuposto from departamento where depnumero=121) )
order by 2;

/*Sobre a base de datos tendaBD
3.1. Obter a lista de provedores que subministran como mínimo un artigo de cor negra. */
use tendabd;
select * from provedores where prv_id in 
(select dvendasistinct art_provedor from artigos where art_color like 'negro');


/* 3.2. Mostrar identificador de cliente, apelidos e nome na mesma columna separados por coma, 
para os clientes que só teñen unha venda. O resultado estará ordenado polo identificador do cliente. */
select clt_id, concat(clt_apelidos, ', ', clt_nome) as 'Nome'
from clientes where clt_id in 
( select ven_cliente from vendas group by ven_cliente having count(*)=1 )
order by 1;


/*3.3. Mostrar identificador e nome dos clientes que fixeron algunha compra despois do día en que o 
cliente número 6 fixo a súa última compra. */ 
select clt_id, clt_nome from clientes
where clt_id in (select ven_cliente from vendas where ven_data> 
(select max(ven_data) from vendas where ven_cliente=6));


/*3.4. Mostrar os nomes dos xerentes das tendas nas  que se fixo algunha venta. */

 select distinct e.emp_nome 
from empregados e join tendas t on e.emp_id=t.tda_xerente
where tda_id in (select distinct ven_tenda from vendas);

select distinct emp_nome 
from empregados 
where emp_id in ( select tda_xerente from tendas where tda_id in (select distinct ven_tenda from vendas));
 
/* 3.5. Importe total das vendas (sin desconto) que se fixeron ao cliente LEANDRO FERREIRO BENITEZ. */
use tendabd;
select sum(dev_prezo_unitario*dev_cantidade) as "Importe total"
from detalle_vendas 
where dev_venda in (select ven_id from vendas where ven_cliente in 
(select clt_id from clientes where clt_nome like 'Leandro' and clt_apelidos like 'Ferreiro Benitez' ) );

select sum(d.dev_prezo_unitario*d.dev_cantidade) as "Importe total"
from detalle_vendas d join vendas v join clientes c
on d.dev_venda=v.ven_id and v.ven_cliente=c.clt_id
where c.clt_nome like 'Leandro' and c.clt_apelidos like 'Ferreiro Benitez';

select sum(d.dev_prezo_unitario*d.dev_cantidade) as "Importe total"
from detalle_vendas d join vendas v 
on d.dev_venda=v.ven_id 
where v.ven_cliente in 
(select clt_id from clientes where clt_nome like 'Leandro' and clt_apelidos like 'Ferreiro Benitez' );


/*3.6. Seleccionar o id, apelidos e nome dos empregados que aínda non fixeron ningunha venda.*/
select emp_id, emp_apelidos, emp_nome from empregados where emp_id not in
(select ven_empregado from vendas);

/* usando exists*/
select e.emp_id, e.emp_apelidos, e.emp_nome from empregados e where not exists
(select ven_empregado from vendas v where e.emp_id=v.ven_empregado);


/* Sobre a base de datos traballadores
3.7 Mostrar o número de departamento e o número de empregados dos
departamentos que teñen un presuposto anual superior a 36000 euros. */
use traballadores;
select d.depnumero, count(e.empdepartamento)
from departamento d join empregado e on d.depnumero=e.empdepartamento
where d.deppresuposto>36000
group by d.depnumero;

select empdepartamento, count(empdepartamento)
from empregado
where empdepartamento in (select depnumero from departamento where deppresuposto>36000)
group by empdepartamento;


/* 3.8. Mostrar nome de departamento e nombre del empregado para os empregados que
traballan nalgún departamento que perteza ó centro SEDE CENTRAL. Os datos
mostraranse ordenados por departamento e nome de empregado. */
select d.depnome, e.empnome
from empregado e join departamento d on d.depnumero=e.empdepartamento
where d.depcentro in (select cennumero from centro where cennome like 'Sede central')
order by 1,2;


/* 3.9. Mostrar número de empregados e suma dos salarios, suma de comisións e suma de fillos, para
os departamentos nos que existe algún empregado cun salario base mensual maior de
2000 euros. */
use traballadores;
select count(empnumero) as 'Empleados', sum(empsalario) as 'Suma salarios',
sum(ifnull(empcomision,0)) as 'Comisiones' , sum(empfillos) as 'Fillos' , empdepartamento
from empregado
where empdepartamento in (select distinct empdepartamento from empregado where empsalario>2000)
group by empdepartamento;

/*3.10. Mostrar o nome de todos os directores de departamento ordenados polo
número de departamento. Resolver a consulta:
– con subconsultas.
– sen subconsultas. */

select empnome from empregado where empnumero in (select depdirector from departamento)
order by empdepartamento;

select e.empnome from empregado e join departamento d on e.empnumero=d.depdirector
order by e.empdepartamento;

/* 3.11. Mostrar os nomes dos directores de departamentos que dependen dun
centro de traballo que ten un nome que empeza pola letra S. Resolver a consulta:
– con subconsultas.
– sen subconsultas. */

select empnome, empdepartamento from empregado
where empnumero in ( select depdirector from departamento where depcentro in
(select cennumero from centro where cennome like 'S%') );

select e.empnome, e.empdepartamento from empregado e join departamento d
join centro c on e.empnumero=d.depdirector and d.depcentro=c.cennumero
where c.cennome like 'S%';

/* 3.12. A empresa decide gratificar aos directores en funcións incrementando o
seu salario base un 5%. Mostrar ordenados alfabeticamente, os nomes destes
empregados, o seu salario, a gratificación que lle corresponde, e o salario final que
resulta de sumarlle a nova gratificación ao salario. Resolver a consulta:
– con subconsultas.
– sen subconsultas. */
Select empnome, empsalario, empsalario*0.05 as 'Incremento', empsalario*1.05 as 'Salario final'
from empregado
where empnumero in ( select depdirector from departamento where deptipodirector like 'F' )
order by empnome;

Select e.empnome, e.empsalario, e.empsalario*0.05 as 'Incremento', e.empsalario*1.05 as 'Salario final'
from empregado e join departamento d on e.empnumero=d.depdirector
where d.deptipodirector like 'F'
order by e.empnome;

/* 3.13. Mostrar nome e salario dos empregados co salario base maior cá media
dos soldos dos directores que están en funcións. */

select empnome, empsalario from empregado
where empsalario > ( select avg(empsalario) from empregado where empnumero in
(select depdirector from departamento where deptipodirector='F') );


/* 3.14. Mostrar nome e salario+comisións dos empregados do centro
“RELACIÓN CON CLIENTES ” que gañan máis de 1500 euros entre salario e
comisións, ordenados por departamento, salario+comisión e nome. */

select empnome, empsalario+ifnull(empcomision,0) as 'Salario'
from empregado 
where (empsalario+ifnull(empcomision,0))>1500 and empdepartamento in
(select d.depnumero from departamento d join centro c on d.depcentro=c.cennumero
where c.cennome like 'RELACION CON CLIENTES')
order by empdepartamento, 2, 1;

select empnome, empsalario+ifnull(empcomision,0) as 'Salario'
from empregado 
where (empsalario+ifnull(empcomision,0))>1500 and empdepartamento in
(select depnumero from departamento where depcentro in (
select cennumero from centro where cennome like 'RELACION CON CLIENTES'))
order by empdepartamento, 2, 1;

select e.empnome, e.empsalario+ifnull(e.empcomision,0) as 'Salario'
from empregado e join departamento d on e.empdepartamento=d.depnumero
where (e.empsalario+ifnull(e.empcomision,0))>1500 and d.depcentro =
(select cennumero from centro where cennome like 'RELACION CON CLIENTES')
order by empdepartamento, 2, 1;


/* 3.15. Mostrar os nomes dos empregados que traballan no mesmo departamento
que Lavinia Sanz ou Cesar Pons. */
select empnome, empdepartamento
from empregado
where empdepartamento in (select distinct empdepartamento 
from empregado where empnome in ('pons, cesar','sanz, lavinia'));

select e1.empnome, e1.empdepartamento
from empregado e1 join empregado e2 on e1.empdepartamento=e2.empdepartamento
where e2.empnome in ('pons, cesar','sanz, lavinia');


/*
Sobre a base de datos tendaBD
4.1. Mostrar a lista de artigos cun prezo de venta maior có prezo de venta do artigo
 máis barato de cor negra utilizando unha consulta de existencia. */
 use tendabd;
 select * from artigos a1 where exists
 (select a2.art_pv from artigos a2 where a1.art_pv>a2.art_pv and a2.art_color like 'negro');
 
 
/* 4.2. Mostrar o nome dos artigos de cor negra que teñan algunha venda de máis 
de 5 unidades. Obter o mesmo resultado nos dous casos seguintes:
– sen utilizar join. – utilizando join. */
use tendabd;
select a.art_nome from artigos a where a.art_color like 'Negro' and
exists (select d.dev_artigo from detalle_vendas d 
where d.dev_artigo=a.art_codigo and d.dev_cantidade>5 );

select distinct a.art_nome, a.art_color, a.art_codigo from artigos a join detalle_vendas d 
on d.dev_artigo=a.art_codigo where a.art_color like 'Negro'  and d.dev_cantidade>5 ;



