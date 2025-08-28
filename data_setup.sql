-- Duplicating Table 
CREATE TABLE 
clean_cosmetics_data LIKE cosmetics_sales_data;

SELECT * 
FROM cosmetics_sales_data;

-- Inserting Data
INSERT clean_cosmetics_data

SELECT * 
FROM cosmetics_sales_data;

-- Created a secondary reference table 

CREATE TABLE product_details
(
	Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Cost_Price DECIMAL(10,2)
);

INSERT INTO product_details (Product_ID, Product_Name, Cost_Price)
VALUES (24, "Aloe Vera Gel", 12.99);

INSERT INTO product_details (Product_ID, Product_Name, Cost_Price)
VALUES (20, "Body Butter Cream", 14.99);

INSERT INTO product_details (Product_ID, Product_Name, Cost_Price)
VALUES (15, "Salicylic Acid Cleanser", 10.99);

INSERT INTO product_details (Product_ID, Product_Name, Cost_Price)
VALUES (3, "Lip Balm Pack", 5.99);

INSERT INTO product_details (Product_ID, Product_Name, Cost_Price)
VALUES (6, "Rose Water Toner", 11.99);

INSERT INTO product_details (Product_ID, Product_Name, Cost_Price)
VALUES (9, "Tea Tree Moisturizer", 16.99);

INSERT INTO product_details (Product_ID, Product_Name, Cost_Price)
VALUES (12, "Face Sheet Masks", 13.99);

INSERT INTO product_details (Product_ID, Product_Name, Cost_Price)
VALUES (2, "Hair Repair Oil", 9.99);

INSERT INTO product_details (Product_ID, Product_Name, Cost_Price)
VALUES (21, "Niacinamide Toner", 12.99);

INSERT INTO product_details (Product_ID, Product_Name, Cost_Price)
VALUES (25, "Under Eye Cream", 10.99);

INSERT INTO product_details (Product_ID, Product_Name, Cost_Price)
VALUES (29, "Hydrating Face Serum", 7.99);

INSERT INTO product_details (Product_ID, Product_Name, Cost_Price)
VALUES (30, "Charcoal Face Wash", 9.99);

INSERT INTO product_details (Product_ID, Product_Name, Cost_Price)
VALUES (31, "Anti-Aging Serum", 15.99);

INSERT INTO product_details (Product_ID, Product_Name, Cost_Price)
VALUES (32, "SPF 50 Sunscreen", 8.99);

INSERT INTO product_details (Product_ID, Product_Name, Cost_Price)
VALUES (33, "Vitamin C Cream", 6.99);

-- Added an ID to cleaned data table
ALTER TABLE clean_cosmetics_data ADD COLUMN Product_ID INT;

UPDATE clean_cosmetics_data c
JOIN product_details p
  ON c.Product = p.Product_Name   
SET c.Product_ID = p.Product_ID;