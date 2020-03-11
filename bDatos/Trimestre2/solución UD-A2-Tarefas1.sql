use tendabd;

/* 1.1. Seleccionar os artigos de cor negra e mostrar o seu 
número, nome e peso, así como o nome do provedor */
select a.art_codigo, a.art_nome, a.art_peso, p.prv_nome
from artigos a join provedores p
on (a.art_provedor=p.prv_id)
where a.art_color like 'negro';

/* 1.2. Seleccionar para todos os clientes, nome, apelidos e o nome da 
provincia na que residen. Os dous primeiros díxitos do código 
postal (clt_cp) corresponden ao código da provincia na que reside o cliente. 
Ordenar o resultado polo nome da provincia, e dentro da provincia, 
polos apelidos e nome, alfabeticamente. */
select a.clt_apelidos, a.clt_nome, b.pro_nome 
from clientes a join provincias b
on (substring(a.clt_cp,1,2)=b.pro_id)
order by 3,1,2;

select clt_apelidos, clt_nome, pro_nome 
from clientes a join provincias b
on (left(a.clt_cp,2)=b.pro_id)
order by 3,1,2;


/* 1.3. Mostrar para cada venda: nome e apelidos do cliente, día, 
mes, e ano da venda (cada un nunha columna). */
select c.clt_nome, c.clt_apelidos, day(v.ven_data), month(v.ven_data), year(v.ven_data) 
from clientes c join vendas v
on (c.clt_id=v.ven_cliente);

/* 1.4. Mostrar unha lista que conteña: número de vendas, número de artigos vendidos, 
suma de unidades vendidas e a media dos prezos unitarios dos artigos vendidos. */
select count(distinct(dev_venda)) as 'Ventas totales',
count(distinct(dev_artigo)) as 'Articulos vendidos', 
sum(dev_cantidade) as 'Unidades totales vendidas', 
avg(dev_prezo_unitario) as 'Media de precio de venta'
from detalle_vendas;


/* 1.5. Seleccionar para cada artigo o seu número, nome, peso e o nome que co-rresponde 
ao peso (peso_nome), tendo en conta a información contida na táboa pesos, que da un nome
 aos pesos en función do intervalo ao que pertence. Ordenar o resultado polo peso do artigo, 
 de maior a menor.*/
select a.art_codigo, a.art_nome, a.art_peso, p.peso_nome
from artigos a join pesos p
on (a.art_peso between p.peso_min and p.peso_max)
order by 3 desc;

/* 1.6. Mostrar para cada venta: nome e apelidos do cliente, a data da venta con 
formato dd/mm/aa e os días transcorridos dende que se fixo a venta. 
Ordenar o resulta-do polo número de días transcorridos dende a venta.*/
select a.clt_nome, a.clt_apelidos, date_format(b.ven_data,'%d/%m/%y') as 'Fecha compra',
timestampdiff(day,b.ven_data,now()) as 'Días transcurridos'
from clientes a join vendas b
on (b.ven_cliente=a.clt_id)
order by 4;

/* 1.7 Seleccionar os nomes das provincias nas que temos clientes.*/
select distinct p.pro_nome 
from clientes c join provincias p
on (left(c.clt_cp,2)=p.pro_id);

/* 1.8. Seleccionar para cada venda:
– Datos da venda: identificador e data da venda.
– Datos do cliente: nome do cliente (nome e apelidos separados por coma).
– Datos do empregado: nome do empregado (nome e apelidos separados por coma). 
Mostrar os datos ordenados polos apelidos e nome do cliente.*/
select concat(c.clt_nome,',', c.clt_apelidos) as 'Cliente', v.ven_id, v.ven_data,
concat(e.emp_nome,',',e.emp_apelidos) as 'Empleado'
from clientes c join vendas v join empregados e
on (c.clt_id=v.ven_cliente and v.ven_empregado=e.emp_id)
order by 1;

/* 1.9. Seleccionar información sobre os artigos vendidos. Para cada liña de detalle interesa:
– Datos do cliente: apelidos e nome separados por coma, nunha única columna.
– Datos do artigo: nome, cantidade, prezo unitario, desconto e o importe final para o cliente 
(resultado de multiplicar a cantidade polo prezo unitario e aplicar o desconto que corresponde). 
Mostrar os resultados ordenados polo nome do artigo. */
select concat(c.clt_nome,',', c.clt_apelidos) as 'Cliente' ,
a.art_nome, d.dev_cantidade,d.dev_prezo_unitario, d.dev_desconto,
(d.dev_prezo_unitario - (d.dev_prezo_unitario)*d.dev_desconto/100) *
d.dev_cantidade as 'Importe final'
from detalle_vendas d
join artigos a
join clientes c
join vendas v
on (a.art_codigo=d.dev_artigo and v.ven_cliente=c.clt_id and v.ven_id=d.dev_venda)
order by 2;

use traballadores;
/* 1.10. Seleccionar o número e nome de departamento, xunto co nome do director, 
para os departamentos independentes, é dicir, que non dependen de ningún outro depar-tamento. */
select d.depnumero, d.depnome, e.empnome
from departamento d join empregado e
on (d.depdirector=e.empnumero)
where d.depdepende is null;

/* 1.11. Mostrar nome (só nome, sen apelidos) e enderezo do centro ao que perten-ce 
o departamento no que traballa, dos empregados cun nome (sen ter en conta os apelidos) 
que empece por 'A'. */

select right(e.empnome,length(e.empnome)-locate(',',e.empnome)) as 'Nome' ,
c.cenenderezo
from empregado e join centro c join departamento d
on (e.empdepartamento=d.depnumero and d.depcentro=c.cennumero) 
where e.empnome like '%, A%' or e.empnome like '%,A%';


/* 1.12. Seleccionar para todos os empregados que non son directores, 
o nome de departamento no que traballa, o seu nome e salario, o nome 
e salario do director do seu departamento, e a diferenza do seu salario e
 o salario do director do departamento. Or-denar o resultado polo nome do departamento.
Solicítase esta información para facer un estudio da diferenza de salarios 
entre os direc-tores dos departamento e os traballadores que traballan no departamento. */
select d.depnome as 'Departamento',
e.empnome as 'Empleado',
e.empsalario as 'Salario empleado',
e2.empnome as 'Director',
(e2.empsalario-e.empsalario) as 'Diferencia salario'
from departamento d join empregado e join empregado e2
on (e.empdepartamento=d.depnumero and d.depdirector=e2.empnumero )
where e.empnumero <> d.depdirector 
order by 1;


select d.depnome as 'Departamento',
e.empnome as 'Empleado',
e.empsalario as 'Salario empleado',
e2.empnome as 'Director',
(e2.empsalario-e.empsalario) as 'Diferencia salario'
from empregado e join departamento d join empregado e2
on (e.empdepartamento=d.depnumero and d.depdirector=e2.empnumero )
where e.empnumero not in (select depdirector from departamento) 
order by 1;


insert into  empregado ()
	values (666,1100,550,'1953-03-12','1996-11-01','2000.00',null,1,'LAGUNA, LAURA');
/* Mostrar nombre del empleado, nombre del departamento de todos los empleados
a) Mostrar todos los empleados tengan o no departamento
b) Mostrar solo los empleados que tengan departamento
*/
select e.empnome, d.depnome
from empregado e left join departamento d 
on (e.empdepartamento=d.depnumero);

select e.empnome, d.depnome
from empregado e join departamento d 
on (e.empdepartamento=d.depnumero);


/* Sobre a base de datos tendaBD

2.1. Para todos os clientes con identificador inferior ou igual a 10, 
seleccionar os datos das vendas que se lle fixeron. Hai que mostrar 
para cada venda, o identificador do cliente, apelidos, nome e data 
de venda. Se a algún deses clientes non se lle fixo ningu-nha venda, 
deberá aparecer na lista co seu identificador, nome, apelidos, e o texto
 'SEN COMPRAS' na columna da data da venda. */
use tendabd;
select c.clt_id, c.clt_apelidos, c.clt_nome, ifnull(v.ven_data,'Sen compras')
from clientes c left join vendas v 
on (c.clt_id=v.ven_cliente)
where c.clt_id<=10;

/* 2.2. Seleccionar os nomes das provincias nas que non temos ningún cliente */

select distinct pro_nome from provincias 
where pro_id not in (
select distinct left(clt_cp,2) from clientes );

/* 2.3. Seleccionar o código (emp_id), apelidos e nome de todos os empregados. 
Engadir unha columna na lista de selección, co alias Vendas, na que se mostre o 
literal 'Si' se o empregado fixo algunha venda, ou o literal 'Non' no caso de que
 aínda non fi-xera ningunha venda. */

select distinct e.emp_id, e.emp_apelidos, e.emp_nome, 
if(v.ven_data is null, 'No', 'Si') as 'Vendió'
from empregados e left join vendas v
on (e.emp_id=v.ven_empregado);

/* 3.1. Obter unha lista de todos os artigos que teñan un prezo de compra superior ao 
prezo de compra do artigo con código ' 0713242'. */
select art_nome from artigos 
where art_pc > (select art_pc from artigos where art_codigo='0713242');

select a.art_nome from artigos a
join artigos a2 
where a.art_pc>a2.art_pc and a2.art_codigo='0713242';

/* 3.2. Mostrar o número, nome e salario de todos os empregados que teñen 
un salario maior que o salario do empregado número 180. 
Engadir na lista de selección unha columna para mostrar o salario do 
empregado número 180. */
use traballadores;
select e.empnumero, e.empnome, e.empsalario, e2.empsalario
from empregado e join empregado e2
where e.empsalario>e2.empsalario and e2.empnumero=180;


/* 4.1. Seleccionar todos os artigos negros, xunto cos artigos que pesan 
máis de 5000 gramos, escribindo dúas consultas, e empregando o operador de 
unión de consul-tas. 
B) sin usar unión*/
use tendabd;
select * from artigos where art_color like 'Negro'
union
select * from artigos where art_peso>5000;

select * from artigos where art_color like 'Negro'
or art_peso>5000 order by art_color desc, art_peso;

/* 4.2. Para facer un envío de cartas con información dunha nova campaña por 
co-rreo postal, seleccionar apelidos, nome, enderezo, código postal e poboación
 de todos os clientes e de todos os empregados. Na lista hai que diferenciar se
 a persoa é cliente ou empregado. Ordenar o resultado por orden alfabético de 
 apelidos e nome. */
 
 select clt_apelidos as 'Apellidos', clt_nome as 'Nombre', clt_enderezo as 'Direccion',
 clt_cp as 'Código postal' , clt_poboacion as 'Poboación', 'Cliente' as 'Tipo' from clientes
 union
 select emp_apelidos, emp_nome, emp_enderezo, emp_cp, emp_poboacion, 'Empleado'  from empregados
 order by 1,2;
 
 
 
 
 
 
 

