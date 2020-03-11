use tendabd;
select art_codigo, art_peso from artigos where art_peso < (select art_peso from artigos where art_codigo = '077WN45');
select art_codigo, art_nome, art_peso, art_color from artigos where art_color in (select art_color from artigos where art_codigo = '242C283') and art_peso >= (select avg(art_peso) from artigos);
select t.tda_id, e.emp_nome from tendas t join empregados e on e.emp_id = t.tda_xerente where t.tda_id = any (select distinct v.ven_tenda from vendas v join detalle_vendas d on v.ven_id = d.dev_venda where d.dev_artigo = '077WN45');
select * from artigos where art_pv > (select min(art_pv) from artigos where art_color like 'negro');
select * from artigos where art_pv > any(select art_pv from artigos where art_color like 'negro');
select art_codigo, art_nome,  art_provedor from artigos where art_provedor = (select prv_id from provedores where prv_nome like 'SEAGATE');
select a.art_codigo, a.art_nome, a.art_pv, p.prv_nome from artigos a join provedores p on a.art_provedor = p.prv_id where a.art_pv = (select max(art_pv) from artigos);

use traballadores;
select empNome, empSalario from empregado where empSalario > all(select empSalario from empregado where empDepartamento = 122) order by 1;
select empNome, empSalario from empregado where empSalario >= (select empSalario from empregado where empNome like 'FIERRO, CLAUDIA') order by 2;
select e1.empNome, e1.empSalario from empregado e1 join empregado e2 on e2.empNome like 'FIERRO, CLAUDIA' where e1.empSalario >= e2.empSalario order by 2;
select depNome, depPresuposto from departamento where depPresuposto = (select max(depPresuposto) from departamento) or depPresuposto = (select min(depPresuposto) from departamento);
select e.empNumero, e.empNome, e.empDataIngreso, d.depNome from empregado e join departamento d on e.empDepartamento = d.depNumero where empDataIngreso = (select min(empDataingreso) from empregado);
select empNome, empSalario from empregado where empDataIngreso > '1988-1-1' or (empDataIngreso < '1988-1-1' and empSalario < (select avg(empSalario) from empregado));
insert into empregado() values (610,110,760,'1953-03-12','1995-11-01','2000.00',null,1,'CABANILLAS, RAMON');
select count(*), empExtension from empregado group by empExtension having count(*) = (select count(*) from empregado group by empExtension order by 1 desc limit 1);

use tendabd;
select art_nome, art_pv from artigos where art_pv between (select art_pv from artigos where art_codigo = 0713242) and (select avg(art_pv) from artigos);
use traballadores;
select e.empNome, e.empDepartamento from empregado e join departamento d on e.empDepartamento = d.depNumero where d.depPresuposto between (select depPresuposto from departamento where depNumero = 122) and (select depPresuposto from departamento where depNumero = 121) order by 2;

use tendabd;
select * from provedores where prv_id in (select distinct art_provedor from artigos where art_color like 'negro') group by 1;
select clt_id, concat(clt_apelidos,", ",clt_nome) as "Apelidos e Nome" from clientes where clt_id in (select ven_cliente from vendas group by ven_cliente having count(*) = 1) order by 1;
select clt_id, clt_nome from clientes where clt_id in (select ven_cliente from vendas where ven_data > (select max(ven_data) from vendas where ven_cliente = 6));
select distinct e.emp_nome from empregados e join tendas t on e.emp_id=t.tda_xerente where tda_id in (select distinct ven_tenda from vendas);
select sum(dev_cantidade * dev_prezo_unitario) as 'PrezoTotal' from detalle_vendas where dev_venda in (select ven_id from vendas where ven_cliente in (select clt_id from clientes where clt_nome like 'LEANDRO' and clt_apelidos like 'FERREIRO BENITEZ'));
select emp_id, emp_apelidos, emp_nome from empregados where emp_id not in (select ven_empregado from vendas);

use traballadores;
select d.depNumero, count(e.empDepartamento) from departamento d join empregado e on d.depNumero=e.empDepartamento where d.depPresuposto > 36000 group by 1;
select d.depNome, e.empNome from departamento d join empregado e on d.depNumero = e.empDepartamento where d.depCentro in (select cenNumero from centro where cenNome like 'SEDE CENTRAL') order by 1, 2;
select count(empnumero) as 'Empleados', sum(empsalario) as 'Suma salarios', sum(ifnull(empcomision,0)) as 'Comisiones' , sum(empfillos) as 'Fillos' , empdepartamento from empregado where empdepartamento in (select distinct empdepartamento from empregado where empsalario>2000) group by empdepartamento;
select empnome from empregado where empnumero in (select depdirector from departamento) order by empdepartamento;
select e.empnome from empregado e join departamento d on e.empnumero=d.depdirector order by e.empdepartamento;
select empnome, empdepartamento from empregado where empnumero in ( select depdirector from departamento where depcentro in (select cennumero from centro where cennome like 'S%') );
select e.empnome, e.empdepartamento from empregado e join departamento d join centro c on e.empnumero=d.depdirector and d.depcentro=c.cennumero where c.cennome like 'S%';
Select empnome, empsalario, empsalario*0.05 as 'Incremento', empsalario*1.05 as 'Salario final' from empregado where empnumero in ( select depdirector from departamento where deptipodirector like 'F' ) order by empnome;
Select e.empnome, e.empsalario, e.empsalario*0.05 as 'Incremento', e.empsalario*1.05 as 'Salario final' from empregado e join departamento d on e.empnumero=d.depdirector where d.deptipodirector like 'F' order by e.empnome;
select empnome, empsalario from empregado where empsalario > ( select avg(empsalario) from empregado where empnumero in (select depdirector from departamento where deptipodirector='F') );
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
select empnome, empdepartamento
from empregado
where empdepartamento in (select distinct empdepartamento 
from empregado where empnome in ('pons, cesar','sanz, lavinia'));
select e1.empnome, e1.empdepartamento
from empregado e1 join empregado e2 on e1.empdepartamento=e2.empdepartamento
where e2.empnome in ('pons, cesar','sanz, lavinia');

use tendabd;
select * from artigos a1 where exists (select a2.art_pv from artigos a2 where a1.art_pv>a2.art_pv and a2.art_color like 'negro');
select a.art_nome from artigos a where a.art_color like 'Negro' and exists (select d.dev_artigo from detalle_vendas d where d.dev_artigo=a.art_codigo and d.dev_cantidade>5 );
select distinct a.art_nome, a.art_color, a.art_codigo from artigos a join detalle_vendas d on d.dev_artigo=a.art_codigo where a.art_color like 'Negro'  and d.dev_cantidade>5 ;
