-- =====================================================================
-- SQL Queries on E-Commerce Website
-- Extracted and organized from: SQL_Queries_on_Ecommerce_website.docx
-- Run these against the schema in schema/e_commerce_backup.sql
-- =====================================================================

USE e_commerce;

-- ---------------------------------------------------------------------
-- 1. DATABASE CREATION
-- ---------------------------------------------------------------------
CREATE DATABASE E_Commerce;

-- ---------------------------------------------------------------------
-- 2. TABLE WITH PRIMARY KEY
-- ---------------------------------------------------------------------
CREATE TABLE category (
    category_ID   INT PRIMARY KEY,
    category_name VARCHAR(40)
);

-- ---------------------------------------------------------------------
-- 3. TABLE WITH PRIMARY KEY + FOREIGN KEY + NOT NULL
-- ---------------------------------------------------------------------
CREATE TABLE product (
    product_ID     INT PRIMARY KEY,
    product_name   VARCHAR(40),
    product_price  FLOAT NOT NULL,   -- price and quantity must not be null
    stock_quantity INT NOT NULL,
    category_ID    INT,
    FOREIGN KEY (category_ID) REFERENCES category(category_ID)
);

-- ---------------------------------------------------------------------
-- 4. TABLE WITH PRIMARY KEY + FOREIGN KEY + DEFAULT VALUE
-- ---------------------------------------------------------------------
CREATE TABLE clothing (
    category_ID INT PRIMARY KEY,
    material    VARCHAR(40) DEFAULT 'not specified',
    gender      VARCHAR(10) NOT NULL,
    FOREIGN KEY (category_ID) REFERENCES category(category_ID)
);

-- ---------------------------------------------------------------------
-- 5. TABLE WITH PRIMARY KEY + UNIQUE + DEFAULT
-- ---------------------------------------------------------------------
CREATE TABLE useraccount (
    user_ID          INT PRIMARY KEY,
    userpassword     VARCHAR(40),
    username         VARCHAR(40),
    gender           VARCHAR(10),
    dateofbirth      DATE,
    phoneno          VARCHAR(15) DEFAULT '0',
    email            VARCHAR(50) UNIQUE,
    shippingaddress  VARCHAR(40),
    billingaddress   VARCHAR(40),
    totalorderplace  INT DEFAULT 0
);

-- ---------------------------------------------------------------------
-- 6. INSERTION WITH COLUMN NAMES
-- ---------------------------------------------------------------------
INSERT INTO category (category_ID, category_name)
VALUES
(1, 'Men Clothing'), (2, 'Women Clothing'), (3, 'Kids Clothing'),
(4, 'Mobile Phones'), (5, 'Laptops'), (6, 'Televisions'),
(7, 'Refrigerators'), (8, 'Washing Machines'), (9, 'Kitchen Electronics'),
(10, 'Frozen Food'), (11, 'Dairy Products'), (12, 'Bakery Items'),
(13, 'Fresh Vegetables'), (14, 'Fresh Fruits'), (15, 'Snacks'),
(16, 'Beverages'), (17, 'Footwear'), (18, 'Accessories'),
(19, 'Gaming Consoles'), (20, 'Smart Home Devices');

-- ---------------------------------------------------------------------
-- 7. INSERTION WITHOUT COLUMN NAMES
-- ---------------------------------------------------------------------
INSERT INTO useraccount
VALUES
(1, 'pass123', 'Ali Khan', 'Male', '1998-05-12', '03001234567', 'ali@gmail.com', 'Lahore', 'Lahore', 3),
(2, 'secure456', 'Ayesha Noor', 'Female', '2000-08-21', '03111234567', 'ayesha@gmail.com', 'Karachi', 'Karachi', 5),
(3, 'mypassword', 'Ahmed Raza', 'Male', '1997-03-18', '03221234567', 'ahmed@gmail.com', 'Islamabad', 'Islamabad', 2);

-- ---------------------------------------------------------------------
-- 8. ALTER TABLE - ADD COLUMN
-- ---------------------------------------------------------------------
ALTER TABLE product_order
ADD COLUMN productquantity INT;

-- ---------------------------------------------------------------------
-- 9. ALTER TABLE - RENAME COLUMN
-- ---------------------------------------------------------------------
ALTER TABLE orders
RENAME COLUMN product_quantity TO total_quantity;

-- ---------------------------------------------------------------------
-- 10. TRUNCATE TABLE
-- ---------------------------------------------------------------------
TRUNCATE TABLE review;

-- ---------------------------------------------------------------------
-- 11. DROP COLUMN
-- ---------------------------------------------------------------------
ALTER TABLE useraccount
DROP COLUMN billingaddress;

-- ---------------------------------------------------------------------
-- 12. SELECTION QUERY
-- ---------------------------------------------------------------------
SELECT * FROM orders;

-- ---------------------------------------------------------------------
-- 13. PROJECTION QUERY
-- ---------------------------------------------------------------------
SELECT product_name
FROM product
WHERE product_price > 5000;

-- ---------------------------------------------------------------------
-- 14. LOGICAL OPERATOR QUERY
-- ---------------------------------------------------------------------
SELECT user_ID, username
FROM useraccount
WHERE gender = 'Female' AND totalorderplace = 1;

-- ---------------------------------------------------------------------
-- 15. UPDATE QUERY
-- ---------------------------------------------------------------------
UPDATE product
SET stock_quantity = 10
WHERE product_ID = 104;

SELECT * FROM product;

-- ---------------------------------------------------------------------
-- 16. DELETE A ROW
-- ---------------------------------------------------------------------
DELETE FROM review
WHERE review_ID = 3;

-- ---------------------------------------------------------------------
-- 17. BETWEEN QUERY
-- ---------------------------------------------------------------------
SELECT order_ID, user_ID, total_amount
FROM orders
WHERE total_amount BETWEEN 1000 AND 3000;

-- ---------------------------------------------------------------------
-- 18. COUNT QUERY
-- ---------------------------------------------------------------------
SELECT COUNT(product_price) AS 'above 10000'
FROM product
WHERE product_price > 10000;

-- ---------------------------------------------------------------------
-- 19. AVERAGE QUERY
-- ---------------------------------------------------------------------
SELECT AVG(product_price)
FROM product;

-- ---------------------------------------------------------------------
-- 20. LIKE QUERY (products whose name starts with 'F')
-- ---------------------------------------------------------------------
SELECT product_name
FROM product
WHERE product_name LIKE 'F%';

-- ---------------------------------------------------------------------
-- 21. MIN / MAX QUERY
-- ---------------------------------------------------------------------
SELECT MIN(product_price) AS 'MIN PRODUCT PRICE',
       MAX(product_price) AS 'MAX PRODUCT PRICE'
FROM product;

-- ---------------------------------------------------------------------
-- 22. DISTINCT QUERY
-- ---------------------------------------------------------------------
SELECT DISTINCT product_name, stock_quantity
FROM product;

-- ---------------------------------------------------------------------
-- 23. STRING CONCATENATION
-- ---------------------------------------------------------------------
SELECT CONCAT(product_name, ' price is = ', product_price) AS 'product details'
FROM product;

-- ---------------------------------------------------------------------
-- 24. IN OPERATOR
-- ---------------------------------------------------------------------
SELECT * FROM brand
WHERE location IN ('USA', 'Germany');

-- ---------------------------------------------------------------------
-- 25. ORDER BY
-- ---------------------------------------------------------------------
SELECT * FROM electronics
ORDER BY warrenty DESC;

-- ---------------------------------------------------------------------
-- 26. LIMIT / OFFSET
-- ---------------------------------------------------------------------
SELECT * FROM useraccount
ORDER BY totalorderplace
LIMIT 9 OFFSET 1;

-- ---------------------------------------------------------------------
-- 27. UPPER / LOWER
-- ---------------------------------------------------------------------
SELECT UPPER(username), LOWER(shippingaddress)
FROM useraccount
LIMIT 5 OFFSET 0;

-- ---------------------------------------------------------------------
-- 28. SUBSTRING
-- ---------------------------------------------------------------------
SELECT SUBSTR(username, 1, 3)
FROM useraccount;

-- ---------------------------------------------------------------------
-- 29. GROUP BY
-- ---------------------------------------------------------------------
SELECT gender, COUNT(*) AS totalusers
FROM useraccount
GROUP BY gender;

-- ---------------------------------------------------------------------
-- 30. LPAD
-- ---------------------------------------------------------------------
SELECT LPAD(stock_quantity, 4, 0)
FROM product;

-- ---------------------------------------------------------------------
-- 31. INSTR
-- ---------------------------------------------------------------------
SELECT product_name, INSTR(LOWER(product_name), 'a') AS positionofa
FROM product;
