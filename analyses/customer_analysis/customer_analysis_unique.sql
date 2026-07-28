select count(*) number_of_distinct_codes
from (
select  distinct customer_zip_code_prefix 
from 
{{ ref('stg_olist_customers_dataset__customers') }}
) ts 