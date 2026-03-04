1. Overall Performance

SELECT
ROUND(SUM(sales),2) AS total_sales,
ROUND(SUM(profit),2) AS total_profit,
ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales),0), 2) AS profit_margin_pct
FROM superstore_orders;

2. Regional Performance

SELECT
region,
ROUND(SUM(sales),2) AS sales,
ROUND(SUM(profit),2) AS profit,
ROUND(100.0 * SUM(profit) / SUM(sales),2) AS margin
FROM superstore_orders
GROUP BY region;
ORDER BY sales DESC;

3. Category Performance

SELECT
category,
ROUND(SUM(sales),2) AS sales,
ROUND(SUM(profit),2) AS profit,
ROUND(100.0 * SUM(profit) / SUM(sales),2) AS margin
FROM superstore_orders
GROUP BY category;
ORDER BY sales DESC;

4. Top 5 and Bottom 5 Products by Profit

Top 5 most profitable products

SELECT product_name,
       ROUND(SUM(sales),2) AS sales,
       ROUND(SUM(profit),2) AS profit
FROM superstore_orders
GROUP BY product_name
ORDER BY profit desc
LIMIT 5;

Bottom 5 least profitable products

SELECT product_name,
       ROUND(SUM(sales),2) AS sales,
       ROUND(SUM(profit),2) AS profit
FROM superstore_orders
GROUP BY product_name
ORDER BY profit ASC
LIMIT 5;

5. Discount Impact

Profit grouped by discount level
SELECT
  CASE
    WHEN discount = 0 THEN '0%'
    WHEN discount > 0 AND discount <= 0.1 THEN '0.01-10%'
    WHEN discount > 0.1 AND discount <= 0.25 THEN '10.01-25%'
    WHEN discount > 0.25 AND discount <= 0.5 THEN '25.01-50%'
    ELSE '>50%'
  END AS discount_bucket,
  ROUND(SUM(sales),2) AS sales,
  ROUND(SUM(profit),2) AS profit,
  ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales),0),2) AS margin_pct,
  COUNT(*) AS line_items
FROM superstore_orders
GROUP BY discount_bucket
ORDER BY discount_bucket;

Products that got positively affected by discount  

SELECT
  product_name,
  ROUND(AVG(discount)::numeric, 2) AS avg_discount,
  ROUND(SUM(sales),2) AS sales,
  ROUND(SUM(profit),2) AS profit,
  ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales),0),2) AS margin_pct,
  COUNT(*) AS line_items
FROM superstore_orders
GROUP BY product_name
HAVING COUNT(*) >= 2   
ORDER BY avg_discount DESC
LIMIT 20;

Products that negatively got affected by discount

SELECT
  product_name,
  ROUND(AVG(discount)::numeric,2) AS avg_discount,
  ROUND(SUM(sales),2) AS sales,
  ROUND(SUM(profit),2) AS profit,
  ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales),0),2) AS margin_pct
FROM superstore_orders
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY avg_discount DESC, profit ASC
LIMIT 20;



