use tendabd;
select art_color, avg(art_pv) from artigos where art_color is not null group by 1 having avg(art_pv) > 100;
select v.ven_tenda, count(v.ven_id), count(distinct d.dev_artigo), sum(d.dev_cantidade) from vendas v join detalle_vendas d on v.ven_id = d.dev_venda where month(v.ven_data)=5 and year(v.ven_data)=2015 group by 1 having count(v.ven_tenda) > 2;
select v.ven_cliente, v.ven_data, sum(d.dev_cantidade), sum((d.dev_prezo_unitario*d.dev_cantidade)*(1-d.dev_desconto/100)) as 'PrecioPagado', sum((d.dev_prezo_unitario*d.dev_cantidade)*d.dev_desconto/100) as 'Descuento' from detalle_vendas d join vendas v on v.ven_id=d.dev_venda group by 1, 2 having sum((d.dev_prezo_unitario*d.dev_cantidade)*(1-d.dev_desconto/100)) > 1200 order by 1;
select v.ven_cliente as 'Cliente', concat(c.clt_nome,',',c.clt_apelidos) as 'Nome/Apelidos', v.ven_data from clientes c join vendas v on c.clt_id=v.ven_cliente group by 1 having count(v.ven_cliente)=1; 

use traballadores;
select d.depNumero, d.depNome from departamento d join empregado e on d.depNumero=e.empDepartamento group by 1 having count(e.empDepartamento)=5;
select empExtension, count(empNumero) from empregado group by 1 having count(empNumero)>1;