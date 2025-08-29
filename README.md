# Cosmetic_Sales_Data
## Project Objectives
The goal of this project is to analyze a mock cosmetics sales dataset to uncover trends in revenue, product pricing, and salesperson performance. Using SQL, I created queries to answer key business questions, such as identifying top performers, calculating average unit prices, and measuring product revenue across time periods. The dataset was cleaned and structured into a new table **clean_cosmetics_data** to ensure accuracy, and a reference table **product_details** was introduced to enable joins and more advanced analysis. This project shows skills in data cleaning, SQL aggregation, subqueries, common table expressions **CTEs**, and joins. 

## Dataset Used
<a target="_blank" href="https://www.kaggle.com/datasets/atharvasoundankar/cosmetics-and-skincare-product-sales-data-2022">Cosmetic Sales Dataset</a>

## Key Questions (KPIs)
- Question 1: Who are the **top 5 salespeople** with the **highest revenue**?
- Question 2: On **average**, which product performed the best?
- Question 3: Which product produced the **highest total cost** for **August**?
- Question 4: Who are the **top 3 salespeople** whose **total revenue** is **above the dataset’s average**?
- Question 5: What is the **average unit price** of each product based on the revenue data?
  
### Dataset Additions 
- Implemented a trigger to calculate **10% off** of the product price in the reference table.
- Created an event to **flag/auto-remove** underperforming salespeople from the table as part of performance monitoring.

## Process
- Cleaned the raw sales dataset by creating a new table **clean_cosmetics_data** for standardized analysis.
- Added a **Product_ID** column to the cleaned table and created a reference table **product_details** to hold product names and unit prices.
- Used **INNER JOIN** queries to connect sales records with product details for deeper analysis.
- Wrote SQL queries to answer key business questions. 
- Implemented an SQL **trigger to apply discounts** and a scheduled **event** to automatically **remove underperforming salespeople.**
- Demonstrated skills in SQL **cleaning, aggregation, subqueries, CTEs, joins**, and automation with **triggers/events.**

## Insights
- The **top 5 salespeople** brought in **most of the revenue compared to others**, showing a clear concentration of performance. This insight could be used in shaping sales strategies.
- The **body butter cream** is the product that had the **highest profitablity** due to the total revenue. The company could leverage this information, and the salespeople could focus on marketing this product.
- The **Vitamin C** Cream had the **highest total cost for August**, which could point to it being more seasonal. The company can plan around this by focusing promotions or inventory during that time.
- The **top 3 salespeople** generated significantly more revenue than the **overall average**, showing a strong concentration of sales performance. The company could utilize this information to train employees or to demonstrate employee metrics.
- Looking at the **average unit price** across products helps show the **price differences.** This info could be used to check consistency and potentially adjust prices to boost profits.

## Conclusion
Overall, this project provided further insight into how the company’s sales are distributed across products and salespeople. According to the data, a few salespeople are generating the majority of the revenue. This suggests that the company should potentially focus on training others or brainstorming strategies to increase overall profits. Products like Body Butter Cream and Vitamin C Cream are highlighted in the analysis, one because it’s consistently profitable, and the other because it seems to peak in August. These kinds of insights could help the company with sales strategies, seasonal planning, and even pricing decisions.
