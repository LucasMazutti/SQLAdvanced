# Projeto SQL Server + Power BI | AdventureWorks

Este projeto foi desenvolvido como prática do curso **Advanced SQL** (Alison) aliado a estudos próprios, 
utilizando o banco de dados **AdventureWorks2019** no SQL Server e integração com o Power BI para visualização dos resultados.  

## 🎯 Objetivo
Consolidar conhecimentos em:
- Window Functions
- Common Table Expressions (CTEs)
- Temporary Tables (TempTables)
- Subqueries (Scalar e Correlated)
- DML e DDL (INSERT, UPDATE, TRUNCATE, CREATE)
- Índices e boas práticas em consultas SQL
- Integração de SQL Server com o Power BI para construção de relatórios.

## 🗂 Estrutura do Projeto
O projeto foi organizado em **três frentes principais**:

### 1. Window Functions
Consultas para:
- Ranking de clientes por valor gasto (`ROW_NUMBER`, `RANK`, `DENSE_RANK`)
- Cálculo de médias móveis (`AVG OVER (PARTITION BY ...)`)
- Uso de `LAG` e `LEAD` para comparação entre registros.

### 2. Temp Tables
Criação de tabelas temporárias para:
- Armazenar vendas por ano e comparar resultados entre períodos.
- Realizar joins simplificados sem impactar diretamente as tabelas originais.

### 3. CTEs
Uso de CTEs para:
- Criar séries de datas recursivas
- Calcular total de vendas mensais por cliente
- Tornar queries complexas mais legíveis.

## 📊 Integração com Power BI
As consultas foram exportadas para o **Power BI**, permitindo a criação de dashboards com:

## 🚀 Tecnologias Utilizadas
- **SQL Server Management Studio (SSMS)**
- **AdventureWorks2019 Database**
- **Power BI Desktop**

## 📌 Aprendizados
- Diferença entre `PARTITION BY` e `ORDER BY` em Window Functions
- Prática com funções analíticas (`ROW_NUMBER`, `LAG`, `LEAD`, `RANK`)
- Benefícios de usar CTEs para simplificar consultas complexas
- Criação e uso de **Temp Tables** em cenários analíticos
- Conexão direta entre SQL Server e Power BI
- Construção de relatórios dinâmicos e visualmente intuitivos

📌 Projeto desenvolvido como parte dos meus estudos de **SQL e Data Analytics**.  
📍 Curso base: [Advanced SQL – Alison] [https://alison.com/topic/learn/146654/learning-outcomes]
