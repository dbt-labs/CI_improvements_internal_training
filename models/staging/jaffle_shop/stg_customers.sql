select 
    5 as static_id,
    id as customer_id,
    first_name,
    last_name
from {{ ref('raw_customers') }}