create database superstore;
use superstore;

# 1st QUES_ANSWER
SELECT 
Customer_Name AS 'Customer Name',
Customer_segment AS 'Customer Segment'
FROM cust_dimen;

# 2nd QUES_ANSWER
SELECT * 
FROM cust_dimen
ORDER BY Customer_Name DESC;


# 3rd QUES_ANSWER
SELECT 
Order_ID,
Order_Date,
Order_Priority
FROM orders_dimen
WHERE Order_Priority = 'HIGH';

SELECT 
Order_ID,
Order_Date
FROM orders_dimen
WHERE Order_Priority LIKE 'HIGH';

# 4th QUES_ANSWER
SELECT 
sum(Sales) AS total_sales,
avg(Sales) AS avg_sales
FROM market_fact;

# 5th QUES_ANSWER
SELECT
max(Sales),
min(Sales) 
FROM market_fact;

# 6th QUES_ANSWER
SELECT 
Region,
count(Cust_id) AS "No of Customers"
FROM cust_dimen 
GROUP BY Region
ORDER BY count(Cust_id);

# 7th QUES_ANSWER
SELECT 
Region,
count(Cust_id) AS " Max No of Customers"
FROM cust_dimen
GROUP BY Region
ORDER BY count(Cust_id) DESC;

# 8th QUES_ANSWER
SELECT
c.Customer_Name,
c.Region,
p.Product_Sub_Category,
sum(m.Order_Quantity) 
FROM market_fact m
join cust_dimen c
	ON m.Cust_id = c.Cust_id
join prod_dimen p
	ON m.Prod_id = p.Prod_id	
WHERE c.Region LIKE 'ATLANTIC' AND p.Product_Sub_Category = 'TABLES'
GROUP BY c.Customer_name
ORDER BY sum(m.Order_Quantity) DESC;

# 9th QUES_ANSWER
SELECT 
Customer_Name,
count(Customer_Name) AS 'No of small business owners'
FROM cust_dimen
WHERE Province LIKE 'ONTARIO' AND  Customer_segment LIKE 'SMALL BUSINESS'
GROUP BY Customer_Name;

# 10th QUES_ANSWER
SELECT 
p.Prod_id,
count(p.Prod_id) AS 'No_of_products sold'
FROM prod_dimen p
JOIN market_fact m
	ON p.Prod_id = m.Prod_id
GROUP BY Prod_id
ORDER BY m.Sales DESC;
#11 10th QUES_ANSWER   

select Prod_id, count(prod_id)as "No. of of product sold"
from market_fact
group by prod_id
order by sales desc;

#11th QUES_ANSWER
  
  select  p.product_category, SUM(m.profit) AS profits
	FROM
    market_fact m
	INNER JOIN
    prod_dimen p ON m.prod_id = p.prod_id
	GROUP BY p.product_category
	ORDER BY profits DESC;
    
#11th QUES_ANS

  select  p.product_category, p.product_sub_category, SUM(m.profit) AS profits
	FROM
    market_fact m
	INNER JOIN
    prod_dimen p ON m.prod_id = p.prod_id
	GROUP BY p.product_category, p.product_sub_category;

#14th QUES_ANSWER
select a.order_date, b.order_quantity ,b.sales from orders_dimen 
a INNER JOIN market_fact b ON a.ord_id=b.ord_id;

#15th QUES_ANSWER
SELECT customer_name FROM cust_dimen WHERE customer_name LIKE '_r_d%';

#16th QUES_ANSWER
SELECT  b.cust_id,b.customer_name,b.region,a.sales 
FROM cust_dimen b
INNER JOIN market_fact a 
WHERE b.cust_id=a.cust_id 
AND a.sales BETWEEN 1000 AND 5000;

#17th QUES_ANSWER

SELECT sales 
FROM market_fact 
ORDER BY sales DESC 
LIMIT 2, 1;

#18th QUES_ANSWER

 SELECT 
    c.region, COUNT(distinct s.ship_id) AS no_of_shipments, SUM(m.profit) AS profit_in_each_region
	FROM
    market_fact m
	INNER JOIN
    cust_dimen c ON m.cust_id = c.cust_id
	INNER JOIN
    shipping_dimen s ON m.ship_id = s.ship_id
	INNER JOIN
    prod_dimen p ON m.prod_id = p.prod_id
	WHERE
    p.product_sub_category IN (	SELECT 	p.product_sub_category FROM market_fact m INNER JOIN prod_dimen p ON m.prod_id = p.prod_id GROUP BY p.product_sub_category HAVING SUM(m.profit) <= ALL
	(	SELECT 
		SUM(m.profit) AS profits
		FROM
		market_fact m
		INNER JOIN
		prod_dimen p ON m.prod_id = p.prod_id
		GROUP BY p.product_sub_category
	)
	)
	GROUP BY c.region
	ORDER BY profit_in_each_region DESC;







 