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


DELIMITER $$
CREATE FUNCTION quadrado (numero INT) RETURNS int
BEGIN
	SET numero = numero * numero;
    RETURN numero;
END$$
DELIMITER ;

select quadrado(5);
-- drop function quadrado;


SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER $$
CREATE FUNCTION quadrado (numero INT) RETURNS int
BEGIN
	SET numero = numero * numero;
    RETURN numero;
END$$
DELIMITER ;

select quadrado(5);



DELIMITER $$
Create procedure teste5()
Begin
	declare x int;
    declare y float;
    set y = 1.1;
    select count(*) into x from tabela1;
    select x,y;
END $$
DELIMITER ;
-- drop procedure teste5

call teste5();


DELIMITER $
CREATE PROCEDURE teste6 (in a int)
BEGIN
	declare x float;
    if (a >= 0) then set x = 10;
    else set x = 20;
    end if;
    select x;
END $$
DELIMITER ;

call teste6(1);
call teste6(0);
call teste6(-1);


DELIMITER $
CREATE PROCEDURE teste7(in a int, in b int)
BEGIN
IF a > b THEN
	SELECT 'VALOR A MAIOR';
ELSEIF A < B THEN
	SELECT 'VALOR A MENOR';
ELSE
	SELECT 'MESMO VALOR';
END IF;
END $$
DELIMITER ;


DELIMITER $$
CREATE procedure teste8()
begin
	declare str varchar(255) default ' ';
    declare x int DEFAULT 0;
    SET X = 1;
    WHILE x <= 5 DO
		SET str = CONCAT(str, x, ' , ');
        SET x = x + 1;
	END WHILE;
    SELECT STR;
END $$
DELIMITER ;
