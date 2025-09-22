-- Lab Experiment 05: To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Abhay M Biju
-- USN: 1RUA24BCA0001
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Write your code below this line along with the output 
drop database market;
create database market;

use market;

-- table 01: Customers
-- CREATE  a TABLE named Customers (customer_id INT PRIMARY KEY,customer_name VARCHAR(50),city VARCHAR(50)

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- insert 5 records
INSERT INTO Customers (customer_id, customer_name, city)
VALUES 
    (1, 'John Doe', 'Bangalore'),
    (2, 'Jane Smith', 'Chennai'),
    (3, 'Alice Brown', 'Bangalore'),
    (4, 'Bob White', 'Hyderabad'),
    (5, 'Charlie Green', 'Bangalore');

-- TABLE:02 Orders Table

-- CREATE a TABLE named Orders (order_id INT PRIMARY KEY,customer_id INT foreign key,product_name VARCHAR(50),order_date DATE,

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
    -- insert 5 records

INSERT INTO Orders (order_id, customer_id, product_name, order_date)
VALUES 
    (101, 1, 'Laptop', '2025-09-01'),
    (102, 1, 'Smartphone', '2025-09-05'),
    (103, 2, 'Headphones', '2025-09-10'),
    (104, 3, 'Smartwatch', '2025-09-15'),
    (105, 5, 'Tablet', '2025-09-20');
-- TASK FOR STUDENTS 

 
-- Write and Execute Queries
/*
1. Inner Join – 
   -- 1. Find all orders placed by customers from the city "Bangalore"
SELECT Customers.customer_name, Orders.product_name, Orders.order_date
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
WHERE Customers.city = 'Bangalore';

-- 2. List all customers with the products they ordered
SELECT Customers.customer_name, Orders.product_name
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 3. Show customer names and their order dates
SELECT Customers.customer_name, Orders.order_date
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 4. Display order IDs with the corresponding customer names
SELECT Orders.order_id, Customers.customer_name
FROM Orders
INNER JOIN Customers ON Orders.customer_id = Customers.customer_id;

-- 5. Find the number of orders placed by each customer
SELECT Customers.customer_name, COUNT(Orders.order_id) AS num_orders
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_name;

-- 6. Show city names along with the products ordered by customers
SELECT Customers.city, Orders.product_name
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;

*/


/* 
2  Left Outer Join – 
    -- 1. Find all customers and their orders, even if a customer has no orders
SELECT Customers.customer_name, Orders.product_name
FROM Customers
LEFT OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 2. List all customers and the products they ordered
SELECT Customers.customer_name, Orders.product_name
FROM Customers
LEFT OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 3. Show customer IDs, names, and their order IDs
SELECT Customers.customer_id, Customers.customer_name, Orders.order_id
FROM Customers
LEFT OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 4. Find the total number of orders (if any) placed by each customer
SELECT Customers.customer_name, COUNT(Orders.order_id) AS total_orders
FROM Customers
LEFT OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_name;

-- 5. Retrieve customers who have not placed any orders
SELECT Customers.customer_name
FROM Customers
LEFT OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id
WHERE Orders.order_id IS NULL;

-- 6. Display customer names with their order dates
SELECT Customers.customer_name, Orders.order_date
FROM Customers
LEFT OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- Write your code below this line along with the output 
*/
 
/* 3: Right Outer Join – 
     -- 1. Find all orders and their corresponding customers, even if an order doesn't have a customer associated with it
SELECT Orders.order_id, Orders.product_name, Customers.customer_name
FROM Orders
RIGHT OUTER JOIN Customers ON Orders.customer_id = Customers.customer_id;

-- 2. Show all orders with the customer names
SELECT Orders.order_id, Orders.product_name, Customers.customer_name
FROM Orders
RIGHT OUTER JOIN Customers ON Orders.customer_id = Customers.customer_id;

-- 3. Display product names with the customers who ordered them
SELECT Orders.product_name, Customers.customer_name
FROM Orders
RIGHT OUTER JOIN Customers ON Orders.customer_id = Customers.customer_id;

-- 4. List order IDs with customer cities
SELECT Orders.order_id, Customers.city
FROM Orders
RIGHT OUTER JOIN Customers ON Orders.customer_id = Customers.customer_id;

-- 5. Find the number of orders per customer (include those without orders)
SELECT Customers.customer_name, COUNT(Orders.order_id) AS order_count
FROM Orders
RIGHT OUTER JOIN Customers ON Orders.customer_id = Customers.customer_id
GROUP BY Customers.customer_name;

-- 6. Retrieve customers who do not have any matching orders
SELECT Customers.customer_name
FROM Orders
RIGHT OUTER JOIN Customers ON Orders.customer_id = Customers.customer_id
WHERE Orders.order_id IS NULL;

     Write your code below this line along with the output 
 */

/* 4: Full Outer Join – 
        -- 1. Find all customers and their orders, including those customers with no orders and orders without a customer
SELECT Customers.customer_name, Orders.product_name
FROM Customers
FULL OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 2. List all customers and products, whether they placed an order or not
SELECT Customers.customer_name, Orders.product_name
FROM Customers
FULL OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 3. Show customer IDs with order IDs (include unmatched ones)
SELECT Customers.customer_id, Orders.order_id
FROM Customers
FULL OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 4. Display customer names with order dates
SELECT Customers.customer_name, Orders.order_date
FROM Customers
FULL OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 5. Find all unmatched records (customers without orders and orders without customers)
SELECT Customers.customer_name, Orders.product_name
FROM Customers
FULL OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id
WHERE Customers.customer_name IS NULL OR Orders.product_name IS NULL;

-- 6. Show customer cities with products
SELECT Customers.city, Orders.product_name
FROM Customers
FULL OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id;

     Write your code below this line along with the output 
  */   
  /* 5: Natural Join – 
          -- 1. Find all orders placed by customers
SELECT * 
FROM Customers
NATURAL JOIN Orders;

-- 2. List all customers with the products they ordered using NATURAL JOIN
SELECT Customers.customer_name, Orders.product_name
FROM Customers
NATURAL JOIN Orders;

-- 3. Show customer names along with their order dates using NATURAL JOIN
SELECT Customers.customer_name, Orders.order_date
FROM Customers
NATURAL JOIN Orders;

-- 4. Find all customer cities and the products ordered by those customers using NATURAL JOIN
SELECT Customers.city, Orders.product_name
FROM Customers
NATURAL JOIN Orders;


     Write your code below this line along with the output 
  /*
  -- END OF THE EXPERIMENT
