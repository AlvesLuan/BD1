create database atvd;
use atvd;
-- drop database atvd;

create table if not exists departamento (
	dnome varchar(50),
    dnum varchar(50) primary key,
    totalSal decimal(10,2)
);

create table if not exists empregado(
	nome varchar(100),
    matricula varchar (100) primary key,
    salario decimal(10,2),
    ndep varchar(50),
    foreign key (ndep) references departamento (dnum)ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TRIGGER InsereNovoEmpregado AFTER INSERT
ON Empregado
FOR EACH ROW
UPDATE Departamento SET TotalSal = TotalSal + NEW.Salario
WHERE Dnum = NEW.Ndep;

CREATE TRIGGER AtualizaEmpregado AFTER UPDATE
ON Empregado
FOR EACH ROW
UPDATE Departamento SET TotalSal = TotalSal - OLD.Salario + NEW.Salario
WHERE Dnum = NEW.Ndep;

CREATE TRIGGER RemoveEmpregado AFTER DELETE
ON Empregado
FOR EACH ROW
UPDATE Departamento SET TotalSal = TotalSal - OLD.Salario
WHERE Dnum = OLD.Ndep;



INSERT INTO Departamento VALUES('TI', 001, 0);
INSERT INTO Empregado VALUES('Luiz Felipe', 001, 2500.00, 001);
INSERT INTO Empregado VALUES('Luan Kauan', 002, 3500.00, 001);
INSERT INTO Empregado VALUES('Tomaz Correa', 003, 1500.00, 001);

SELECT * FROM Departamento;
SELECT * from empregado;

UPDATE Empregado SET Salario = 2500 WHERE Matricula = 003;

SELECT * FROM Departamento;
SELECT * from empregado;

DELETE FROM Empregado WHERE Matricula = 002;

SELECT * FROM Departamento;
SELECT * from empregado;
