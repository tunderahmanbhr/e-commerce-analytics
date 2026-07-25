select 
    count(customer_id) number_of_customer_ids
from 
    {{ ref('stg_olist_customers_dataset__customers') }}