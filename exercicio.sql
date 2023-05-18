CREATE DATABASE exercicio;
USE exercicio;
CREATE TABLE cliente(
	num_cliente char(2) primary key,
    nome_cliente varchar(30),
    agencia varchar(10),
    conta varchar(20)
);

CREATE TABLE emprestimo(
	num_emprestimo char(5) primary key,
    valor double(8,2),
    data_emprestimo date,
    num_cliente char(2),
    foreign key (num_cliente) references cliente (num_cliente)
);

INSERT INTO cliente (num_cliente, nome_cliente, agencia, conta) VALUES ('C1', 'Bruno', 'Tambaú', 205.123-9);

INSERT INTO cliente (num_cliente, nome_cliente, agencia, conta) VALUES('C2', 'Larissa', 'Cristo', '150.230-x');

INSERT INTO emprestimo (num_emprestimo, valor, data_emprestimo, num_cliente) VALUES ('E100', '1500,00', '2020-01-15', 'C1'),
('E200', '2800,00', '2020-01-28', 'C2'), ('E300', '1700,00', '2020-02-25', 'C2');
INSERT INTO emprestimo (num_emprestimo, valor, data_emprestimo, num_cliente) VALUES ('E400', '1500,00', '2020-01-15', 'C1'),
('E500', '2800,00', '2020-01-28', 'C2'), ('E600', '1700,00', '2020-02-25', 'C2');

#questão 1
create view v_cliente_emprestimo
as 
select c.agencia, c.nome_cliente from cliente c inner join emprestimo e
on c.num_cliente = e.num_cliente; 

select * from v_cliente_emprestimo;

#questão 2
create view v_total_emprestimos
as
select count(*) Quantidade, c.nome_cliente Nome from cliente c inner join emprestimo e
on c.num_cliente = e.num_cliente
group by c.nome_cliente;

#select * from v_total_emprestimos;

show full tables;

#questão 3
alter view v_total_emprestimos
as
select count(*) Qauntidade, c.nome_cliente Nome from
cliente c inner join emprestimo e
on c.num_cliente = e.num_cliente
group by c.nome_cliente
having count(*) >=2;

select * from v_total_emprestimos;

#questão 4
drop view v_total_emprestimos;

show full tables;