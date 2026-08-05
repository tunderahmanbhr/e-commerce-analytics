-----------------------------------------------------------------------------------------------------------------------------------------------
-- order statuses of "shipped", "created" and "invoiced" have null values in order items table, the only assummed business logic for this is that 
-- those orders were returned. 
-----------------------------------------------------------------------------------------------------------------------------------------------
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
    SELECT * FROM {{ source('e_commerce_analytics_dataset', 'olist_order_payments_dataset') }}
),
dim_orders as (
    select distinct
        orders.order_id as order_id,
        order_status,
        review_score,
        review_comment_message as review_comment,
        payment_sequential,
        payment_type,
        payment_installments
    from orders 
    left join order_items 
    on orders.order_id = order_items.order_id
    left join order_reviews
    on order_reviews.order_id = orders.order_id
    left join order_payments
    on order_payments.order_id = orders.order_id 
)
select *
from dim_orders
