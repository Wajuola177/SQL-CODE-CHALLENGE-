/* 1 The HR manager wants to see how workload is distributed among the sales team. 
Write a query to find out how many customers are assigned to each SalesPerson.*/


SELECT * 
FROM[SalesLT].[Customer];

SELECT SalesPerson,
COUNT(CustomerID) AS NumberofCustomers
FROM [SalesLT].[Customer]
GROUP BY SalesPerson
ORDER BY NumberofCustomers DESC;


/* 2 The production floor wants to analyze manufacturing costs based on product dimensions. 
Write a query to calculate the average StandardCost for each product Size.*/

SELECT * 
FROM[SalesLT].[Product];

SELECT Size, AVG(Standardcost) AS AverageStandardCost
FROM [SalesLT].[Product]
GROUP BY SIZE
ORDER BY AverageStandardCost DESC;

/*3 The warehouse manager wants to see which orders contain a massive quantity of total items shipped. 
Write a query to list each SalesOrderID along with the sum total of all OrderQty items packed within it. 
Only display orders where the total quantity of items is greater than 20.*/

SELECT*
FROM [SalesLT].[SalesOrderDetail];

SELECT SalesOrderID,
SUM(OrderQty)	AS TotalItemsshipped
FROM [SalesLT].[SalesOrderDetail]
GROUP BY SalesOrderID
ORDER BY TotalItemsshipped DESC;

/* 4 The marketing team is reviewing the inventory catalog. 
They want to know how many distinct products belong to each ProductModelID.
Write a query displaying the model ID and the total count of products tied to it, 
sorted from the highest count to the lowest.*/

SELECT *
FROM [SalesLT].[Product];

SELECT ProductModelID,
COUNT(DISTINCT ProductID) AS TotalProducts
FROM [SalesLT].[Product]
GROUP BY ProductModelID
ORDER BY TotalProducts DESC;

/* 5 The catalog management team wants to audit our inventory catalog. 
They need a list of all product model names available in the system,
alongside the names of the actual products tied to them. 
Because some product models are brand new and don't have physical products assigned to them yet, 
you must use a join that ensures every single product model shows up in the results, 
even if its product name column comes back as NULL.*/
