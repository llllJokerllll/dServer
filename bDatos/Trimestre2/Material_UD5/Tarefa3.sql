use tendabd;
select art_codigo, art_nome, art_peso, prv_nome from artigos a join provedores p on (a.art_provedor=p.prv_id) where a.art_color like 'negro';
select clt_apelidos, clt_nome, pro_nome from clientes a join provincias b ON (substring(a.clt_cp,1,2) = b.pro_id) order by 3,1,2;
set lc_time_names = 'es_ES'; /*Con esto pasamos las fechas a formato español*/
select c.clt_nome as Nombre, c.clt_apelidos as Apellidos, dayofmonth(v.ven_data) as Dia, monthname(v.ven_data) as Mes, year(v.ven_data) as Año from clientes c join vendas v on (c.clt_id = v.ven_cliente);
select count(distinct(dev_venda)) as 'Ventas totales', count(distinct(dev_artigo)) as 'Articulos vendidos', sum(dev_cantidade) as 'Unidades totales vendidas', avg(dev_prezo_unitario) as 'Media de precio de venta' from detalle_vendas;
select a.art_codigo, a.art_nome, a.art_peso, p.peso_nome from artigos a join pesos p on (a.art_peso between p.peso_min and p.peso_max) order by 3 desc;
select a.clt_nome, a.clt_apelidos, date_format(b.ven_data,'%d/%m/%Y') as 'Data Venta', timestampdiff(day,b.ven_data,now()) as 'Días Transcurridos' from clientes a join vendas b on (b.ven_cliente = a.clt_id) order by 4;
select distinct a.pro_nome from provincias a join clientes b on a.pro_id = left(b.clt_cp,2);
select a.ven_id, a.ven_data, concat(b.clt_nome,',', b.clt_apelidos) as 'NomeCliente', concat(c.emp_nome ,',', c.emp_apelidos) as 'NomeEmpregado' from vendas a join clientes b on a.ven_cliente = b.clt_id join empregados c on a.ven_empregado = c.emp_id order by 3;
select concat(a.clt_apelidos,',', a.clt_nome) as 'NomeCliente', b.art_nome, c.dev_cantidade, c.dev_prezo_unitario, c.dev_desconto, (c.dev_prezo_unitario - (c.dev_prezo_unitario * c.dev_desconto / 100) * c.dev_cantidade) as 'PrezoFinal' from detalle_vendas c join artigos b on b.art_codigo = c.dev_artigo join clientes a join vendas d on (d.ven_cliente = a.clt_id and ven_id = dev_venda) order by 2;

use traballadores;
select a.depNumero, a.depNome, b.empNome from departamento a join empregado b on a.depDirector = b.empNumero where a.depDepende is null;
select a.empNome, b.cenEnderezo, c.depNome, from empregado a join centro b join departamento c on (a.empDepartamento = c.depNumero and b.depCentro = c.cenNumero) where a.empNome regexp '^*,\\s[A]%';