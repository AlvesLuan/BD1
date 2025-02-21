create database JUNCAO;

Use JUNCAO;

create table cargo(
	CodCargo char(2) NOT NULL primary key,
    nomeCargo varchar(50) not null,
    valorCargo decimal(10,2) not null
);

create table funcionario(
	matricula integer not null primary key,
    nomeFuncionario varchar(80) not null,
    codCargo char(2) default null,
    foreign key (codCargo) references Cargo(CodCargo)
);

insert cargo values ('C1', 'Caixa', 800.00);
insert cargo values ('C2', 'Vendedor', 1200.00);
insert cargo values ('C3', 'Gerente', 2400.00);

insert funcionario values (100, 'Joao', 'C1');
insert funcionario values (110, 'Maria', 'C2');
insert funcionario values (120, 'Carlos', 'C1');
insert funcionario (Matricula, nomeFuncionario)values(130, 'Tadeu');

select * from Cargo;

select * from funcionario;

select * from cargo C cross join funcionario F;
select * from cargo C, funcionario F;
select nomeFuncionario, nomeCargo from cargo C cross join funcionario F;

select F.Nomefuncionario, C.NomeCargo
from Cargo C inner join funcionario F on C.CodCargo = F.CodCargo;

select F.Nomefuncionario, C.NomeCargo
from Cargo C, Funcionario F 
where C.CodCargo = F.CodCargo;
