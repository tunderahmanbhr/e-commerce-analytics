with order_table as (
    SELECT 
        *,
        extract(year from order_delivered_customer_date) as order_delivered_customer_year,
        extract(month from order_delivered_customer_date) as order_delivered_customer_month,
        extract(day from order_delivered_customer_date) as order_delivered_customer_day,
        extract(year from order_estimated_delivery_date) as order_estimated_delivery_year,
        extract(month from order_estimated_delivery_date) as order_estimated_delivery_month,
        extract(day from order_estimated_delivery_date) as order_estimated_delivery_day,
    FROM 
        {{ source('e_commerce_analytics_dataset', 'olist_orders_dataset') }}
)
select 
    *,
    cast(concat(order_delivered_customer_year,'-',order_delivered_customer_month,'-',order_delivered_customer_day)as Date) as order_delivered_date,
    cast(concat(order_estimated_delivery_year,'-',order_estimated_delivery_month,'-',order_estimated_delivery_day)as Date) as order_estimated_date
from order_table





