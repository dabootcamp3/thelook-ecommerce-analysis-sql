SELECT
  status, # non-agregat
  -- gender,
  COUNT(*) jumlah_order, # agregat
  SUM(num_of_item) jumlah_item
FROM bigquery-public-data.thelook_ecommerce.orders
WHERE created_at BETWEEN '2024-01-01' AND '2025-01-01'
GROUP BY 1
HAVING SUM(num_of_item) > 5000 OR COUNT(*) > 2000
ORDER BY 2 DESC;

-- Top 10 products by order count
SELECT
  product_id,
  COUNT(*) AS item_rows
FROM `bigquery-public-data.thelook_ecommerce.order_items`
GROUP BY 1
ORDER BY item_rows DESC
LIMIT 10;


-- Jumlah user
SELECT COUNT(*)
FROM bigquery-public-data.thelook_ecommerce.users;

-- Jumlah User per negara
SELECT country, COUNT(*) jumlah_user
FROM bigquery-public-data.thelook_ecommerce.users
GROUP BY 1
ORDER BY 2 DESC;


SELECT
  status,
  COUNT(*) AS total_items,
  COUNT(DISTINCT order_id) AS total_orders,
  ROUND(SUM(sale_price), 2) AS total_sales,
  ROUND(AVG(sale_price), 2) AS avg_sale_price
FROM bigquery-public-data.thelook_ecommerce.order_items
GROUP BY 1
ORDER BY 2 DESC;

SELECT COUNT(DISTINCT user_id) jumlah_user
FROM bigquery-public-data.thelook_ecommerce.orders;

SELECT SUM(sale_price) AS total_item_sales
FROM `bigquery-public-data.thelook_ecommerce.order_items`;

SELECT
    category,
    COUNT(*) AS total_products,
    ROUND(AVG(retail_price), 2) AS avg_retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY category
ORDER BY avg_retail_price DESC;


