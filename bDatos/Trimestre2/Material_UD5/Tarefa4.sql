use tendabd;
select * from artigos a join artigos a2 where a.art_pc > a2.art_pc and a2.art_codigo = 0713242;

use traballadores;
select e.empNumero, e.empNome, e.empSalario, e2.empSalario as "SueldoEmpleado180" from empregado e join empregado e2 where e.empSalario > e2.empSalario and e2.empNumero = 180;

use tendabd;
select * from artigos where art_color like 'NEGRO' union select * from artigos where art_peso > 5000;
select 