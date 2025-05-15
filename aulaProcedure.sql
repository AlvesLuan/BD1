create database procedimento_funcao;
use procedimento_funcao;
create table tabela1 (
cod int primary key,
nome varchar(45)
);

insert into tabela1 value (1,'Ian');
insert into tabela1 value (2,'Danilo');
insert into tabela1 value (3,'Pedro');
insert into tabela1 value (4,'João');

DELIMITER $
CREATE PROCEDURE teste()
BEGIN

	Select 'hello';
    
END $$
DELIMITER ;

CALL teste();

SELECT * from tabela1;
DELIMITER $$
CREATE PROCEDURE teste2(IN quantidade INT)
BEGIN
	SELECT * FROM tabela1
    LIMIT quantidade;
END $$

CALL teste2(2);
CALL teste2(3);

DELIMITER $$

CREATE PROCEDURE teste3 (OUT quantidade INT)
BEGIN
	SELECT COUNT(*) INTO quantidade FROM tabela1;
END $$

DELIMITER ;
CALL teste3(@quantidade);
select @quantidade;




SET @ti=1, @t2=2, @t3:=4;
select @t1, @t2, @t3, @t4 := @t1+@t2+@t3;



DELIMITER $$
CREATE PROCEDURE teste4(inout numero INT)
BEGIN
	SET numero = numero * numero;
    END $$
DELIMITER ;

SET @valor = 5;
CALL teste4(@valor);
SELECT @valor;

