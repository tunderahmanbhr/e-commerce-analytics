SELECT 
    order_id,
    count(order_id) as frequency_of_order_ids
FROM 
    {{ source('e_commerce_analytics_dataset', 'olist_order_reviews_cleaned_english') }}
group by order_id
order by frequency_of_order_ids desc