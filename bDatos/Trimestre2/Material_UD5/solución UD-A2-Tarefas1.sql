use tendabd;

select a.art_nome, a.art_codigo, a.art_peso, p.prv_nome
from artigos a, provedores p
where a.art_provedor=p.prv_id and a.art_color like 'Negro';

select e.empnome, d.depnome from empregado e, departamento d
where e.empdepartamento=d.depNumero;

select e.empnome, d.depnome from empregado as e left join departamento as d
on  e.empdepartamento=d.depNumero;