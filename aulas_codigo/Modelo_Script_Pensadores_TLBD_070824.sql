/**
	Aqui, a professora colocara um exemplo de como seria a base de dados se criássemos apenas pelos comandos no Script SQL.
*/

create database if not exists db_pensadores;
use db_pensadores;

create table if not exists autor (
	id_autor int primary key auto_increment,
    nome varchar(250),
    data_nasc date,
    data_mortem date
);

create table if not exists frase (
	id_frase int primary key auto_increment,
    conteudo varchar (250),
    id_autor int not null,
    foreign key (id_autor) references autor(id_autor)
);

/**
	Aqui, a professora vai pedir pra inserir um dado de um autor e sua frase.
*/

insert into autor (nome, data_nasc, data_mortem)
values ("Platão", 0427-01-01, 0327-01-01);

select * from autor;

insert into frase (conteudo, id_autor)
values ("Não espere por uma crise para descobrir o que é importante em sua vida.", 1);