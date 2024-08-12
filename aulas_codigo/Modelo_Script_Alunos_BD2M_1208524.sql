CREATE DATABASE bd_alunos_3jd;
USE bd_alunos_3jd;

CREATE TABLE curso (
	id_curso int primary key auto_increment,
    nome varchar(200),
    carga_horaria varchar(3)
);

CREATE TABLE professor (
	id_professor int primary key auto_increment,
    nome varchar(250),
    data_nasc date,
    contato varchar(15)
);

CREATE TABLE disciplina (
	id_disciplina int primary key auto_increment,
    nome varchar(200),
    carga_horaria varchar(3),
    id_curso int,
    id_professor int,
    foreign key (id_curso) references curso (id_curso),
    foreign key (id_professor) references professor (id_professor)
);

CREATE TABLE turma (
	id_turma int primary key auto_increment,
    data_mat date,
    horario varchar(45),
    id_curso int,
    foreign key (id_curso) references curso (id_curso)
);

CREATE TABLE aluno (
	id_aluno int primary key auto_increment,
    nome varchar(250),
    data_nasc date,
    contato varchar(15),
    id_turma int,
    id_curso int,
    foreign key (id_turma) references turma (id_turma),
    foreign key (id_curso) references curso (id_curso)
);