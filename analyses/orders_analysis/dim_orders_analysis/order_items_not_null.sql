with orders as (
    select * from {{ ref('stg_olist_orders_dataset__orders') }}
),
order_items as (
    select * from {{ ref('stg_olist_order_items_dataset__orders') }}
),
order_reviews as (
    select * from {{ ref('stg_olist_order_reviews_cleaned_english__orders') }}
)

select
    orders.order_id orders_order_id,
    order_items.order_id as items_order_id,
    *
from orders 
left join order_items 
on orders.order_id = order_items.order_id

