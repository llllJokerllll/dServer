use tendabd;
/* esto es un comentario */
/* mostrar los nombres y apellidos de todos los clientes */
SELECT clt_nome , clt_apelidos 
from clientes;

/* 1.1. Mostrar os datos de todas as tendas.*/
select * from tendas;

/* 1.2. Mostrar os nomes de todos os provedores.  */
select prv_nome from provedores;

/* 1.3  Obter a lista das poboacións nas que existen clientes.  */
select distinct clt_poboacion from clientes;

/* 1.4. Mostrar o prezo de venda de todos os artigos e o prezo que resultaría 
despois de aplicarlles un incremento do 10% */
select art_pv as 'Precio de venta' , art_pv*1.1 as 'Precio +10%' from artigos;

/*  1.5. Mostrar o número de cliente, apelidos e nome de todos os clientes de Madrid. */
select clt_id, clt_apelidos, clt_nome 
from clientes
where clt_poboacion like 'Madrid';

/* 1.6. Seleccionar o código, descrición e peso dos artigos que pesen máis de 500 gramos.  */
select art_codigo, art_nome, art_peso 
from artigos
where art_peso > 500;

/*  1.7. Seleccionar todos os artigos que teñan prezo de venda superior 
ou igual ao dobre do prezo de compra */
select * from artigos
where art_pv >= (art_pc*2);

/*  1.8. Seleccionar apelidos, nome, poboación e desconto, de todos clientes de 
Asturias ou Valencia que teñan un desconto superior ao 2% ou que non teñan desconto.   */
select clt_apelidos, clt_nome, clt_poboacion, clt_desconto
from clientes
where ( clt_poboacion like 'Valencia' or clt_poboacion like 'Asturias') 
and (clt_desconto>2 or clt_desconto=0);

use tendaBD;
/*  1.9. Seleccionar todos os artigos de cor negra que pesen máis de 5000 gramos. */
select * from artigos where art_color like 'negro' and art_peso>5000;

/* 1.10. Obter todos os artigos que non son de cor negra ou que teñan un peso menor ou 
igual de 5000 gramos, é dicir, obter o resultado complementario da consulta anterior. */
select * from artigos where art_peso<=5000 and art_color not like '%negro%';

/* 1.11. Seleccionar os artigos que son de cor negra e pesan máis de 100 gramos, ou ben son de cor cyan.*/
select * from artigos where (art_color like 'negro' and art_peso>100) or art_color like 'cyan';

/* 1.12. Facer unha lista dos artigos que teñan un prezo de compra entre 12 e 18 euros, ambos prezos incluídos. */
select * from artigos where art_pc>=12 and art_pc<=18;
select * from artigos where art_pc between 12 and 18;

/* 1.13. Mostrar unha lista de artigos de cor negra ou de cor cyan. */
select * from artigos where art_color like 'negro'  or art_color like 'cyan';

/* 1.14. Buscar un cliente do que se descoñece o apelido exacto, pero se sabe que as dúas primeiras letras son 'RO'.*/
select * from clientes where clt_apelidos like 'ro%';

/* 1.15. Buscar clientes que teñan o nome de 5 letras, empezando por 'B' e terminando por 'A'.*/
select * from clientes where clt_nome like 'B___A';

select * from artigos;
/* 1.16. Buscar todos os artigos para os que non se gravou o seu color.*/
select * from artigos where art_color is null;

/* 1.17. Clasificar os artigos tendo en conta o seu peso, por orden decrecente. */
select * from artigos order by art_peso desc;

/* 1.18. Mostrar código de artigo, nome, prezo de compra, prezo de venda e marxe de 
beneficio (prezo de venda – prezo de compra) dos artigos que teñen un prezo de compra 
superior a 3000 euros, ordenados pola marxe.*/
select art_codigo, art_nome, art_pc, art_pv, (art_pv-art_pc) as 'Beneficio'
from artigos
where art_pc>3000
order by 5;

select art_codigo, art_nome, art_pc, art_pv, (art_pv-art_pc) as 'Beneficio'
from artigos
where art_pc>3000
order by Beneficio;

/* 1.19. Clasificar nome, provedor, stock e peso dos artigos que teñen un peso menor
 ou igual de 1000 gramos, por orden crecente do provedor. Cando os provedores coincidan, 
 deben clasificarse polo stock en orden decrecente.*/
select art_nome, art_provedor, art_stock, art_peso from artigos
where art_peso<=1000
order by 2 asc, 3 desc;

/*  1.20. Seleccionar nome e apelidos dos clientes que teñan un apelido que empece por 'F' 
e remate por 'Z'.*/
select clt_nome, clt_apelidos from clientes where clt_apelidos like 'F%Z %' or clt_apelidos like '% F%Z';

/* 1.21. Seleccionar todos os artigos que leven a palabra LED, en maiúsculas, na súa descrición. */
select * from artigos where art_nome like binary '%LED%'; /* correcta */
select * from artigos where art_nome like binary '%led%'; /* filtrar en minúsculas */
select * from artigos where art_nome like '%led%'; /* sin filtro de mayusculas*/

/* 1.22. Seleccionar todos os artigos que teñan unha descrición que empece por 'CABI', sen 
diferenciar maiúsculas de minúsculas.*/

use tendaBD;
select * from artigos where art_nome like 'cabi%';

/* 1.23. Comprobar que un número é un valor enteiro, que pode empezar polos símbolos + ou -.
sign(numero);
*/


/* 1.24. Seleccionar os clientes que teñan un apelido que empece pola letra 'a' ou pola letra 'f'. */
select * from clientes where clt_apelidos like 'a%' or clt_apelidos like 'f%' 
or clt_apelidos like '% a%' or clt_apelidos like '% f%';
select * from clientes where clt_apelidos regexp '^[af]|^* [af]';


/* 1.25. Seleccionar os clientes que teñan un apelido que non empece por 'a','b','c', ou 'd'.*/
select * from clientes where clt_apelidos not regexp '^[a-d]|^* [a-d]';
select * from clientes where clt_apelidos not regexp '^[a-d]| [a-d]';

/* 1.26. Seleccionar os artigos que teñan un prezo de venta que remata en .00. */ 
select * from artigos where art_pv like '%.00';
select * from artigos where art_pv regexp '.00$';

/* 1.27. Seleccionar os clientes que teñen un nome que teña exactamente 5 carácteres.*/
select * from clientes where clt_nome like '_____';
select * from clientes where clt_nome regexp '^.{5}$';
select * from clientes where  length(clt_nome)= 5;
select * from clientes where  char_length(clt_nome)= 5;

use traballadores;

/* 1.28. Unha nova normativa non permite que as comisións superen o 10% do salario. 
Mostrar información ordenada por número de departamento, dos departamentos nos que exista 
algún empregado que incumpra esta normativa, nos seguintes casos:
– Mostrar número de departamento.
– Mostrar ademais nome de departamento utilizando join e sen utilizar join.
– Mostrar ademais nome do xefe de departamento.
*/


/* 1.29. A campaña de axuda familiar posta en marcha pola empresa, establece que 
os empregados que teñan máis de 3 fillos, cobrarán unha paga extra de 30 euros 
por fillo a partir do terceiro e incluíndo este. Mostrar nome, salario, comisión, 
número de fillos, importe da paga extra e salario mensual final dos empregados, 
ordenados alfabeticamente polo nome, aplicando a axuda familiar. */

select empnome, empcomision, empfillos, (empfillos-2)*30 as "Paga extra",
"Paga extra" + empsalario + ifnull(empcomision,0) as 'Salario total'
from empregado
where empfillos>2
order by empnome;

select empnome, empcomision, empfillos, 
if(empfillos>2,empfillos-2,0)*30 as "Paga extra", 
ifnull(empcomision,0)+empsalario+"Paga extra" as 'Salario final' 
from empregado
order by empnome;


/* 1.30. Mostrar os nomes dos empregados con apelido 'MORA' ou que empece 
por 'MORA' ordenados alfabeticamente. */
select * from empregado where empNome like binary 'MORA%' order by empNome;


/* 1.31. A empresa vai organizar un espectáculo para os fillos dos empregados 
que durará dous días. O primeiro día invitarase aos empregados con apelido que 
empece polas letras dende a 'A' ata a 'L', ambas inclusive. O segundo día invitarase 
ao resto dos empregados. Cada empregado recibirá unha invitación por fillo e dúas máis. 
Cada fillo recibirá un regalo durante o espectáculo. Mostrar unha lista ordenada 
alfabeticamente polo nome do empregado na que aparezan os nomes dos empregados que 
se invitarán no primeiro día, o número de invitación que lle corresponden e o 
número de regalos que hai que preparar para el.*/
select empnome, empfillos+2 as 'Invitaciones', empfillos as 'Regalos'
from empregado
where empnome between 'A' and 'M' and empfillos>0
order by empnome;

select empnome, empfillos+2 as 'Invitaciones', empfillos as 'Regalos'
from empregado
where empnome regexp '^[A-L]' and empfillos>0
order by empnome;


/* 1.32. Mostrar os nomes e salarios dos empregados que cumpran algunha das seguintes condicións:
– Non teñen fillos e gañan máis de 1200 euros.
– Teñen fillos e gañan menos de 1800 euros. */
select empNome, empSalario from empregado where (empfillos=0 and empSalario>1200)
or (empfillos>0 and empSalario<1800);


use traballadores;
/* 1.33. Mostrar nome e salario base dos empregados que non teñen fillos ordenados de maior a 
menor polo salario base. */
select empnome, empsalario from empregado where empfillos=0 order by empsalario desc;


/* 1.34. Mostrar por orden alfabético, os nomes e salarios base dos empregados que traballen 
no departamento 111 e teñan unha comisión que supere o 15% do seu salario base. */
select empnome, empsalario from empregado 
where empdepartamento=111 and empcomision>(0.15*empsalario) 
order by 1;


/* 1.35. A empresa decide aumentar a comisión nun 15% aos empregados que teñan máis de 2 fillos. 
Mostrar ordenados alfabeticamente polo nome de empregado: nome do empregado, número de fillos, 
importe da comisión antes do aumento e importe da comisión despois do aumento. */

select empnome, empfillos, empcomision, empcomision*1.15 as 'Comision up 15%'
from empregado
where empfillos>2
order by empnome;

select empnome, empfillos, empcomision, ifnull(empcomision,0)*1.15 as 'Comision up 15%'
from empregado
where empfillos>2
order by empnome;

select * from empregado;




