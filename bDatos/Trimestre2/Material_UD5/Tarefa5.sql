use tendabd;
select art_color, truncate(avg(art_pv),2) as 'PrecioMedio' from artigos group by art_color;
select art_color, truncate(avg(art_pv),2) as 'PrecioMedio' from artigos where art_pc <= 50 group by art_color;
select clt_poboacion, count(*) from clientes group by clt_poboacion order by 2 desc;
select a.art_codigo, a.art_nome, sum(b.dev_prezo_unitario*b.dev_cantidade), sum(b.dev_prezo_unitario*b.dev_cantidade-(b.dev_prezo_unitario*b.dev_cantidade*b.dev_desconto/100)), b.dev_desconto from artigos a join detalle_vendas b join vendas c on (a.art_codigo = b.dev_artigo and c.ven_id = b.dev_venda) where c.ven_data between '2015-1-1' and '2015-5-25' group by a.art_codigo;