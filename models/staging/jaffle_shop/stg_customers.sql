select 
    7 as yet_another_id,
    id as customer_id,
    first_name,
    last_name
from {{ ref('raw_customers') }}