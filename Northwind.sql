# 1.	Select CategoryName and Description from the Categories table sorted by CategoryName.
SELECT 
    CategoryName, Description
FROM
    categories
ORDER BY CategoryName;

# 2.	Select ContactName, CompanyName, ContactTitle, and Phone from the Customers table sorted by Phone.
SELECT 
    ContactName, CompanyName, ContactTitle, Phone
FROM
    customers
ORDER BY Phone;

#3.	Create a report showing employees' first and last names and hire dates sorted from newest to oldest employee.
SELECT 
    FirstName, LastName, HireDate
FROM
    employees
ORDER BY HireDate ASC;

#4.	Create a report showing Northwind's orders sorted by Freight from most expensive to cheapest. Show OrderID, OrderDate, ShippedDate, CustomerID, and Freight.
SELECT 
    OrderID, OrderDate, ShippedDate, CustomerID, Freight
FROM
    orders
ORDER BY Freight DESC;

#5.	Select CompanyName, Fax, Phone, HomePage and Country from the Suppliers table sorted by Country in descending order and then by CompanyName in ascending order.
SELECT 
    CompanyName, Fax, Phone, HomePage, Country
FROM
    Suppliers
ORDER BY Country DESC , CompanyName ASC;

#6.	Create a report showing all the company names and contact names of Northwind's customers in Buenos Aires.
SELECT 
    CompanyName, ContactName
FROM
    customers
WHERE
    City IN ('Buenos Aires');

#7.	Create a report showing the product name, unit price and quantity per unit of all products that are out of stock.
SELECT 
    ProductName, UnitPrice, QuantityPerUnit
FROM
    products
WHERE
    UnitsInStock IN (0);

#8.	Create a report showing the order date, shipped date, customer id, and freight of all orders placed on May 19, 1997.
SELECT 
    OrderDate, ShippedDate, CustomerID, Freight, OrderDate
FROM
    orders
WHERE
    OrderDate IN ('1994-09-26');

#9.	Create a report showing the first name, last name, and country of all employees not in the United States.
SELECT 
    FirstName, LastName, Country
FROM
    employees
WHERE
    Country NOT IN ('USA');

#10.	Create a report that shows the employee id, order id, customer id, required date, and shipped date of all orders that were shipped later than they were required.
SELECT 
    EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate
FROM
    orders
WHERE
    ShippedDate > RequiredDate;

#11.	Create a report that shows the city, company name, and contact name of all customers who are in cities that begin with "A" or "B."
SELECT 
    City, CompanyName, ContactName
FROM
    suppliers
WHERE
    City LIKE ('A%') OR City LIKE ('B%');

#12.	Create a report that shows all orders that have a freight cost of more than $500.00.
SELECT 
    *
FROM
    orders
WHERE
    Freight > 500;

#13.	Create a report that shows the product name, units in stock, units on order, and reorder level of all products that are up for reorder
SELECT 
    ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel
FROM
    products
WHERE
    UnitsInStock <= ReorderLevel;

#14.	Create a report that shows the company name, contact name and fax number of all customers that have a fax number.
SELECT 
    CompanyName, ContactName, Fax
FROM
    customers
WHERE
    Fax IS NOT NULL;

#15.	Create a report that shows the first and last name of all employees who do not report to anybody
SELECT 
    FirstName, LastName
FROM
    employees
WHERE
    ReportsTo IS NULL;

#16.	Create a report that shows the company name, contact name and fax number of all customers that have a fax number. Sort by company name.
SELECT 
    CompanyName, ContactName, Fax
FROM
    customers
WHERE
    Fax IS NOT NULL
ORDER BY CompanyName;

#17.	Create a report that shows the city, company name, and contact name of all customers who are in cities that begin with "A" or "B." Sort by contact name in descending order
SELECT City, CompanyName, ContactName FROM customers
WHERE City LIKE ('A%') OR City LIKE ('B%')
ORDER BY ContactName DESC;

#18.	Create a report that shows the first and last names and birth date of all employees born in the 1950s.
SELECT 
    FirstName, LastName, BirthDate
FROM
    employees
WHERE
    Birthdate LIKE ('195%');

#19.	Create a report that shows the product name and supplier id for all products supplied by Exotic Liquids, Grandma Kelly's Homestead, and Tokyo Traders.
# First approach is to seperately find the Suppliers ID Using the SELECT function as bellow. 
SELECT 
    *
FROM
    suppliers
WHERE
    CompanyName IN ('Exotic Liquids' , 'Tokyo Traders',
        'Grandma Kelly\'s Homestead');
#Once the IDs are determined, it can then be used for the query as seen bellow.
SELECT 
    ProductName, SupplierID
FROM
    products
WHERE
    SupplierID IN (1 , 3, 4);

#20.	Create a report that shows the shipping postal code, order id, and order date for all orders with a ship postal code beginning with "02389".
SELECT 
    ShipPostalCode, OrderID, OrderDate
FROM
    orders
WHERE
    ShipPostalCode LIKE ('02389%');

#21.	Create a report that shows the contact name and title and the company name for all customers whose contact title does not contain the word "Sales".
SELECT 
    ContactName, ContactTitle, CompanyName
FROM
    customers
WHERE
    ContactTitle NOT LIKE ('%Sales%');

#22.	Create a report that shows the first and last names and cities of employees from cities other than Seattle in the state of Washington.
SELECT 
    FirstName, LastName, City
FROM
    employees
WHERE
    City NOT IN ('Seattle');

#23.	Create a report that shows the company name, contact title, city and country of all customers in Mexico or in any city in Spain except Madrid.
SELECT 
    CompanyName, ContactTitle, City, Country
FROM
    customers
WHERE
    Country IN ('Mexico')
        OR (Country IN ('Spain')
        AND City NOT IN ('Madrid')); 

#24.	Write a SELECT statement that strings multiple columns with a common word.
SELECT 
    CONCAT(FirstName,
            ' ',
            LastName,
            ' can be reached at x',
            Extension) AS ContactInfo
FROM
    employees;

#25.	Create a report that shows the units in stock, unit price, the total price value of all units in stock, the total price value of all units in stock rounded down, and the total price value of all units in stock rounded up. Sort by the total price value descending.
SELECT 
    UnitsInStock,
    UnitPrice,
    ROUND(UnitsInStock * UnitPrice, 2) AS TotalPriceValue,
    FLOOR(UnitsInStock * UnitPrice) AS TotalPriceRoundedDown,
    CEIL(UnitsInStock * UnitPrice) AS TotalPriceRoundedUp
FROM
    products
ORDER BY TotalPriceValue DESC;

# 26.	Create a report that shows the first and last names and birth month (as a string) for each employee born in the current month.
SELECT 
    CONCAT(FirstName, ' ', LastName) AS FullName,
    DATE_FORMAT(BirthDate, '%M') AS Birth_Month
FROM
    employees
WHERE
    MONTH(BirthDate) = MONTH(CURRENT_DATE());
    
# 27.	Create a report that shows the contact title in all lowercase letters of each customer contact.
SELECT LOWER(ContactTitle) AS ContactTitleLowerCas FROM customers;

# 28.	Create a report that shows all products by name that are in the Seafood category.
SELECT 
    ProductName
FROM
    products
        LEFT JOIN
    categories ON products.CategoryID = categories.CategoryID
WHERE
    CategoryName IN ('seafood');

    
# 29.	Create a report that shows all companies by name that sell products in CategoryID 8.
SELECT 
    CompanyName
FROM
    suppliers
        LEFT JOIN
    products ON suppliers.SupplierID = products.SupplierID
WHERE
    CategoryID = 8;
    
#30.	Create a report that shows all companies by name that sell products in the Seafood category.
SELECT 
    CompanyName
FROM
    products
        LEFT JOIN
    suppliers ON products.SupplierID = suppliers.SupplierID
        LEFT JOIN
    categories ON categories.CategoryID = products.CategoryID
WHERE
    CategoryName IN ('seafood');
    
# 33.	Create a report that shows the order ids and the associated employee names for orders that shipped after the required date. It should return the following. There should be 37 rows returned.
SELECT 
    employees.EmployeeID,
    CONCAT(FirstName, ' ', LastName) AS EmployeeNames
FROM
    employees
        LEFT JOIN
    orders ON employees.EmployeeID = orders.EmployeeID
WHERE
    ShippedDate > RequiredDate;
    
#34.	Create a report that shows the total quantity of products (from the Order_Details table) ordered. Only show records for products for which the quantity ordered is fewer than 200.
SELECT 
    ProductName, Quantity
FROM
    products
        LEFT JOIN
    `order details` ON products.ProductID = `order details`.ProductID
GROUP BY ProductName
HAVING SUM(Quantity) < 200
ORDER BY Quantity DESC;

#35.	Create a report that shows the total number of orders by Customer since December 31, 1996. The report should only return rows for which the NumOrders is greater than 15
SELECT 
    CompanyName, COUNT(orders.OrderID) AS TotalOrders
FROM
    customers
        RIGHT JOIN
    orders ON customers.CustomerID = orders.CustomerID
WHERE
    OrderDate >= '1996-12-31'
GROUP BY customers.CustomerID , customers.CustomerName
HAVING TotalOrders > 15;

#36.	Create a report that shows the company name, order id, and total price of all products of which Northwind has sold more than $10,000 worth. 
SELECT 
    customers.CompanyName,
    Orders.OrderID,
    SUM(`Order Details`.UnitPrice * `Order Details`.Quantity) AS TotalPrice
FROM
    customers
        JOIN
    orders ON customers.CustomerID = orders.CustomerID
        JOIN
    `Order Details` ON orders.OrderID = `Order Details`.OrderID
GROUP BY customers.CompanyName , orders.OrderID
HAVING TotalPrice > 10000;
