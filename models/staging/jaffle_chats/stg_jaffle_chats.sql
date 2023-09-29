select 

    id as chat_id,
    customerid as customer_id,
    productid as product_id,
    started,
    ended,
    category as chat_category,
    created_timestamp,
    users



from {{ source('jaffle_chats', 'chats') }}