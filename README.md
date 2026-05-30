# SQL-CODE-CHALLENGE-
Documentation of my SQL codes in solving problems

About the Adventureworks Database


Adventure Works Cycles is a fictional, multinational manufacturing company created by Microsoft to demonstrate enterprise database architecture, data analytics, and business intelligence scenarios.
Core Products: The company designs, manufactures, and distributes high-end metal and composite bicycles. To diversify its revenue streams, it also markets secondary lines: Bicycle Components (replacement wheels, pedals, frames), Apparel (jerseys, socks, vests), and Accessories (helmets, water bottles, pumps).
Business Model: Adventure Works operates a hybrid B2B (Business-to-Business) and B2C (Business-to-Consumer) model.
B2B: They sell in bulk to global retail or wholesale bike stores via dedicated sales representatives.
B2C: They sell directly to individual consumers through an e-commerce storefront.
Global Footprint: Headquartered in Bothell, Washington, USA, the company supports several localized sales territories across North America, Europe, and Asia-Pacific. Sub-assembly manufacturing plants are also simulated globally (such as a component plant in Mexico) to mirror real-world supply chain and logistics constraints.

Data Tables Description
1. Customer & Logistics Group (3 Tables)
SalesLT.Address
Purpose: Stores physical location master data.
Key Columns: AddressID (PK), AddressLine1, AddressLine2, City, StateProvince, CountryRegion, PostalCode.
Role: Acts as a central lookup directory for any geographic location used in the system (billing offices, warehouses, or shipping destinations).
SalesLT.Customer
Purpose: Holds master profiles for all business contacts and individual buyers.
Key Columns: CustomerID (PK), CompanyName, FirstName, LastName, EmailAddress, Phone, PasswordHash, PasswordSalt.
Role: Identifies the customer entity. It merges both retail B2C shoppers and wholesale B2B corporate buyers into a single unified table.
SalesLT.CustomerAddress
Purpose: A cross-reference junction table mapping customers to physical locations.
Key Columns: CustomerID (Composite PK/FK), AddressID (Composite PK/FK), AddressType.
Role: Resolves a many-to-many relationship, tracking which specific address is a customer's Billing address vs. their Shipping address.
2. Product Catalog Group (5 Tables)
SalesLT.Product
Purpose: The central inventory table containing every item or item variant sold.
Key Columns: ProductID (PK), Name, ProductNumber, Color, StandardCost, ListPrice, Size, Weight, ProductCategoryID (FK), ProductModelID (FK).
Role: Manages pricing, manufacturing costs, physical dimensions, and stock lifecycle variables (SellStartDate, SellEndDate).
SalesLT.ProductCategory
Purpose: Dictates product grouping classification.
Key Columns: ProductCategoryID (PK), ParentProductCategoryID (FK), Name.
Role: Uses a self-referencing foreign key structure to handle multi-level hierarchies (e.g., Parent Category: Components $\rightarrow$ Sub-category: Mountain Frames).
SalesLT.ProductDescription
Purpose: Stores the exact text summaries used for marketing and cataloging.
Key Columns: ProductDescriptionID (PK), Description.
Role: Houses the raw string descriptions of the product capabilities without locking them to a single language or model.
SalesLT.ProductModel
Purpose: Aggregates individual product variants into higher-level design families.
Key Columns: ProductModelID (PK), Name, CatalogDescription (XML data).
Role: Groups individual items that share a design template (e.g., grouping different sizes/colors of the "Road-650" bicycle model under a single identifier).
SalesLT.ProductModelProductDescription
Purpose: A junction table linking product descriptions to specific product models.
Key Columns: ProductModelID (Composite PK/FK), ProductDescriptionID (Composite PK/FK), Culture.
Role: Handles localization; the Culture column flags whether a description text row should render in English (en), French (fr), Arabic (ar), etc.
3. Transactional Sales Group (2 Tables)
SalesLT.SalesOrderHeader
Purpose: Records macro-level meta details for every invoice/transaction generated.
Key Columns: SalesOrderID (PK), OrderDate, ShipDate, CustomerID (FK), ShipToAddressID (FK), BillToAddressID (FK), SubTotal, TaxAmt, Freight, TotalDue, Status.
Role: Tracks who bought the order, when it happened, its shipping status, and the financial high-level summary sums.
SalesLT.SalesOrderDetail
Purpose: Houses line-item operational details for every transaction header.
Key Columns: SalesOrderID (Composite PK/FK), SalesOrderDetailID (Composite PK/Identity), ProductID (FK), OrderQty, UnitPrice, UnitPriceDiscount, LineTotal.
Role: Breaks down the exact quantities, prices, and unit item deductions for every single line inside an invoice.
