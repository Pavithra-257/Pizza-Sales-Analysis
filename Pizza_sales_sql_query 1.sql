SELECT * FROM pizza_sales;

SELECT COUNT(*) FROM pizza_sales;

-- TOTAL REVENUE
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

-- AVERAGE ORDER VALUE
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_order_value FROM pizza_sales;

-- TOTAL PIZZAS SOLD
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;

-- TOTAL ORDERS
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

-- AVERAGE PIZZAS PER ORDER
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_per_order
FROM pizza_sales;

-- DAILY TREND FOR TOTAL ORDERS
SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DAYNAME(order_date), WEEKDAY(order_date)
ORDER BY WEEKDAY(order_date);

-- MONTHLY TREND FOR ORDERS
SELECT MONTHNAME(order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY MONTH(order_date);

-- % OF SALES BY PIZZA CATEGORY
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS Percentage
FROM pizza_sales
GROUP BY pizza_category;

-- % OF SALES BY PIZZA SIZE
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS Percentage
FROM pizza_sales
GROUP BY pizza_size;

-- TOTAL PIZZAS SOLD BY PIZZA CATEGORY
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- TOP 5 PIZZAS BY REVENUE
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- BOTTOM 5 PIZZAS BY REVENUE
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;

-- TOP 5 PIZZAS BY QUANTITY
SELECT pizza_name, SUM(quantity) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity DESC
LIMIT 5;

-- BOTTOM 5 PIZZAS BY QUANTITY
SELECT pizza_name, SUM(quantity) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity ASC
LIMIT 5;

-- TOP 5 PIZZAS BY TOTAL ORDERS
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

-- BOTTOM 5 PIZZAS BY TOTAL ORDERS
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;