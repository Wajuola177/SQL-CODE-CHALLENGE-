/* 1.A marketing campaign needs to target accounts  
assigned to sales representatives "jillian0" or "pamela0". Trace all matches.*/

SELECT SalesPerson
FROM salesLT.Customer
WHERE SalesPerson IN ('adventure-works\jillian0', 'adventure-works\pamela0');


/* 2.Complete an auditing verification on transactions processed above $10,000 in total dues.*/

SELECT TotalDue
FROM[SalesLT].[SalesOrderHeader]
WHERE TotalDue > 10000;

/* 3. List the Products that do not have a parent product category ID. Display their
product category ID and name only. (hint, use "IS NULL" keyword in your query) */

SELECT ProductCategoryID,ParentProductCategoryID, Name
FROM [SalesLT].[ProductCategory]
WHERE ParentProductCategoryID IS NULL;

/* 4. Retrieve a detailed list of our products whose color is black. 
Provide the Product name, color alongside its associated list price. 
Display only the top 11 most expensive items. */

SELECT TOP 11 Name,Color, ListPrice
FROM [SalesLT].[Product]
WHERE Color = 'Black'
ORDER BY ListPrice DESC;


