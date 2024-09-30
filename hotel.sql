CREATE TABLE quarto(
    numero INT NOT NULL PRIMARY KEY,
    valor_diaria FLOAT NOT NULL,
    vista_mar BOOLEAN
);

CREATE TABLE cliente(
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(48) NOT NULL,
    rg VARCHAR(12) NOT NULL,
    telefone VARCHAR(12) NOT NULL
)

INSERT INTO quarto(numero, valor_diaria, vista_mar) VALUES
(101, 74.99, TRUE),
(102, 54.50, FALSE),
(201, 110, TRUE);

SELECT * FROM quarto

INSERT INTO cliente(nome, rg, telefone) VALUES
('João Pereira', '12345678', '(11)98765432'),
('Maria Silva','97653289', '(12)98865412')

SELECT * FROM cliente

CREATE TABLE estadia(
    ID SERIAL PRIMARY KEY,
    fk_id_quarto INT NOT NULL,
    fk_id_cliente INT NOT NULL,
    CONSTRAINT fk_quarto FOREIGN KEY (fk_id_quarto) REFERENCES quarto(numero),
    CONSTRAINT fk_cliente FOREIGN KEY (fk_id_cliente) REFERENCES cliente(ID)
);

INSERT INTO estadia(fk_id_quarto, fk_id_cliente) VALUES
(101, 1),
(102, 2),
(201, 1),
(201, 2);

CREATE TABLE pagamento(
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(18) NOT NULL
);

INSERT INTO pagamento(nome) VALUES
('dinheiro'),
('cartão de crédito'),
('cartão de débito'),
('pix');

ALTER TABLE estadia
ADD COLUMN data_entrada VARCHAR(48),
ADD COLUMN data_saída VARCHAR(48),
ADD COLUMN valor total FLOAT,
ADD COLUMN fk_pagamento INT,
ADD CONSTRAINT fk_pagamento FOREIGN KEY (fk_pagamento) REFERENCES pagamento(ID);

SELECT * FROM estadia

UPDATE estadia
SET data_entrada = '2024-09-20T08:54:00',
    data_saída = '2024-09-30T09:00:00',
    valor_total = 750.00,
    fk_id_pagamento = 2

    WHERE ID = 10