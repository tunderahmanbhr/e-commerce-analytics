select count(*) as number_of_distinct_customer_ids
from (
    select 
        distinct customer_id 
    from 
        {{ ref('stg_olist_customers_dataset__customers') }}
) ts