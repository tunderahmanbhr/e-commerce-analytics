select 
    *,
    order_delivered_date,
    order_estimated_date,
    date_diff(order_estimated_date,order_delivered_date,day) as date_difference


from {{ ref('stg_olist_orders_dataset__orders') }}
order by 3 desc 