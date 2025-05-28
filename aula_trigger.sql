create database gatilho;
use gatilho;

create table produtos(
	referencia varchar(3) primary key,
    descricao varchar(50),
    estoque int not null default 0
);

insert into produtos values('001','Feijao',10);
insert into produtos values('002','Arroz',5);
insert into produtos values('003','Farinha',15);

Create table ItensVenda(
	Venda int primary key,
	produto varchar(3),
	quantidade int,
	foreign key (produto) references produtos (referencia) on delete cascade on update cascade
);

create trigger tgr_itensvenda_insert after insert 
on itensvenda
for each row 
    update Produtos set estoque = estoque - NEW.quantidade
    Where referencia = NEW.produto;
    
select * from produtos;
insert into itensvenda values(1,'001',3);

-- drop trigger tgr_itensvenda_insert

-- igual ao anterior com before
create trigger tgr_itensvenda_insert before insert 
on itensvenda
for each row 
    update Produtos set estoque = estoque - NEW.quantidade
    Where referencia = NEW.produto;
    
select * from itensVenda;
select * from produtos;
insert into itensvenda values (2,'001',1);
select * from itensvenda;
select * from produtos;


-- drop delete tgr_itensvenda_delete
create trigger tgr_itensvenda_delete after delete
on itensvenda
for each row	
	update Produtos set estoque = estoque + OLD.quantidade
    where referencia = OLD.Produto;
    
select * from produtos;
select * from itensvenda;
set sql_safe_update=0;
delete from itensvenda where venda = 1 and produto = '001';

select * from produtos;
select * from itensvenda;

DELIMITER $$
CREATE TRIGGER tgr_itensvenda_insert after insert
on itensvenda
for each row
BEGIN
	-- declaracao variaveis
    declare qtde_em_estoque int;
    -- setar valores
	select estoque into qtde_em_estoque
    from produtos where produtos.referencia = new.produto;
    if (qtde_em_estoque - NEW.Quantidade) >= 0 then
		update produtos set estoque = estoque - NEW.Quantidade
        where referencia = NEW.produto;
	end if;
    if (qtde_em_estoque - NEW.Quantidade) < 0 then
		signal sqlstate '45000' -- o comando SIGNAL serva pra gerar um erro MANUALMENTE
			set MESSAGE_TEXT = 'ESTOQUE INSUFICIENTE PARA REALIZAR A VENDA'
	end if;
DELIMITER ;

insert into itensvenda values(4,'002',10);

select * from itensvenda;
select * from produtos;

drop trigger trg_itensvenda_insert
