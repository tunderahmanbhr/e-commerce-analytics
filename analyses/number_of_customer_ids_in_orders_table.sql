select 
    count(customer_id) number_of_customer_ids
from 
    {{ ref('stg_olist_orders_dataset__orders') }}