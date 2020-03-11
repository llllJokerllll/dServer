use tendabd;

/* Sobre a base de datos tendaBD */
/*  2.1. Mostrar apelidos e nome nunha mesma columna separados por unha coma, 
e o número de letras que ten o nome. */
select concat(clt_nome, ',' , clt_apelidos) as 'Nombre' ,
length(clt_nome) from clientes;

/*  2.2. Mostrar nomes e apelidos dos clientes en minúscula.*/
select lower(clt_nome) , lower(clt_apelidos) from clientes;

/* 2.3. Mostrar a idade dunha persoa nacida o 22/03/1981 no momento actual. 
Suponse que a data do sistema é a correcta. */
select timestampdiff(year,'1981-03-22',curdate()) as 'Edad';

/* 2.4. Mostrar tódalas vendas do mes anterior ao mes actual en dous supostos:
– Na táboa gárdanse datos das vendas dun ano.
– Na táboa gárdanse datos das vendas de varios anos.
Pódense inserir vendas para poder comprobar o resultado. 
Se o data actual é 13/12/2015, pódense inserir ventas no mes de novembro utilizando 
o seguinte guión SQL: 
/* inserir vendas no mes anterior tendo en conta que a data actual é 13/12/2015 */ 
insert into vendas (ven_tenda, ven_empregado, ven_cliente, ven_data) 
values (7,2,1,'2019-12-01'), 
(2,14,30,'2019-12-30'), 
(2,14,60,'2020-01-3'), 
(2,14,60,'2020-01-3');
/* Mostrar las ventas de los meses 5 y 6 */
select * from vendas where month(ven_data) between 5 and 6 order by ven_data;
select * from vendas where month(ven_data) between month(now()-1) and month(now()) 
order by ven_data;
select * from vendas where ven_data 
between subdate(now(),interval 1 month) and now()
order by ven_data;

select * from vendas;

/* 2.5. Mostrar número, nome e prezo de venda (redondeado, sen decimais) dos 
artigos de cor negra. */
select art_codigo, art_nome, round(art_pv) from artigos where art_color like 'negro';

/* 2.6. Calcular a media dos pesos de todos os artigos. */
select avg(art_peso) as 'Media' from artigos;

/* 2.7. Calcular a media do peso, o marxe máximo 
( máxima diferenza entre o pre-zo de venda e o prezo de compra) e a diferenza que 
se dá entre o maior prezo de venda e o menor prezo de compra. 
Estes cálculos terán que facerse para aqueles artigos que teñan descrito a cor cun 
valor distinto do NULL. */
select avg(art_peso) as 'Media peso', max(art_pv)-min(art_pc) as 'Diferencia máxima' 
from artigos where art_color is not null;


/* 2.8. Contar o número de cores distintos que existen na táboa de artigos. */

select count(distinct art_color) from artigos;

/* 2.9. Mostrar nome e cor dos artigos. Se a cor é descoñecida, débese mostrar o 
texto ‘DESCOÑECIDO’. */
select art_nome, ifnull(art_color,'Descoñecido') from artigos;

/* 2.10. A xubilación na empresa está establecida aos 60 anos. 
O empregado xubilado ten dereito a unha liquidación que equivale ao 
salario dun mes por cada ano de servizo na empresa. 
Mostrar nome, data de nacemento, salario mensual base, 
antigüidade (número de anos dende que entrou a traballar na empresa ata 
a data de xubilación) e importe da liquidación que lle corresponde aos 
empregados que se xubilarán no ano actual. */
use traballadores;

Select empnome, empdatanacemento,empsalario , 
timestampdiff(year, empdataingreso,curdate())*empsalario as 'Liquidación' ,
timestampdiff(year, empdatanacemento,curdate()) as 'Edad'
from empregado
where timestampdiff(year, empdatanacemento,curdate())>=60;

/* 2.11. Mostrar nome, día e mes do aniversario dos empregados dos departamen-tos 110 e 111. */
select empnome , day(empdatanacemento),month(empdatanacemento) 
from empregado where empdepartamento=110 or empdepartamento=111;
select empnome , concat(day(empdatanacemento),'/',month(empdatanacemento)) 
from empregado where empdepartamento=110 or empdepartamento=111;
select empnome , date_format(empdatanacemento,'%d/%m') 
from empregado where empdepartamento=110 or empdepartamento=111;
select empnome , date_format(empdatanacemento,'%d/%m') 
from empregado where empdepartamento in (110,111);

/* 2.12. Mostrar o número de empregados que este ano cumpran 20 anos 
traballando na empresa e o salario medio de todos eles. */
select count(*), avg(empsalario) from empregado
where timestampdiff(year, empdataingreso,curdate())=20;


/* 2.13. Mostrar o importe anual (14 pagas) correspondente ao soldos dos 
empregados (soldo máis comisións). */
select empnome,(empsalario+ ifnull(empcomision,0))*14 as 'Salario anual' from empregado
order by 2 desc; /* Arreglo con nombre y ordenado por salario total descendiente */
/* Cuanto paga en total la empresa a todos sus empleados? */
select sum((empsalario+ ifnull(empcomision,0))*14) as 'Salario anual' from empregado;

/* 2.14. Mostrar o número de departamentos que existen e o 
presuposto anual medio de todos eles */
select count(*) , avg(deppresuposto)  from departamento;
select count(*) , sum(deppresuposto)/count(*)  from departamento;

/* 2.15. Mostrar o importe total das comisións dos empregados*/
select sum(empcomision) from empregado;

/* 2.16. Mostrar nome, data de nacemento e idade dos empregados que 
teñan actualmente 50 anos ou máis. Ordenar o resultado pola idade de maior a menor. */
select empnome, empdatanacemento, 
timestampdiff(year, empdatanacemento,curdate()) as 'Edad' from empregado 
where timestampdiff(year, empdatanacemento,curdate())>=50
order by 3 desc ;

/* 2.17. Mostrar nome de empregado, data de entrada na empresa con formato 
dd/mm/aaaa e número de trienios completos que levan traballados os empregados 
que cumpran 60 anos no ano actual. Ordenar de forma descendente por número de trienios. */
select empnome, date_format(empdataingreso,'%d/%m/%Y') as 'Data ingreso', 
floor(timestampdiff(year, empdataingreso,curdate())/3) as  'Trienios'
from empregado
where timestampdiff(year, empdatanacemento,curdate())=60
order by 3 desc;

select empnome, date_format(empdataingreso,'%d/%m/%Y') as 'Data ingreso', 
timestampdiff(year, empdataingreso,curdate()) DIV 3 as  'Trienios'
from empregado
where timestampdiff(year, empdatanacemento,curdate())=60
order by 3 desc;


/* 2.18.Mostrar a media de idade á que os empregados entran a traballar na empresa. */
use traballadores;
select avg(timestampdiff(year,empdatanacemento,empdataingreso))
from empregado;

/* 2.19.Mostrar nome, data de entrada na empresa con formato dd/mm/aaaa e o 
número de anos completos que leva traballando na empresa, para os empregados 
que cumpran anos no mes actual. */
select empnome, date_format(empdataingreso,'%d/%m/%Y') as 'Fecha entrada',
floor(timestampdiff(year,empdatanacemento,empdataingreso)) as 'Años trabajados'
from empregado
where month(empdatanacemento)=month(now());


/* 2.20.Mostrar a diferenza de días traballados entre o empregado máis antigo e o 
máis recente, indicando a data de ingreso de ambos traballadores. */
select max(timestampdiff(day,empdataingreso,curdate()))- 
min(timestampdiff(day,empdataingreso,curdate())) as 'Diferencia' ,
min(empdataingreso) , max(empdataingreso)
from empregado;

/* lo mismo pero mostrando también el nombre de dichos empleados */
select max(timestampdiff(day,empdataingreso,curdate()))- 
min(timestampdiff(day,empdataingreso,curdate())) as 'Diferencia' ,
min(empdataingreso) , max(empdataingreso),
(select empnome from empregado order by empdataingreso desc limit 1 ) as 'Empleado más reciente' ,
(select empnome from empregado order by empdataingreso limit 1) as 'Empleado más antiguo' 
from empregado;

/* 2.21. Mostrar ordenados por número de empregado, o número de empregado, 
nome e salario mensual total (salario+comisión) dos empregados cun salario mensual 
total de máis de 1800 euros. */
select empnumero, empnome, empsalario+empcomision as 'Sueldo mensual total'
from empregado
where (empsalario+empcomision) > 1800
order by 1 ;
