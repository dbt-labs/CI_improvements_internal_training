select
    user_id as customer_id,
    order_date,
    status
from {{ ref('raw_orders') }}