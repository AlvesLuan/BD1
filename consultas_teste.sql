select PNome from funcionario
where salario > 25000;

select PNome from funcionario
where sexo = 'M' or DNR = 4;

select PNome from funcionario
where sexo = 'M' and DNR=4;

select ProjNome from Projeto
where DNum = 4 and ProjLocal
