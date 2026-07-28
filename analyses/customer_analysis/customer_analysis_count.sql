select count(customer_zip_code_prefix) as count_of_unique_codes
from 
{{ ref('stg_olist_customers_dataset__customers') }}