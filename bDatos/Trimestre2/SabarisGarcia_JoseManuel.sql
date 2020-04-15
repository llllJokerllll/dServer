/* Jose Manuel Sabarís García */
use traballadores;

/* 1. Mostrar todos los datos de los empleados de los departamentos 100 y 110 */
select * from empregado where empDepartamento = 100 || empDepartamento = 110;

/* 2. Mostrar todos los datos de los empleados cuyo apellido comience por A y tienen solamente 1 hijo. */
select * from empregado where empNome like 'A%' and empFillos = 1;

/* 3. Mostrar la media de los sueldos de los empleados cuyo sueldo está comprendido entre 1000 y 3000. */
select avg(empSalario) as 'SalarioMedio' from empregado where empSalario between 1000 and 3000;

/* 4. Mostrar el salario mínimo, salario medio y salario máximo (en ese orden) de los empleados del departamento de Finanzas. */
select min(empSalario) as 'SalarioMinimo', avg(empSalario) as 'SalarioMedio', max(empSalario) as 'SalarioMaximo' from empregado where empDepartamento = (select depNumero from departamento where depNome like 'Finanzas');

/* 5. Para los departamentos en los que hay algún empleado cuyo salario sea mayor que 2000 euros al mes, hallar el número de empleados y la suma de sus salarios, comisiones y número de hijos. */
select count(*) as 'NumeroEmpregados', sum(empSalario) as 'SumaSalarios', sum(ifnull(empComision, 0)) as 'SumaComisiones', sum(empFillos) as 'NumeroHijos' from empregado group by empDepartamento having empDepartamento in (select distinct empDepartamento from empregado where empSalario > 2000);

/* 6. Mostrar los nombres y salarios de los empleados y el nombre de los departamentos que pertenecen al centro “Sede central”. */
select e.empNome as 'NomeEmpregado', e.empSalario as 'SalarioEmpregado', d.depNome as 'NomeDepartamento' from empregado e join departamento d on e.empDepartamento = d.depNumero join centro c on d.depCentro = c.cenNumero where c.cenNome like 'Sede central';

/* 7. Para los departamentos cuyo salario medio supera al de la empresa, hallar cuántas extensiones telefónicas tienen. */
select count(distinct empExtension) as 'NumeroExtensiones' from empregado group by empDepartamento having avg(empSalario) > (select avg(empSalario) from empregado);