-- BUSINESS KPIs
-- WHO ARE THE TOP 5 SALES PEOPLE WHO HAVE THE HIGHEST REVENUE 
SELECT `Sales Person`, SUM(`Amount ($)`) AS Amount_Total
FROM clean_cosmetics_data 
GROUP BY `Sales Person`
ORDER BY Amount_Total DESC
LIMIT 5;

-- ON AVERAGE WHICH PRODUCT PERFORMED THE BEST 
SELECT 
  Product, 
  AVG(`Amount ($)`) AS Avg_Revenue_Per_Sale
FROM clean_cosmetics_data 
GROUP BY Product
ORDER BY Avg_Revenue_Per_Sale DESC
LIMIT 1;

-- WH
SELECT 
    c.Product,
    p.Cost_Price AS Reference_Price,  
    SUM(c.`Amount ($)`) AS August_Total_Revenue
FROM clean_cosmetics_data c
JOIN product_details p
    ON c.Product_ID = p.Product_ID
WHERE MONTH(c.`Date`) = 8
GROUP BY c.Product,  p.Cost_Price
ORDER BY August_Total_Revenue DESC;

/* WHO ARE THE TOP 3 SALESPEOPLE WHO'S TOTAL REVENUE IS ABOVE THE 
DATA'S AVG */
SELECT `Sales Person`, SUM(`Amount ($)`) AS Total_Amount
FROM clean_cosmetics_data
GROUP BY `Sales Person`
HAVING SUM(`Amount ($)`) > (SELECT AVG(`Amount ($)`)
FROM clean_cosmetics_data)
ORDER BY Total_Amount DESC
LIMIT 3;

-- WHAT IS THE AVERAGE UNIT PRICE OF EACH PRODUCT BASED ON REVENUE DATA
WITH UnitPriceCTE AS (
    SELECT
        Product,
        (`Amount ($)` / `Boxes Shipped`) AS Unit_Price
    FROM clean_cosmetics_data
    WHERE `Boxes Shipped` > 0
)
SELECT
    Product,
    AVG(Unit_Price) AS Avg_Unit_Price,
    COUNT(*) AS Num_Transactions
FROM UnitPriceCTE
GROUP BY Product
ORDER BY Avg_Unit_Price DESC;

-- 10% DISCOUNT APPLIED ON ALL PRODUCTS
ALTER TABLE product_details 
ADD COLUMN Sale_Price DECIMAL(10,2);

DELIMITER $$

CREATE TRIGGER set_discounted_price
BEFORE INSERT ON product_details
FOR EACH ROW
BEGIN
    IF NEW.Cost_Price IS NOT NULL THEN
        SET NEW.Discounted_Price = NEW.Cost_Price * 0.9;
    END IF;
END $$

DELIMITER ;

-- CREATING EVENT TO AUTO REMOVE THE LOWEST PERFORMER MONTHLY
DELIMITER $$
CREATE EVENT delete_underpeformer
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN 
	SELECT `Sales Person`, SUM(`Amount ($)`)
    FROM clean_cosmetics_data
    GROUP BY `Sales Person`
    ORDER BY SUM(`Amount ($)`) ASC
    LIMIT 1;
END $$
DELIMITER ;
    