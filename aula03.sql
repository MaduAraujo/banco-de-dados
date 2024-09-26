CREATE DATABASE loja;

-- Conectar à base de dados
\c loja;

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
(1, 'Notebook', 2),
(2, 'Smartphone', 1),
(1, 'Mouse', 2);

--Trigger que registra a data e hora de inserção de um novo pedido na tabela
CREATE TABLE pedidos_log (
    id SERIAL PRIMARY KEY,
    pedido_id INT,
    data_hora TIMESTAMP
);

CREATE OR REPLACE FUNCTION log_pedido_inserido()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO pedidos_log (pedido_id, data_hora)
    VALUES (NEW.id, NOW());
    RETURN NEW;
END;

CREATE TRIGGER trigger_log_pedido
AFTER INSERT ON pedidos
FOR EACH ROW
EXECUTE FUNCTION log_pedido_inserido();

--Testar o trigger inserindo um novo pedido:
INSERT INTO pedidos (cliente_id, produto, quantidade) VALUES (2, 'Teclado', 1);

--Verificar a tabela para confirmar que o trigger funcionou
SELECT * FROM pedidos_log;
