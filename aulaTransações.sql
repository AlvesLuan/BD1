CREATE DATABASE banco;
USE banco;

CREATE TABLE conta(
id CHAR(1),
saldo FLOAT
);

INSERT INTO conta VALUES
('A', 50.00),
('B', 50.00);


-- drop procedure transferencia

DELIMITER $
	CREATE PROCEDURE transferencia(in origem char(1), in destino char(1), in valor float)
    BEGIN
		declare x float;
        start transaction;
		if (origem != '' and destino != '' and valor>0) then
			UPDATE conta set saldo = saldo + valor where destino = id;
			UPDATE conta set saldo = saldo - valor where origem = id;
            select * from conta;
            select saldo into x from conta where id = origem;
            if x >= 0 then commit;
            else rollback;
            end if;
		else select 'valores incorretos';
		END IF;
	END $$

DELIMITER ;

update conta set saldo = saldo + 50 where id = 'A';
CALL transferencia ('A', 'B', 30.00);
SELECT * FROM conta;
