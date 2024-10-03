CREATE FUNCTION ClientesCadastrados(@data DATE)
RETURNS INT
AS
BEGIN
    DECLARE @totalClientes INT;
    
    SELECT @totalClientes = COUNT(*)
    FROM Clientes
    WHERE (data_cadastro AS DATE) = @data;
    
    RETURN @totalClientes;
END;
