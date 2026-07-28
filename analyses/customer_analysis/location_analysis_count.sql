select count(geolocation_zip_code_prefix) as count_of_unique_codes
from 
{{ ref('stg_olist_geolocation_dataset__locations') }}