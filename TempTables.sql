-- TempTables
-- 1.Salvar vendas de um ano específico para reuso

CREATE TABLE #Vendas2012 (
    SalesOrderID INT,
    OrderDate DATE,
    CustomerID INT,
    TotalDue MONEY
);

INSERT INTO #Vendas2012
SELECT 
    SalesOrderID,
    OrderDate,
    CustomerID,
    TotalDue
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2012;

SELECT * FROM #Vendas2012;

-- 2. listar os 10 produtos mais vendidos em quantidade, mas também quero reutilizar esse resultado em mais de uma consulta.
-- Criar a Temp Table
CREATE TABLE #TopProdutos (
    ProductID INT,
    QuantidadeVendida INT
);

-- Inserir os 10 produtos mais vendidos
INSERT INTO #TopProdutos
SELECT TOP 10 
    ProductID,
    SUM(OrderQty) AS QuantidadeVendida
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(OrderQty) DESC;

-- Agora consultar a temp table
SELECT p.Name, tp.QuantidadeVendida
FROM #TopProdutos tp
JOIN Production.Product p 
    ON tp.ProductID = p.ProductID
ORDER BY tp.QuantidadeVendida DESC;



-- 3. Criar ranking de produtos mais vendidos usando TempTable + Window Function

CREATE TABLE #ProdutosVendidos (
    ProductID INT,
    TotalVendido MONEY
);

INSERT INTO #ProdutosVendidos
SELECT 
    ProductID,
    SUM(LineTotal) AS TotalVendido
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

-- Agora aplica Window Function sobre a temp table
SELECT 
    ProductID,
    TotalVendido,
    RANK() OVER (ORDER BY TotalVendido DESC) AS Ranking
FROM #ProdutosVendidos;

-- 4. Comparar clientes que compraram em dois períodos diferentes
-- Clientes 2012
CREATE TABLE #Clientes2012 (CustomerID INT);
INSERT INTO #Clientes2012
SELECT DISTINCT CustomerID
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2012;

-- Clientes 2013
CREATE TABLE #Clientes2013 (CustomerID INT);
INSERT INTO #Clientes2013
SELECT DISTINCT CustomerID
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2013;

-- Clientes que compraram nos dois anos
SELECT c12.CustomerID
FROM #Clientes2012 c12
INNER JOIN #Clientes2013 c13 ON c12.CustomerID = c13.CustomerID;





