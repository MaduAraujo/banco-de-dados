CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE NOT NULL,
    quantidade INT NOT NULL,
    produto_id INT,
    FOREIGN KEY (produto_id) REFERENCES produtos(id_produto)
);

CREATE OR REPLACE PROCEDURE relatorio_diario()

AS $$

BEGIN
    -- Cria uma tabela temporária para armazenar o relatório diário
    CREATE TEMP TABLE relatorio_diario AS
    SELECT 
        data_compra,
        SUM(quantidade) AS total_quantidade
    FROM 
        compras
    GROUP BY 
        data_compra
    ORDER BY 
        data_compra;

    -- Exibe o relatório
    SELECT * FROM relatorio_diario;
END;
$$;

--Para executar a Procedure
CALL gerar_relatorio_diario();











