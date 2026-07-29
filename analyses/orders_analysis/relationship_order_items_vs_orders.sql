with orders as (
    select * from {{ ref('stg_olist_orders_dataset__orders') }} o
),
order_items as (
    select * from {{ ref('stg_olist_order_items_dataset__orders') }}
)

select 
    orders.order_id,
    order_item_id
from orders 
right join order_items
on orders.order_id = order_items.order_id




