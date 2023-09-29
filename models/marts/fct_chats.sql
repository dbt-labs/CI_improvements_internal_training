{{
    config(
        materialized='incremental',
        unique_key='id'
    )
}}


select * from {{ ref('stg_jaffle_chats_inc') }}
    {% if is_incremental() %}
    where started > select max((started) from {{ this }})
    {% endif %}