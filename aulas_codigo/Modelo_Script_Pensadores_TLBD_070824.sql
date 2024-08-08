/**
	Aqui, a professora colocara um exemplo de como seria a base de dados se criássemos apenas pelos comandos no Script SQL.
*/

create database if not exists bd_pensadores;
use bd_pensadores;

create table if not exists autor(
	id_autor int primary key auto_increment,
    nome varchar(250),
    data_nasc year,
    data_mortem year
);


/**
    IMPORTANTE: Se olharmos na w3Schools sobre os tipos de dados de uma coluna, veremos que o formato para data e ano possuem limitações.
    Para corrigir isso, a professora utilizou a função alter table e configurou para que estas colunas sejam traduzidas em caracteres.
**/

alter table autor
drop column data_nasc;

alter table autor
add column data_nasc varchar(4);

alter table autor
drop column data_mortem;

alter table autor
add column data_mortem varchar(4);

/**
    Na tabela de frase, vejam que a professora aqui trabalha com a chave primária e secundária (estrangeira). A prof também comentará sobre os relacionamentos 1:1, 1:n e n:m.
*/
create table if not exists frase(
	id_frase int primary key auto_increment,
    conteudo varchar(250),
    id_autor int,
    foreign key (id_autor) references autor(id_autor)
);

/**
	Aqui, a professora vai pedir pra inserir um dado de um autor e sua frase.
*/

insert into autor (nome, data_nasc, data_mortem)
values ("Platão", "0427", "0347");


select * from autor;

insert into frase (conteudo, id_autor)
values ("Tente mover o mundo – o primeiro passo será mover a si mesmo.", 1);

insert into frase (conteudo, id_autor)
values ("Não espere por uma crise para descobrir o que é importante em sua vida.", 1);

select * from frase;