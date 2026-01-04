{{ config(
    materialized = 'table'
) }}

SELECT
    product_category_name,
    COUNT(*) AS Total_reviews,
    AVG(review_score) AS avg_Score
FROM {{ ref('stg_olist_order_reviews') }} AS R
INNER JOIN {{ ref('stg_olist_order_items') }} AS OI
ON R.order_id = OI.order_id
INNER JOIN {{ ref('stg_olist_products') }} AS P
ON OI.product_id = P.product_id
GROUP BY product_category_name
ORDER BY avg_Score ASC