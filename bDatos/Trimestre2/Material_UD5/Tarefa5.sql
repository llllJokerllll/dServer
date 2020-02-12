use tendabd;
select art_color, truncate(avg(art_pv),2) as 'PrecioMedio' from artigos group by art_color;
select art_color, truncate(avg(art_pv),2) as 'PrecioMedio' from artigos where art_pc <= 50 group by art_color;
select clt_poboacion, count(*) from clientes group by clt_poboacion order by 2 desc;
select a.art_codigo, a.art_nome, sum(b.dev_prezo_unitario*b.dev_cantidade), sum(b.dev_prezo_unitario*b.dev_cantidade-(b.dev_prezo_unitario*b.dev_cantidade*b.dev_desconto/100)), b.dev_desconto from artigos a join detalle_vendas b join vendas c on (a.art_codigo = b.dev_artigo and c.ven_id = b.dev_venda) where c.ven_data between '2015-1-1' and '2015-5-25' group by a.art_codigo;
select v.ven_tenda as 'Tienda', count(v.ven_id) as 'NumeroDeVentas', count(distinct d.dev_artigo) as 'NumeroArticulos', sum(d.dev_cantidade) as 'UnidadesVendidas', round(avg(d.dev_prezo_unitario),2) as 'PrecioMedio', sum(d.dev_cantidade*d.dev_prezo_unitario) as 'FacturacionAnual' from vendas v join detalle_vendas d on d.dev_venda = v.ven_id where v.ven_data between '2015-1-1' and '2015-12-31'group by v.ven_tenda; /* year(v.ven_data = 2015) */

use traballadores;
select empExtension, count(empNumero) from empregado group by 1;
select empFillos, count(empNumero) from empregado group by 1;
select d.depNome, e.empFillos, count(e.empNumero) from departamento d join empregado e on d.depNumero = e.empDepartamento group by 2;
select c.cenNome, count(d.depCentro) from centro c join departamento d on (c.cenNumero = d.depCentro) group by 1 order by 2 desc;
select d.depNome, max(e.empSalario), min(e.empSalario), max(e.empSalario)-min(e.empSalario) from departamento d join empregado e on d.depNumero = e.empDepartamento group by 1;
select d.depNome, d.depPresuposto-(sum(e.empSalario)+coalesce(sum(e.empComision),0)) from departamento d join empregado e on d.depNumero = e.empDepartamento group by 1;
