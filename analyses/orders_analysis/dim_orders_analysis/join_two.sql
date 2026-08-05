with orders as (
    select * from {{ ref('stg_olist_orders_dataset__orders') }}
),
order_items as (
    select * from {{ ref('stg_olist_order_items_dataset__orders') }}
),
order_reviews as (
    select * from {{ ref('stg_olist_order_reviews_cleaned_english__orders') }}
),
order_payments as (
    select * from {{ ref('stg_olist_order_payments_dataset__payments') }}
),
dim_orders as (
    select 
        orders.order_id as order_id_orders,
        order_items.order_id as order_id_items,
        order_items.order_item_id as order_item_id,
        order_payments.order_id as payment_order_id,
        price,
        freight_value,
        product_id
    from orders 
    left join order_items 
    on orders.order_id = order_items.order_id
    left join order_payments
    on order_payments.order_id = orders.order_id
)

select 
    order_id_orders,
    payment_order_id,

from dim_orders
where payment_order_id is null