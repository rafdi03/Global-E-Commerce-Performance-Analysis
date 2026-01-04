{{ config(
    materialized = 'table'
) }}

WITH rfm_base AS (
    SELECT customer_id,
        DATE '2017-10-02' - MAX(order_approved_at::DATE) AS Recency_Day,
        COUNT(DISTINCT orders.order_id) AS Frequency,
        SUM(payment.payment_value) AS Monetary
    FROM {{ ref('stg_olist_orders') }} AS orders
    INNER JOIN {{ ref('stg_olist_order_payments') }} AS payment
    ON orders.order_id = payment.order_id   
    WHERE order_approved_at IS NOT NULL
    GROUP BY customer_id
    ORDER BY Recency_Day ASC
)

SELECT *
FROM rfm_base
ORDER BY recency_day ASC