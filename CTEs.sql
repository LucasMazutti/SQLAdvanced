-- 1. Top clientes por valor gasto
WITH ClienteGastos AS (
    SELECT 
        CustomerID,
        SUM(TotalDue) AS TotalGasto
    FROM Sales.SalesOrderHeader
    GROUP BY CustomerID
)
SELECT TOP 10 
    CustomerID,
    TotalGasto
FROM ClienteGastos
ORDER BY TotalGasto DESC;

-- 2. soma das vendas por subcategoria

;WITH SubcatSales AS (
    SELECT 
        ps.ProductSubcategoryID,
        ps.Name AS SubcategoryName,
        SUM(sod.LineTotal) AS TotalSales
    FROM Sales.SalesOrderDetail AS sod
    JOIN Production.Product AS p
        ON sod.ProductID = p.ProductID
    JOIN Production.ProductSubcategory AS ps
        ON p.ProductSubcategoryID = ps.ProductSubcategoryID
    GROUP BY ps.ProductSubcategoryID, ps.Name
)
-- verifique o resultado da CTE
SELECT TOP 20 *
FROM SubcatSales
ORDER BY TotalSales DESC;


-- 3. Média de vendas por ano e variação em relação ao ano anterior

;WITH VendasAno AS (
    SELECT 
        YEAR(OrderDate) AS Ano,
        SUM(TotalDue) AS TotalVendas
    FROM Sales.SalesOrderHeader
    GROUP BY YEAR(OrderDate)
)
SELECT 
    Ano,
    TotalVendas,
    LAG(TotalVendas) OVER(ORDER BY Ano) AS VendasAnoAnterior,
    TotalVendas - LAG(TotalVendas) OVER(ORDER BY Ano) AS Diferenca
FROM VendasAno
ORDER BY Ano;




