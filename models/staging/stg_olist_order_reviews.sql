SELECT
    order_id,
    review_score
FROM {{ source('olist', 'olist_order_reviews') }}
