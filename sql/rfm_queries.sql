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
