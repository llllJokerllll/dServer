
use tendabd;
/*  1.1. Seleccionar da táboa artigos as cores e o prezo medio de venda dos artigos
 de cada cor (con dous decimais). */
 select art_color, truncate(avg(art_pv),2) from artigos
 group by art_color order by 2;
 
/* 1.2. Seleccionar da táboa artigos as cores e o prezo medio de venda dos artigos 
de cada cor (con dous decimais), excluíndo aos artigos que teñan un prezo de compra 
superior a 50 euros. */
 select art_color, truncate(avg(art_pv),2) as 'Precio medio' from artigos
 where art_pc<=50
 group by art_color order by 2;


/* 1.3. Mostrar as cidades nas que existen clientes e o número de clientes que hai en cada 
unha de elas. Clasificar a saída en orden decrecente polo número de clientes. */
select clt_poboacion, count(*) from clientes group by clt_poboacion
order by 2 desc;

/* 1.4. Mostrar código, nome, suma dos importes das vendas sen aplicar o desconto, 
suma dos importes das vendas despois de aplicar o desconto, e desconto efectuado, 
para os artigos vendidos entre 1-1-2015 e 25-5-2015. */

select a.art_codigo, a.art_nome, sum(d.dev_prezo_unitario*d.dev_cantidade) as "Importe",
sum(d.dev_prezo_unitario*d.dev_cantidade-
(d.dev_prezo_unitario*d.dev_cantidade*d.dev_desconto/100)) as 'Importe descontado', 
d.dev_desconto
from artigos a join vendas v join detalle_vendas d
on (a.art_codigo=d.dev_artigo and v.ven_id=d.dev_venda)
where v.ven_data between '2015-1-1' and '2015-5-25'
group by a.art_codigo
order by 1;

/* 1.5. Mostrar as estatísticas de vendas do ano 2015 por tenda. A información a 
mostrar é: identificador da tenda, número de vendas, número de artigos vendidos, 
suma de unidades vendidas e a media dos prezos unitarios dos artigos vendidos. */
use tendabd;
select v.ven_tenda as 'Tienda', count(v.ven_id) as 'Numero de ventas',
count(distinct d.dev_artigo) as 'Numero de artículos',
sum(d.dev_cantidade) as "Unidades totales vendidas",
round(avg(d.dev_prezo_unitario),2) as 'Precio medio',
sum(d.dev_cantidade*d.dev_prezo_unitario) as 'Recaudación total'
from vendas v join detalle_vendas d 
on v.ven_id=d.dev_venda
where year(v.ven_data) = 2015 
/* v.ven_data between '2015-01-01' and '2015-12-31'  */
group by v.ven_tenda;


use traballadores;

/* 1.6. Mostrar o número de empregados que utiliza cada extensión telefónica. */
select empextension, count(*) from empregado group by empextension order by 1;

/* 1.7. Mostrar o número de empregados que teñen 0, 1, 2, 3, ... fillos. */
select empfillos, count(*) from empregado group by empfillos order by 1;

/* 1.8. Mostrar, para cada departamento, o número de empregados que teñen 0, 1, 2, ... fillos. */
select empdepartamento, empfillos, count(*) from empregado 
group by empdepartamento, empfillos order by 1,2;

/* 1.9.A Mostrar o número de departamentos que dependen de cada centro. */
select depCentro, count(*) from departamento group by depcentro;

/* 1.9.B Mostrar o número de departamentos que dependen de cada centro y el nombre del centro. */
select c.cenNome, count(d.depnumero) 
from departamento d join centro c 
on c.cennumero=d.depcentro group by depcentro;

/* 1.10. Seleccionar, para cada departamento, o maior salario, o menor salario e a 
diferenza que hai entre o salario máis alto e o salario máis baixo. */
select empdepartamento, max(empsalario), min(empsalario), 
max(empsalario)-min(empsalario) as 'Diferencia'
from empregado group by empdepartamento;

/* 1.11. Mostrar, para cada departamento, a cantidade que queda do presuposto 
despois de restar o importe dos salarios e comisións a pagar aos empregados. */
select d.depnome, d.deppresuposto-(sum(e.empsalario)+sum(ifnull(e.empcomision,0))) as 'Diferencia'
from empregado e join departamento d on d.depnumero=e.empdepartamento
group by d.depnome;

/*Tarefa 2.1. Seleccionar da táboa artigos as cores e o prezo medio de venda dos artigos de cada cor, 
para as cores que teñan o prezo medio maior que 100 euros.*/
use tendabd;
select art_color, avg(art_pv)
from artigos
where art_color is not null /* quitar nulos */
group by art_color
having avg(art_pv)>100;

/* 2.2. Mostrar as tendas que fixeron máis de 2 vendas no mes de maio de 2015. 
Para cada tenda débese mostrar: numero de tenda, número de vendas, 
número de artigos diferentes vendidos e a suma de unidades vendidas nese período de tempo. */
select v.ven_tenda as 'Tienda',
count(v.ven_id) as 'Numero de ventas',
count(distinct(d.dev_artigo)) as 'Articulos vendidos',
sum(d.dev_cantidade) as 'Unidades vendidas'
from vendas v join detalle_vendas d on v.ven_id=d.dev_venda
where  month(v.ven_data)=5 and year(v.ven_data)=2015 
/* v.ven_data like '2015-05-%' */
group by v.ven_tenda
having count(v.ven_id)>2;

/* 2.3 Mostrar o identificador do cliente, data de venda, a cantidade de artigos vendidos, 
a suma dos importes das vendas na data e o desconto practicado nesas vendas, para os clientes 
aos que se vendeu máis de 1200 euros nun só día. */ 
select v.ven_cliente, v.ven_data, sum(d.dev_cantidade),
sum((d.dev_prezo_unitario*d.dev_cantidade)*(1-d.dev_desconto/100)) as 'Importe' ,
sum((d.dev_prezo_unitario*d.dev_cantidade)*(d.dev_desconto/100)) as 'Descuento'
from vendas v join detalle_vendas d on v.ven_id=d.dev_venda
group by v.ven_cliente, v.ven_data
having sum((d.dev_prezo_unitario*d.dev_cantidade)*(1-d.dev_desconto/100)) > 1200
order by 1;


/*2.4. Mostrar identificador de cliente, apelidos e nome na mesma columna separados por coma, 
e data e hora da venda, para os clientes que só teñen unha venda. */
use tendabd;

select v.ven_cliente as Cliente,
concat(c.clt_apelidos,',',c.clt_nome) as 'Apelidos e nome',
v.ven_data as Data
from clientes as c join vendas as v on c.clt_id=v.ven_cliente
group by v.ven_cliente
having count(v.ven_cliente)=1;
/* where c.clt_vendas=1; */

/* 2.5. Mostrar número e nome dos departamentos que teñan 5 empregados. Tabla empregados */
use traballadores;
select d.depnumero, d.depnome, count(d.depnumero) 
from departamento d join empregado e on d.depnumero=e.empdepartamento 
group by d.depnumero
having count(*)=5;

/* 2.6. Para as extensións telefónicas que son utilizadas por máis dun empregado, 
mostrar o número de empregados que a comparten. Tabla empregados */
select count(empnumero), empextension
from empregado
group by empextension
having count(empnumero)>1;
