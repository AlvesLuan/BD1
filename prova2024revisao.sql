-- drop database prova3

create database  if not exists prova3;
use prova3;

create table if not exists produtos(
	nome varchar(100),
	preco decimal(10,2),
	idProduto int,
	primary key(idProduto)
);

create table if not exists filiais(
	idFilial int,
    nome varchar(100),
    endereco varchar (200),
    cidade varchar(100),
    uf char(2),
    primary key(idFilial)
);

create table if not exists formapagamento(
	idFormaPagamento int,
    nome varchar(100),
    primary key (idFormaPagamento)
);

create table if not exists clientes(
	idFilial int,
    idCliente int,
    nome varchar(100),
    endereco varchar(200),
    cidade varchar(100),
    uf char(2),
    dtCadastro date,
    tipo varchar(50),
    cpf char(11),
    cnpj char(15),
    primary key(idFilial, idCliente),
    foreign key(idFilial) references filiais(idFilial) on delete cascade on update cascade    
);

create table if not exists vendedores(
	idVendedores int,
    tipo varchar(50),
    filial int,
    nome varchar(50),
    telefone int,
    primary key(idVendedores),
    foreign key(filial) references filiais(idFilial)
);

create table if not exists vendas(
	idVenda int,
    idFilial int,
    idVendedor int,
    idCliente int,
    vendaData date,
    vendaHora time,
    vlrtotal decimal(10,2),
    quantitens int,
    idFormaPagamento int,
    primary key(idVenda),
    foreign key(idFilial) references filiais(idFilial),
    foreign key(idVendedor) references vendedores(idVendedores),
    foreign key(idFilial, idCliente) references clientes(idFilial, idCliente),
    foreign key(idFormaPagamento) references formapagamento(idFormaPagamento)
);

insert into filiais (idFilial, nome, endereco, cidade, uf) values
(1, "Filial Norte", "Rua A, 100", "Belo Horizonte", "mg"),
(2, "Filial Oeste", "Rua B, 200", "Rib. das Neves", "mg"),
(3, "Filial Sul", "Rua C, 300", "Sabará", "mg");

insert into produtos(idProduto, nome, preco) values
(1, "Caneta", 4.99),
(2, "Lapis", 1.99),
(3, "Borracha", 0.49);

-- I. Listar a descrição dos produtos, desde que a quantidade vendida seja maior que 3 unidades.
select distinct p.nome
from produtos p 
inner join vendasprodutos vp on p.idproduto = vp.idproduto
where vp.quantidade > 3;

-- II. Listar a Média de vendas de cada produto, desde que o valor máximo vendido seja superior a media de todos os produtos vendidos;.
select vp.id
