{{ config(
    materialized = 'table'
) }}

SELECT product_category_name,
       customer_city,
       COUNT(*) AS total_late_orders,
       AVG(
       delivered_at::DATE - estimated_delivery_at::DATE
       ) AS avg_delay_days
    FROM {{ ref('stg_olist_order_items') }} AS items
INNER JOIN {{ ref('stg_olist_products') }} AS product
    ON items.product_id = product.product_id
INNER JOIN {{ ref('stg_olist_orders') }} AS orders
    ON items.order_id = orders.order_id
INNER JOIN {{ ref('stg_olist_customers') }} AS cust
    ON orders.customer_id = cust.customer_id
    WHERE delivered_at > estimated_delivery_at
GROUP BY 
        product_category_name,
        customer_city
ORDER BY avg_delay_days DESC