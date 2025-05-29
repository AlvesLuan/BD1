use EXERCICIO_GATILHO;

-- QUESTAO 1 
-- Crie um trigger para atualizar a quantidade de pedidos de cada cliente quando que um novo pedido é cadastrado. Mostre o resultado fazendo uma consulta a tabela Cliente.

select * from cliente;

CREATE TRIGGER tgr_qtd_pedido_insert after insert
ON pedido
FOR EACH ROW 
	update cliente set qtde_pedido = qtde_pedido + 1 
	where codcliente = NEW.codCliente;
    
insert into pedido (codpedido, codcliente, datapedido, valortotal) values (1,1, '16/05/2023', 0);
insert into pedido (codpedido, codcliente, datapedido, valortotal) values (2,2, '16/05/2023', 2);
insert into pedido (codpedido, codcliente, datapedido, valortotal) values (2,1, '16/05/2023', 1);

select * from cliente;
select * from pedido;

-- -----------------------------------------------------------------
-- QUESTAO 2
-- Crie um trigger para atualizar a quantidade de pedidos de cada cliente DEPOIS  que um cliente cancela um pedido. Faça um teste mostrando o resultado.
select * from cliente;

CREATE TRIGGER tgr_cancela_pedido after delete
ON pedido
FOR EACH ROW 
	update cliente set qtde_pedido = qtde_pedido - 1 
	where codcliente = OLD.codCliente;
    
delete from pedido where codpedido = 1 and codcliente = 1;
select * from cliente;

select * from cliente;
select * from pedido;

-- -----------------------------------------------------------------
-- QUESTAO 3
-- Crie um trigger para atualizar o campo valor total da Tabela Pedido quando um novo registro for inserido na Tabela ItemPedido. Faça um teste mostrando o resultado.
CREATE TRIGGER tgr_atualiza_valor_total before insert
ON itempedido
FOR EACH ROW 
	update pedido set valortotal = valortotal + (new.valorunitario * new.quantidade) 
	where codpedido = new.codpedido;

insert into pedido(codpedido, codcliente, datapedido, valortotal) values (1, 1, '16/05/2025', 0);
select * from pedido;
select * from itempedido;

insert into itempedido(codpedido, numeroitem, valorunitario, quantidade, codproduto) values (2, 1, 20.00, 5, 1);
select * from pedido;
select * from itempedido;


-- -----------------------------------------------------------------
-- QUESTAO 4
-- Quando um novo ItemPedido for inserido, a quantidade de produtos na tabela Produto deve ser alterada. Faça um trigger para que essa funcionalidade seja implementada. Faça um teste mostrando o resultado
DELIMITER $$
CREATE TRIGGER Tgr_QDTE_PRODUTO BEFORE INSERT  -- obrigatóriamente deve ser before por conta da quantidade.
ON ITEMPEDIDO
FOR EACH ROW
BEGIN
    
    IF ((select quantidade  from PRODUTO  WHERE PRODUTO.codproduto = NEW.codproduto)>= NEW.quantidade )
    THEN
		UPDATE PRODUTO SET  PRODUTO.quantidade = PRODUTO.quantidade - NEW.quantidade 
        WHERE PRODUTO.codproduto = NEW.codproduto;
    end if;   
END $$    
DELIMITER ;	

DELETE FROM ITEMPEDIDO WHERE codpedido =1;
DELETE FROM PEDIDO WHERE codpedido =1;

select * from PEDIDO;    
select * from ITEMPEDIDO;  
select * from Cliente;   
select * from PRODUTO;   

show triggers;
  
INSERT INTO PEDIDO (codpedido,codcliente , datapedido , valortotal) VALUES (1,1, '16/05/2023', 0);  
INSERT INTO ITEMPEDIDO (codpedido, numeroitem , valorunitario , quantidade , codproduto) VALUES (1,1, 20.00,5,1);  
