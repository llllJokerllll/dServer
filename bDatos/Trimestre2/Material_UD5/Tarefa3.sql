use tendabd;
select art_codigo, art_nome, art_peso, prv_nome from artigos a join provedores p on (a.art_provedor=p.prv_id) where a.art_color like 'negro';
select clt_apelidos, clt_nome, pro_nome from clientes a join provincias b ON (substring(a.clt_cp,1,2) = b.pro_id) order by 3,1,2;
set lc_time_names = 'es_ES'; /*Con esto pasamos las fechas a formato español*/
select c.clt_nome as Nombre, c.clt_apelidos as Apellidos, dayofmonth(v.ven_data) as Dia, monthname(v.ven_data) as Mes, year(v.ven_data) as Año from clientes c join vendas v on (c.clt_id = v.ven_cliente);
select dev_venda, dev_cantidade, sum(dev_cantidade) as UnidadesVendidas, avg(sum(dev_cantidade)) from detalle_vendas;
select dev_venda, dev_cantidade
