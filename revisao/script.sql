create database if not exists revisao;
use revisao;
-- drop database revisao;

create table if not exists aluno(
	nome_aluno varchar(15),
    numero_aluno int not null,
    tipo_aluno char(1),
    curso varchar(30),
    primary key (numero_aluno)
);

create table if not exists disciplina(
	nome_disciplina varchar(40),
    numero_disciplina varchar(7)not null,
    creditos char(3),
    departamento varchar(10),
    primary key(numero_disciplina)
);

create table if not exists turma(
	idturma int not null,
    numero_disciplina varchar(7)not null,
    semestre varchar(20),
    ano varchar(15),
    professor varchar(30),
	primary key(idturma),
    foreign key(numero_disciplina) references disciplina(numero_disciplina)
);

create table if not exists historico_escolar(
	numero_aluno varchar(15) not null,
    idturma varchar(15) not null,
    nota varchar(10),
    primary key(numero_aluno, idturma),
    foreign key(numero_aluno) references aluno (numero_aluno),
    foreign key(idturma) references turma (idturma)
);




