with orders as (
    select * from {{ ref('stg_olist_orders_dataset__orders') }}
),
order_items as (
    select * from {{ ref('stg_olist_order_items_dataset__orders') }}
)

select
     count(orders.order_id) as number_of_orders_ids
from orders 
left join order_items 
on orders.order_id = order_items.order_id