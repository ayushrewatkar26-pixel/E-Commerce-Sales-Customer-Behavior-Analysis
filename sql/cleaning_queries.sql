SELECT order_id, count(order_id) AS cnt 
FROM orders_dataset
GROUP BY order_id
HAVING cnt > 1
order by cnt asc;

DELETE t1 FROM orders_dataset t1
JOIN (
    SELECT order_id,
           ROW_NUMBER() OVER(PARTITION BY order_id ORDER BY order_purchase_timestamp) AS rn
    FROM orders_dataset
) t2 
ON t1.order_id = t2.order_id
WHERE t2.rn > 1; 
SET SQL_SAFE_UPDATES = 0;

UPDATE products_dataset
SET product_category_name = 'unknown'
WHERE product_category_name IS NULL OR product_category_name = '';

CREATE TABLE product_category_mapping AS
SELECT p.product_id,
       c.category_name_english AS category_english
FROM products_dataset p
LEFT JOIN category_name c
    ON p.product_category_name = c.category_name;