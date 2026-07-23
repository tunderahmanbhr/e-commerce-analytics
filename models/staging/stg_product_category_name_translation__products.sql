SELECT * FROM {{ source('e_commerce_analytics_dataset', 'product_category_name_translation') }}
where product_category_name != 'product_category_name'