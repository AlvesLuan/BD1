-- drop database estacionamento;

create database estacionamento;
use estacionamento;

create table TB_cliente(
cpf varchar (11) ,
nome varchar (60),
dtNasc date,
primary key (cpf)
);

create table TB_Modelo (
codMod int primary key,
descricao varchar (45)
);


create table TB_veiculo(
placa varchar (8) primary key,
TB_Modelo_codMod int,
TB_cliente_cpf varchar(11),
cor varchar (45),
Ano varchar (4),
foreign key (TB_cliente_cpf) references TB_cliente (CPF)ON DELETE CASCADE
ON UPDATE CASCADE,
foreign key (TB_Modelo_codMod) references TB_Modelo (codMod) ON DELETE CASCADE
ON UPDATE CASCADE
);



create table TB_patio (
 num int primary key,
 capacidade int
);

create table TB_estaciona (
cod integer auto_increment,
TB_patio_num int,
TB_veiculo_placa varchar (8),
dtEntrada varchar (10),
dtsaida varchar (10),
hsentrada varchar (10),
hssaida varchar (10),
-- primary key (TB_patio_num, TB_veiculo_placa),
primary key (cod),
foreign key (TB_patio_num) references TB_patio (num) ON DELETE cascade
ON UPDATE CASCADE,
foreign key (TB_veiculo_placa) references TB_veiculo (placa) ON DELETE CASCADE
ON UPDATE CASCADE
);

insert into TB_Cliente values('11111111111', 'mirosmar', '1954-12-07');
insert into TB_Cliente values('11111111112', 'José', '1977-11-07');
insert into TB_Cliente values('11111111113', 'Camila', '1984-10-07');
insert into TB_Cliente values('11111111114', 'Alex', '1953-09-07');
insert into TB_Cliente values('11111111115', 'Maria', '1964-12-07');
insert into TB_Cliente values('11111111116', 'Dardania', '1988-08-07');
insert into TB_Cliente values('11111111117', 'Joaquim', '1967-07-07');
insert into TB_Cliente values('11111111118', 'Joana', '1989-07-07');
insert into TB_Cliente values('11111111119', 'Aline', '1995-05-07');
insert into TB_Cliente values('11111111199', 'Eliandro', '1995-12-07');
select * from TB_Cliente;

insert into TB_Modelo value(1, 'Familar');
insert into TB_Modelo value(2, 'Esportivo');
insert into TB_Modelo value(3, 'Trucks');
insert into TB_Modelo value(4, 'Sedan');
select * from TB_Modelo;


insert into TB_Veiculo values ('JJJ-2020',1 , '11111111111', 'Prata', 2000);
insert into TB_Veiculo values ('JJJ-2022',2 , '11111111112', 'Cinza', 2007);
insert into TB_Veiculo values ('JJJ-4420',3 , '11111111113', 'Preto', 2010);
insert into TB_Veiculo values ('JEJ-2020',4 , '11111111114', 'Vermelho', 2011);
insert into TB_Veiculo values ('JLJ-2020',1 , '11111111115', 'Cinza', 2009);
insert into TB_Veiculo values ('JJE-2020',2 , '11111111111', 'Prata', 2015);
insert into TB_Veiculo values ('JEG-1010',1 , '11111111116', 'Azul',2013);
insert into TB_Veiculo values ('JJH-2050',1 , '11111111117', 'Preto', 2013);
insert into TB_Veiculo values ('EJJ-3020',3 , '11111111118', 'Amarelo', 2013);
insert into TB_Veiculo values ('JKJ-6020',1 , '11111111119', 'Prata', 2012);
insert into TB_Veiculo values ('MJJ-2027',4 , '11111111199', 'Azul', 2007);
select * from TB_Veiculo;

insert into TB_Patio value (1, 100);
insert into TB_Patio value (2, 100);
insert into TB_Patio value (3, 200);
insert into TB_Patio value (4, 250);
select * from TB_Patio;


insert into Tb_Estaciona (cod, TB_patio_num , TB_veiculo_placa ) values (1, 1,'JJJ-2020');
insert into Tb_Estaciona (cod, TB_patio_num , TB_veiculo_placa ) values (2, 3,'MJJ-2027');
insert into Tb_Estaciona (cod, TB_patio_num , TB_veiculo_placa ) values (3, 4,'JKJ-6020');
insert into Tb_Estaciona (cod, TB_patio_num , TB_veiculo_placa ) values (4, 4,'EJJ-3020');
insert into Tb_Estaciona (cod, TB_patio_num , TB_veiculo_placa ) values (5, 3,'JJH-2050');
insert into Tb_Estaciona (cod, TB_patio_num , TB_veiculo_placa ) values (6, 2,'JEG-1010');
insert into Tb_Estaciona (cod, TB_patio_num , TB_veiculo_placa ) values (7, 1,'JJE-2020');
insert into Tb_Estaciona (cod, TB_patio_num , TB_veiculo_placa ) values (8, 4,'JLJ-2020');
insert into Tb_Estaciona (cod, TB_patio_num , TB_veiculo_placa ) values (9, 3,'JEJ-2020');
insert into Tb_Estaciona (cod, TB_patio_num , TB_veiculo_placa ) values (10, 2,'JJJ-4420');
select * from Tb_Estaciona;


-- e. Exiba a placa e o nome dos donos de todos os veiculos.alter
select distinct c.Nome, v.placa
from TB_CLiente as c, tb_veiculo as V
where c.cpf = v.tb_cliente_cpf;

-- f. Exiba o CPF e o nome do cliente que possui o veiculo de placa “JJJ-2020”.
select distinct c.Nome, c.CPF
from TB_CLiente as c, tb_veiculo as v
where placa = 'JJJ-2020';

-- g. exiba a placa e a cor do veiculo que possui p cpdogp de estacionamento 1
select v.placa, v.cor
from tb_veiculo as v, tb_estaciona as e
where v.placa = e.tb_veiculo_placa and e.cod = 1;

-- h. Exiba a placa, o ano do veículo e a descrição de seu modelo, se ele possuir ano a partir de 2000.  ;
select v.placa, v.ano, m.descricao
from tb_veiculo as V, tb_modelo as M
where v.ano >= 2000 and v.tb_modelo_codmod = m.codmod;

-- i. Liste todos os nomes dos clientes que possuem carro de modelo 1.
select c.nome
from tb_cliente as C, tb_veiculo as V
where v.tb_modelo_codmod = 1 and
v.tb_cliente_cpf = c.cpf;

-- j. Liste os nomes dos clientes que possuem veículos de cor Preto.
select c.nome
from tb_cliente as C, tb_veiculo as V
where v.cor = 'preto' and v.tb_cliente_cpf = c.cpf;

-- k. Liste todos os estacionamentos do veículo de placa “JJJ-2020”.
select e.cod
from tb_estaciona as e
where e.tb_veiculo_placa = 'JJJ-2020';

-- l. Exiba o nome do cliente que possui o veículo cujo código do estacionamento é 2.
SELECT c.nome
from tb_cliente as c, tb_estaciona as e, tb_veiculo as V
where e.cod = 2 and e.tb_veiculo_placa = v.placa and
v.tb_cliente_cpf = c.cpf;

-- m. Exiba o CPF do cliente que possui o veículo cujo código do estacionamento é 3.
SELECT c.cpf
from tb_cliente as c, tb_estaciona as e, tb_veiculo as V
where e.cod = 3 and e.tb_veiculo_placa = v.placa and
v.tb_cliente_cpf = c.cpf;

-- n. Exiba a descrição do modelo do veículo cujo código do estacionamento é 2.
SELECT m.descricao
from tb_modelo as m, tb_estaciona as e, tb_veiculo as V
where e.cod = 2 and e.tb_veiculo_placa = v.placa and
v.tb_modelo_codmod = m.codmod;

-- o. Exiba a placa, o nome dos donos e a descrição dos os modelos de todos os veículos.
select v.placa, c.nome, m.descricao
from tb_modelo as m, tb_cliente as c, tb_veiculo as v
where v.tb_modelo_codmod = m.codmod and v.tb_cliente_cpf;

-- p. Mostre o nome dos clientes e a placa de seus veículos que estacionaram no pátio 1, 2 ou 3.
select v.placa, c.nome
from tb_estaciona as e, tb_cliente as c, tb_veiculo as v
where tb_patio_num in (1,2,3) and
e.tb_veiculo_placa = v.placa and v.tb_cliente_cpf = c.cpf;

-- q. Mostre as placas de veículos cujo código do estacionamento é 2 
-- e as placas de veículos cujo código do estacionamento é 3.
select v.placa
from tb_estaciona as e, tb_veiculo as v
where e.cod in (2,3) and e.tb_veiculo_placa = v.placa;
