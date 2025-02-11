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
insert funcionario  (PNome,CPF,Sexo,Salario,CPF_Supervisor,Dnr) value ('Alice','99988777707','F', 25000,'98765432168', 4);
insert funcionario value ('Joice','45345345376','31-07-1972','av Lucas Obes','F', 25000,'33344555587', 5);
insert funcionario value ('André','98798798733','29-03-1969','rua timbira','M', 25000,'98765432168', 4);
insert funcionario value ('Jorge','8886555576','10-11-1937','rua do hirto','M', 55000,'33344555587', 1); 
update funcionario set DataNasc = '16-03-1997' where cpf = 99988777707;

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
insert DEPARTAMENTO values ('Pesquisa', 5, '33344555587', '22-05-1988' );
insert DEPARTAMENTO values ('Administração', 4, '98765432168', '01-01-1995' );
insert DEPARTAMENTO values ('Matriz', 1, '8886555576', '21-06-1981' );

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
insert Trabalha_em values ('12345678966', 1, 32.5);
insert Trabalha_em values ('12345678966', 2, 7.5); 
insert Trabalha_em values ('66688444476', 3, 40);

CREATE TABLE if not exists LOCALIZACAO_DEP(
	DNumero int NOT NULL,
    DLocal varchar(15) NOT NULL,
    primary key (DNumero, DLocal),
    foreign key (DNumero) references DEPARTAMENTO(DNumero) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);
insert LOCALIZACAO_DEP values(1, 'São Paulo');
insert LOCALIZACAO_DEP values(4, 'Mauá');
insert LOCALIZACAO_DEP values(5, 'Santo André');
insert LOCALIZACAO_DEP values(5, 'Itu');
insert LOCALIZACAO_DEP values(5, 'São Paulo');

CREATE TABLE if not exists PROJETO(
	ProjNome varchar(15) NOT NULL,
    ProjNumero int NOT NULL,
    ProjLocal varchar(15),
    primary key (ProjNumero),
    UNIQUE(ProjNome)
);
insert PROJETO values ('Produtox', 1, 'Santo André', 5);
insert PROJETO values ('Produtoy', 2, 'itu', 5);
insert PROJETO values ('Produtoz', 3, 'São Paulo', 5);
insert PROJETO values ('Informatização', 10, 'Mauá', 4);
insert PROJETO values ('Reorganização', 20, 'São Paulo', 1);
insert PROJETO values ('NovosBenefícios', 30, 'Mauá', 4);

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
