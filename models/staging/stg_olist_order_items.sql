SELECT
    order_id,
    product_id
FROM {{ source('olist', 'olist_order_items') }}
