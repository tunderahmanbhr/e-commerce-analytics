select 
    customer_id,
    count(customer_id) as frequency_of_customer_id
from 
    {{ ref('stg_olist_orders_dataset__orders') }}
group by 
    customer_id
order by
    frequency_of_customer_id desc