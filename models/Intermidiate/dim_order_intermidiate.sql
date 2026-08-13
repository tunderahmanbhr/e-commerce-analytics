with order_table_data_difference as (
    select *,date_diff(order_estimated_date,order_delivered_date,day) as date_difference
    from {{ ref('stg_olist_orders_dataset__orders') }}
),
date_difference_logic as (
    select 
        *, 
        case 
            when date_difference = 0 then 'standard_delivery'
            when date_difference > 0 then 'late_delivery'
            when date_difference < 0 then 'early_delivery'
        end as delivery_type
    from order_table_data_difference
)
select *
from date_difference_logic





