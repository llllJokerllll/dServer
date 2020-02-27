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
select empNome, empSalario from empregado join empregado e where empSalario >= (empSalario empNome like 'FIERRO, CLAUDIA') order by 2;