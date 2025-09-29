-- Window Functions 
-- 1. Ranking de vendas por vendedor
SELECT 
    SalesPersonID,
    SUM(LineTotal) AS TotalVendas,
    RANK() OVER(ORDER BY SUM(LineTotal) DESC) AS RankVendedor
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
GROUP BY SalesPersonID;

-- 2. Produtos mais vendidos dentro de cada categoria
SELECT 
    A.Name AS Categoria,
    B.Name AS Produto,
    SUM(C.OrderQty) AS QuantidadeVendida,
    ROW_NUMBER() OVER(PARTITION BY A.ProductCategoryID ORDER BY SUM(C.OrderQty) DESC) AS Posicao
FROM Production.Product B
JOIN Production.ProductSubcategory D ON B.ProductSubcategoryID = D.ProductSubcategoryID
JOIN Production.ProductCategory A ON D.ProductCategoryID = A.ProductCategoryID
JOIN Sales.SalesOrderDetail C ON C.ProductID = B.ProductID
GROUP BY A.Name, A.ProductCategoryID, B.Name;

-- 3. Média móvel de vendas por mês
SELECT 
    YEAR(OrderDate) AS Ano,
    MONTH(OrderDate) AS Mes,
    SUM(TotalDue) AS VendasMes,
    AVG(SUM(TotalDue)) OVER(ORDER BY YEAR(OrderDate), MONTH(OrderDate) ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MediaMovel
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate);

-- 4.Percentual de contribuição de cada vendedor nas vendas
SELECT 
    SalesPersonID,
    SUM(TotalDue) AS TotalVendedor,
    SUM(TotalDue) * 1.0 / SUM(SUM(TotalDue)) OVER() AS Percentual
FROM Sales.SalesOrderHeader
GROUP BY SalesPersonID;

-- 5.Acumulado de vendas (Running Total)
SELECT 
    OrderDate,
    SUM(TotalDue) AS VendasDiarias,
    SUM(SUM(TotalDue)) OVER(ORDER BY OrderDate) AS VendasAcumuladas
FROM Sales.SalesOrderHeader
GROUP BY OrderDate;




