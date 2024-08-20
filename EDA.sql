--- Total Revenue
SELECT SUM(sales_amount) AS total_revenue
FROM transactions;

--- Total Orders Placed
SELECT COUNT(*) AS total_orders_placed
FROM transactions;

--- Total Items Sold
SELECT SUM(sales_qty) AS total_items_sold
FROM transactions;

--- Total Profit
SELECT SUM(profit_margin) AS total_profit
FROM transactions;

--- Gross Profit Margin
SELECT (
(SELECT SUM(profit_margin) AS total_profit
FROM transactions) / (SELECT SUM(sales_amount) AS total_revenue
FROM transactions) * 100
) AS gross_profit_margin;

--- Revenue by Markets
SELECT markets.markets_name, SUM(transactions.sales_amount) AS total_sales
FROM transactions 
INNER JOIN markets
ON transactions.market_code = markets.markets_code
GROUP BY markets_name
ORDER BY SUM(transactions.sales_amount) DESC;

--- Sales Qty by Markets
SELECT markets.markets_name, SUM(transactions.sales_qty) AS total_qty_sold
FROM transactions 
INNER JOIN markets
ON transactions.market_code = markets.markets_code
GROUP BY markets_name
ORDER BY SUM(transactions.sales_qty) DESC;

--- Top 5 Products
SELECT product_code, SUM(sales_amount) AS total_sales
FROM transactions
GROUP BY product_code
ORDER BY SUM(sales_amount) DESC
LIMIT 5;

--- Top 5 Customers
SELECT customers.custmer_name, SUM(transactions.sales_amount) AS total_sales
FROM customers 
INNER JOIN transactions
ON customers.customer_code = transactions.customer_code
GROUP BY customers.custmer_name
ORDER BY SUM(transactions.sales_amount) DESC
LIMIT 5;

--- Revenue by Each Year
SELECT date.year, SUM(transactions.sales_amount) AS total_sales
FROM date
INNER JOIN transactions
ON date.date = transactions.order_date
GROUP BY date.year
ORDER BY date.year;

--- Revenue by month/year
SELECT LEFT(date.cy_date, 7) AS yy_mm, SUM(transactions.sales_amount) AS total_sales
FROM date
INNER JOIN transactions
ON date.date = transactions.order_date
GROUP BY 1
ORDER BY 1;