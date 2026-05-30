/*
Scenario: A wallet containing an ID was found in the retail store office belonging to 
"Orlando Gee". We need to retrieve her email address to reach out.
*/

SELECT EmailAddress
FROM SalesLT.Customer
WHERE FirstName = 'Orlando' AND LastName = 'Gee';



/*
Scenario: A buyer wants to know the colour of the product called 
"Road-250 Red, 52". retrieve the name of the product and the colour if available.
*/


select Name, Color
FROM SalesLT.Product
WHERE Name = 'Road-250 Red, 52';