SELECT
    customer_id,
    customer_city
FROM {{ source('olist', 'olist_customers') }}
