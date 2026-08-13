select 
    order_delivered_date,
    order_estimated_date,
    date_difference,
    case 
        when date_difference = 0 then 'standard_delivery'
        when date_difference > 0 then 'late_delivery'
        when date_difference < 0 then 'early_delivery'
    end as delivery_type
from {{ ref('dim_order_intermidiate') }}
where 
    order_delivered_date is not null
order by 3 desc 
