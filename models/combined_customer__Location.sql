WITH stg_olist_customers_dataset__customers AS (
  SELECT
    *
  FROM {{ ref('my_new_project', 'stg_olist_customers_dataset__customers') }}
), stg_olist_geolocation_dataset__locations AS (
  /* This dataset has information Brazilian zip codes and its lat/lng coordinates. Use it to plot maps and find distances between sellers 
and customers. */
  SELECT
    *
  FROM {{ ref('my_new_project', 'stg_olist_geolocation_dataset__locations') }}
), join_1 AS (
  SELECT
    stg_olist_geolocation_dataset__locations.geolocation_zip_code_prefix,
    stg_olist_geolocation_dataset__locations.geolocation_city,
    stg_olist_geolocation_dataset__locations.geolocation_state,
    stg_olist_customers_dataset__customers.customer_id,
    stg_olist_customers_dataset__customers.customer_unique_id
  FROM stg_olist_geolocation_dataset__locations
  JOIN stg_olist_customers_dataset__customers
    ON stg_olist_geolocation_dataset__locations.geolocation_zip_code_prefix = stg_olist_customers_dataset__customers.customer_zip_code_prefix
), combined_customer__location_sql AS (
  SELECT
    *
  FROM join_1
)
SELECT
  *
FROM combined_customer__location_sql