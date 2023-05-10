create database livraria;
use livraria;
create table editora(
	codigo int primary key not null,
    nome varchar(30)

);

create table assunto(
	sigla char(2) primary key,
    nome varchar(30)

);

create table livro(
	codigo int primary key not null,
    titulo varchar(30),
    valor float(6,2),
    ano year,
    assunto char(2),
    editora int,
    foreign key (assunto) references assunto(sigla),
    foreign key (editora) references editora(codigo)


);

INSERT INTO editora (codigo, nome) VALUES (1, 'Pearson');
INSERT INTO editora (codigo, nome) VALUES (2 ,'Saraiva');
INSERT INTO editora (codigo, nome) VALUES (3, 'Bookman');
INSERT INTO editora (codigo, nome) VALUES (4, 'Unipe');

INSERT INTO assunto (sigla, nome) VALUES ('BD', 'Banco de Dados');
INSERT INTO assunto (sigla, nome) VALUES ('GP', 'Gerencia de Projetos');
INSERT INTO assunto (sigla, nome) VALUES ('RC', 'Redes de Computadores');
INSERT INTO assunto (sigla, nome) VALUES ('ES', 'Engenharia de Software');
INSERT INTO assunto (sigla, nome) VALUES ('PR', 'Programação');

INSERT INTO livro (codigo, titulo, valor, ano, assunto, editora) VALUES (1, 'MYSQL', 100.00, 2014, 'BD', 1);
INSERT INTO livro (codigo, titulo, valor, ano, assunto, editora) VALUES (2, 'Introdução ao PMBOK', 88.00, 2014, 'GP', 2);
INSERT INTO livro (codigo, titulo, valor, ano, assunto, editora) VALUES (3, 'JAVA', 75.00, 2014, 'PR', 2);
INSERT INTO livro (codigo, titulo, valor, ano, assunto, editora) VALUES (4, 'Engenharia de Software', 120.00, 2013, 'ES', 3);
INSERT INTO livro (codigo, titulo, valor, ano, assunto, editora) VALUES (5, 'Python', 65.00, 2015, 'PR', 4);
INSERT INTO livro (codigo, titulo, valor, ano, assunto, editora) VALUES (6, 'Oracle', 150.00, 2016, 'BD', 4);
INSERT INTO livro (codigo, titulo, valor, ano, assunto, editora) VALUES (7, 'Redes de Computadores', 99.00, 2016, 'RC', 1);

