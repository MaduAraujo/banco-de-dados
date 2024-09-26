CREATE DATABASE loja;

-- Tabela de Clientes
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

-- Tabela de Pedidos
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT,
    produto VARCHAR(100),
    quantidade INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Inserir dados na tabela de Clientes
INSERT INTO clientes (nome, email) VALUES
('João Silva', 'joao.silva@email.com'),
('Maria Oliveira', 'maria.oliveira@email.com');

-- Inserir dados na tabela de Pedidos
INSERT INTO pedidos (cliente_id, produto, quantidade) VALUES
(1, 'Notebook', 1),
(2, 'Smartphone', 2),
(1, 'Mouse', 3);

-- Consulta para obter todos os pedidos com informações dos clientes
SELECT clientes.nome, pedidos.produto, pedidos.quantidade
FROM pedidos
JOIN clientes ON pedidos.cliente_id = clientes.id;

-- Consulta para obter todos os clientes e seus pedidos
SELECT clientes.nome, pedidos.produto, pedidos.quantidade
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id;