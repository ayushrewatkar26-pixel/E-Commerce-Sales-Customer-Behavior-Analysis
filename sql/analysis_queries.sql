# total sales
SELECT SUM(payment_value) AS total_sales
FROM order_payments;

#  monthaly sales trend
SELECT DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
       SUM(p.payment_value) AS monthly_sales
FROM orders_dataset o
JOIN order_payments p ON o.order_id = p.order_id
GROUP BY month
ORDER BY month;

#Top 10 Products by Revenue
SELECT 
    i.product_id,
    c.category_english,
    SUM(p.payment_value) AS revenue
FROM order_item i
JOIN order_payments p 
    ON i.order_id = p.order_id
JOIN product_category_mapping c 
    ON i.product_id = c.product_id
GROUP BY 
    i.product_id,
    c.category_english
ORDER BY 
    revenue DESC
LIMIT 10;

#Top Categories by Revenue
SELECT 
    c.category_name_english AS category,
    SUM(p.payment_value) AS revenue
FROM order_item i
JOIN products_dataset pr ON i.product_id = pr.product_id
JOIN category_name c ON pr.product_category_name = c.category_name
JOIN order_payments p ON i.order_id = p.order_id
GROUP BY category
ORDER BY revenue DESC;

#Customer-level RFM Preparation
CREATE TABLE rfm_mysql AS
SELECT
    o.customer_id,
    MAX(o.order_purchase_timestamp) AS last_purchase_date,
    COUNT(o.order_id) AS frequency,
    SUM(p.payment_value) AS monetary
FROM orders_dataset o
JOIN order_payments p ON o.order_id = p.order_id
GROUP BY o.customer_id
order by frequency desc;

#Average Delivery Time
SELECT 
    order_id,
    DATEDIFF(order_delivered_customer_date, order_purchase_timestamp) AS delivery_days
FROM orders_dataset
WHERE order_delivered_customer_date IS NOT NULL;

#Payment Method Distribution
SELECT payment_type,
       COUNT(*) AS count,
       SUM(payment_value) AS revenue
FROM order_payments
GROUP BY payment_type
ORDER BY revenue DESC;

#Review Score Distribution
SELECT review_score, COUNT(*) AS total_reviews
FROM order_reviews
GROUP BY review_score
ORDER BY review_score DESC;

#avg review by category
select c.category_name_english, avg(r.review_score) as avg_review
from order_reviews r
join order_item i on r.order_id = i.order_id
join products_dataset d on i.product_id = d.product_id
join category_name c on d.product_category_name = c.category_name
group by c.category_name_english
order by avg_review desc;

#Delivery Delay Impact on Reviews
SELECT 
    r.review_score,
    DATEDIFF(o.order_delivered_customer_date, o.order_estimated_delivery_date) AS delay
FROM order_reviews r
JOIN orders_dataset o ON r.order_id = o.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
order by delay desc;

#Seller Performance: Top Sellers by Revenue
SELECT 
    i.seller_id,
    SUM(p.payment_value) AS revenue
FROM order_item i
JOIN order_payments p ON i.order_id = p.order_id
GROUP BY i.seller_id
ORDER BY revenue DESC
LIMIT 10;