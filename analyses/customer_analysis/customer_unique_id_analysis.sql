select 
    customer_id,
    count(customer_unique_id) as frequency_of_customer_unique_ids
from 
    {{ ref('stg_olist_customers_dataset__customers') }}
group by 
    customer_id
order by
    frequency_of_customer_unique_ids desc