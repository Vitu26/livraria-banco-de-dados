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

-- Exibir o preço do livro mais caro de cada assunto
select assunto, avg(valor) from livro group by assunto;

-- Exibir os assuntos cuja a média de preços dos livros sejam maiores que 100 reais
select assunto from livro group by assunto having avg(valor) > 100;

-- exibir os assuntos que possuem pelo menos dois livros
select assunto, count(*) from livro group by assunto having count(*) >=2;

-- exibir os assuntos que possuem vendas de livros superiores a 200 reais
select assunto, sum(valor) from livro group by assunto having sum(valor) > 200;

-- exiba o nome e o ano dos livros mais caros da livraria
select titulo, ano from livro where valor = (select max(valor) from livro);

-- exibir o nome e o valor dos livros que foram lançados no mesmo ano em que se lançaram todos os livros de banco de dados, excluindo os de banco de dados
select titulo, valor from livro where assunto <> 'BD' and ano in (select ano from livro where assunto = 'BD');

-- exibir o código, o titulo, valor, ano e nome dos assuntos de todos os livros
select livro.codigo, livro.titulo, livro.valor, livro.ano, assunto.nome;

-- usando aliases, exibir o código, título, valor, ano e nome dos assuntos de todos os livros
select l.codigo, l.titulo, l.ano, a.nome
from livro as l, assunto as a
where l.assunto = a.sigla;

-- exibir o código, titulo, valor ano e nome dos assuntos de todos os livros
select livro.codigo, livro.titulo, livro.valor, livro.ano, assunto.nome
from livro inner join assunto
on livro.assunto = assunto.sigla;

-- usando aliases, exibir o código, título, valor, ano e noe dos assuntos
select l.codigo, l.titulo, l.ano, a.nome
from livro l inner join assunto a
on l.assunto = a.sigla;

-- exibi codigo, titulo, valor, ano e nome das editoras de todos os livros
select livro.codigo, livro.titulo, livro.valor, livro.ano, editora.nome
from livro inner join editora
on livro.editora = editora.codigo;

-- usando aliases, exibir o código, titulo, valor, ano e nome das editoras dos livros
select l.codigo, l.titulo, l.valor, l.ano, e.nome
from livro l inner join editora e
on l.editora = e.codigo;

-- exibir o titulo e o nome dos assuntos dos livros lançados no ano de 2015

-- exibir o titulo e o nome do assunto dos livros com preço igual ou superior a cem reais
select l.titulo, a.nome
from livro l inner join assunto a
on l.assunto = a.sigla
where l.valor >= 100;

-- exibir o titulo e o nome da editora dos livros lançados no ano de 2015
select l.titulo, e.nome
from livro l inner join editora e
on l.editora = e.codigo
where l.ano >= 2015;

INSERT INTO livro (codigo, titulo, valor, ano) VALUES (8, 'Python', 65.00, 2015);
INSERT INTO livro (codigo, titulo, valor, ano) VALUES (9, 'Oracle', 150.00, 2016);
INSERT INTO livro (codigo, titulo, valor, ano) VALUES (10, 'Redes de computadores', 99.00, 2016);

select l.titulo, a.nome
from livro l left outer join assunto a
on l.assunto = a.sigla;

select l.titulo, a.nome
from livro l right outer join assunto a
on l.assunto = a.sigla;

insert into livro(codigo, titulo, valor, ano) values (11, 'Direito Digital', 115.00, 2022),(12, 'Linux', 180.00, 2017)
, (50,'Teoria da Computação', 135.00,2019);

-- exibir o titulo, valor, ano, nome do assunto e da editora do todos os livros
select l.titulo, l.valor, l.ano, a.nome, e.nome
from livro l inner join assunto a inner join editora e
on l.assunto = a.sigla and l.editora = e.codigo;

-- exibi o titulo, valor, ano, nome do assunto e da editora de todos os livros da editora Pearson lançados em 2014
select l.titulo, l.valor, l.ano, a.nome, e.nome
from livro l inner join assunto a inner join editora e
on l.assunto = a.sigla and l.editora = e.codigo
where e.nome = 'Pearson' and l.ano = 2014;