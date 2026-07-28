select count(*) number_of_distinct_codes
from (
select distinct geolocation_zip_code_prefix
from 
{{ ref('stg_olist_geolocation_dataset__locations') }}
) ts