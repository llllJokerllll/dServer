use tendabd;
select art_codigo, art_peso from artigos where art_peso < (select art_peso from artigos where art_codigo = '077WN45');
select art_codigo, art_nome, art_peso, art_color from artigos where art_color in (select art_color from artigos where art_codigo = '242C283') and art_peso >= (select avg(art_peso) from artigos);
select t.tda_id, e.emp_nome from tendas t join empregados e on e.emp_id = t.tda_xerente where (select distinct v.ven_tenda from vendas v join detalle_vendas d on v.ven_id = d.dev_venda where d.dev_artigo = '077WN45') group by 1;