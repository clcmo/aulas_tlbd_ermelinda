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

/**
        proximas etapas:
        1. Criar as tabelas de livro, editora, pseudonimo, livro_tem_editora, livro_tem_autor
        2. Utilize o modelo feito aqui no laboratório para a criação das colunas, chaves primárias e secundárias vistas na aula e no enunciado.

        Aqui vai o exemplo

        create table nome_da_tabela ---> Criar tabela
        create table if not exists nome_da_tabela ---> Criar uma nova tabela, desde que ela não exista

        create table if not exists livro (
            isbn varchar(14) primary key not null, ----> informa que minha chave primária será o código ISBN de meu livro, possui 14 caracteres e não pode ser nulo.
            titulo varchar(300) not null, ---> informa o título de meu livro, é composto por um limite de caracteres e não é nulo.
            subtitulo varchar(300) null, ---> informa que talvez eu tenha o subtitulo de meu livro, é composto por um limite de caracteres.
            nome_da_outra_coluna tipo_do_dado(se houver, limite de caracteres) constrantes (nulo, não nulo, padrão),
            (se houver, informar a chave estrangeira em que campo e que coluna será a referencia da coluna de outra tabela)
        );
*/