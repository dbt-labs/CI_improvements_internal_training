select 
    1,
    id as customer_id,
    first_name,
    last_name
from {{ ref('raw_customers') }}