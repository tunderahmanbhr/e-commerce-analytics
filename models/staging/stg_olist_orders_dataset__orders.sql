SELECT 
    *,
    extract(year from order_delivered_customer_date) as order_delivered_customer_year,
    extract(month from order_delivered_customer_date) as order_delivered_customer_month,
    extract(day from order_delivered_customer_date) as order_delivered_customer_day,
    extract(year from order_estimated_delivery_date) as order_estimated_delivery_year,
    extract(month from order_estimated_delivery_date) as order_estimated_delivery_month,
    extract(day from order_estimated_delivery_date) as order_estimated_delivery_day,
    concat(order_delivered_customer_year,' ',order_delivered_customer_month,' ',order_delivered_customer_day) as order_delivered_date


FROM 
    {{ source('e_commerce_analytics_dataset', 'olist_orders_dataset') }}
