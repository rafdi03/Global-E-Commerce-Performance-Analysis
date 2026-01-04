SELECT
    order_id,
    customer_id,
    order_status,
    order_approved_at::timestamp AS order_approved_at,
    order_delivered_customer_date::timestamp AS delivered_at,
    order_estimated_delivery_date::timestamp AS estimated_delivery_at
FROM {{ source('olist', 'olist_orders') }}
