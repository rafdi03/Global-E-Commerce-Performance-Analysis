SELECT
    order_id,
    payment_value
FROM {{ source('olist', 'olist_order_payments') }}
