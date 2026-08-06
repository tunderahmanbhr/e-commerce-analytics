SELECT 
    order_delivered_carrier_date,
    order_purchase_timestamp,
    order_delivered_customer_date,
    order_estimated_delivery_date,
    date_trunc(order_delivered_customer_date, month) as day 
FROM 
    {{ source('e_commerce_analytics_dataset', 'olist_orders_dataset') }}
where 
    order_delivered_customer_date is not null 