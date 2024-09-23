CREATE TABLE aluno(
  ID SERIAL PRIMARY KEY,
  nome VARCHAR(20) not NULL,
  email VARCHAR(30),
  endereco VARCHAR(30)
);

insert INTO aluno (nome, email, endereco) values ('Joao Carlos', 'jcarlos@gmail.com', 'Rua 13 de Maio');
insert INTO aluno (nome, email, endereco) values ('José Vitor', 'jvitor@gmail.com', 'Rua da Saudade');
insert INTO aluno (nome, email, endereco) values ('Paulo André', 'pandre@gmail.com', 'Rua do Sol');

                                                  
SELECT * FROM aluno;