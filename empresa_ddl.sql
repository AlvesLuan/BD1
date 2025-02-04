-- DROP DATABASE Empresa;

CREATE DATABASE	if not exists Empresa;
use Empresa;

CREATE TABLE if not exists FUNCIONARIO(
	PNome varchar(15) NOT NULL,
    CPF char(15) NOT NULL primary key,
    DataNasc Char(10),
    Logra varchar(30),
    Sexo char check(Sexo in ('M' , 'F')),
    Salario decimal(10,2),
    CPF_Supervisor char(12),
    Dnr int
    -- primary key (CPF)
);

CREATE TABLE DEPARTAMENTO(
	DNOME varchar(10) NOT NULL,
    DNUMERO INTEGER NOT NULL,
    GERCPF CHAR(11),
    GERDATINIC CHAR(9),
    primary key (DNUMERO),
    UNIQUE (DNOME),
    foreign key(GERCPF) REFERENCES FUNCIONARIO(CPF) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

CREATE TABLE if not exists TRABALHA_EM(
	FCPF char(11) NOT NULL,
    PNR int NOT NULL,
    Horas decimal(3,1) NOT NULL,
    primary key(FCPF, PNR), #cada atributo referencia a sua tabela
    foreign key(FCPF) references FUNCIONARIO(CPF) #referenciou um
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    foreign key(PNR) references PROJETO(ProjNumero) #referenciou oto
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE if not exists LOCALIZACAO_DEP(
	DNumero int NOT NULL,
    DLocal varchar(15) NOT NULL,
    primary key (DNumero, DLocal),
    foreign key (DNumero) references DEPARTAMENTO(DNumero) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

CREATE TABLE if not exists PROJETO(
	ProjNome varchar(15) NOT NULL,
    ProjNumero int NOT NULL,
    ProjLocal varchar(15),
    primary key (ProjNumero),
    UNIQUE(ProjNome)
);

ALTER TABLE  PROJETO ADD COLUMN DNum int NOT NULL;

ALTER TABLE PROJETO ADD CONSTRAINT FK
foreign key (DNum) references DEPARTAMENTO(DNumero)
on delete cascade
on update cascade;

-- ALTER TABLE PROJETO DROP foreign key FK;
-- ALTER TABLE PROJETO DROP COLUMN DNum;


show tables;
desc PROJETO
-- DROP TABLE FUNCIONARIO;
-- DROP TABLE DEPARTAMENTO;
