--Meningkatkan Efisiensi Logistik (Supply Chain Optimization): Mengidentifikasi rute pengiriman paling lambat
SELECT product_category_name,
       customer_city,
       COUNT(*) AS total_late_orders,
       AVG(
       order_delivered_customer_date::DATE - order_estimated_delivery_date::DATE
       ) AS avg_delay_days
    FROM olist_order_items AS items
INNER JOIN olist_products AS product
    ON items.product_id = product.product_id
INNER JOIN olist_orders AS orders
    ON items.order_id = orders.order_id
INNER JOIN olist_customers AS cust
    ON orders.customer_id = cust.customer_id
    WHERE order_delivered_customer_date > order_estimated_delivery_date
GROUP BY product_category_name,customer_city
ORDER BY avg_delay_days DESC

--Segmentasi Pelanggan (Customer Retention) : RFM (Recency, Frequency, Monetary) untuk memisahkan Loyal Customer vs Churn Customer
--Recency : orders.order_approved_at (tanggal_Mulai - Max(order_approved_at)
--Frequency : COUNT(orders.order_id)
--Monetary : SUM(Order_payment.Payment_value)
SELECT customer_id,
       DATE '2017-10-02' - MAX(order_approved_at::DATE) AS Recency_Day,
       COUNT(DISTINCT orders.order_id) AS Frequency,
       SUM(payment.payment_value) AS Monetary
FROM olist_orders AS orders
INNER JOIN olist_order_payments AS payment
ON orders.order_id = payment.order_id
WHERE order_approved_at IS NOT NULL
GROUP BY customer_id
ORDER BY Recency_Day ASC

--Analisis Kualitas Produk:
--reviews.order_id JOIN order_items.order_id as BH (BH.product_id JOIN product.product_id)
SELECT
    product_category_name,
    COUNT(*) AS Total_reviews,
    AVG(review_score) AS avg_Score
FROM olist_order_reviews AS R
INNER JOIN olist_order_items AS OI
ON R.order_id = OI.order_id
INNER JOIN olist_products AS P
ON OI.product_id = P.product_id
GROUP BY product_category_name
ORDER BY avg_Score ASC;

SELECT * FROM ecom.dbt_arya.mart_customer_rfm
SELECT * FROM ecom.dbt_arya.mart_product_quality
SELECT * FROM ecom.dbt_arya.mart_supply_chain_delay
SELECT * FROM ecom.dbt_arya.my_first_dbt_model