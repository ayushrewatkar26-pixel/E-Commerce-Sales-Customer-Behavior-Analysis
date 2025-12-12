CREATE TABLE full_orders AS
SELECT 
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    i.product_id,
    i.seller_id,
    i.price,
    i.freight_value,
    p.payment_type,
    p.payment_value,
    pd.product_category_name,
    c.category_name_english,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date
FROM orders_dataset o
LEFT JOIN order_item i ON o.order_id = i.order_id
LEFT JOIN order_payments p ON o.order_id = p.order_id
LEFT JOIN products_dataset pd ON i.product_id = pd.product_id
LEFT JOIN category_name c ON pd.product_category_name = c.category_name;