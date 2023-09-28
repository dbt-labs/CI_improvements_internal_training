-- id, customerid, productid, started, ended, category, created_timestamp, users

{% set max_row_num=dbt_utils.get_single_value("select max(id) from RAW.JAFFLE_CHATS.CHATS") %}
-- {{ max_row_num }}

with raw as (
  select * from "RAW"."JAFFLE_CHATS"."CHATS"
),

mock as (
    {% for i in range(1, 100) %}
        select
            {{ max_row_num }} + {{ i }} as id, 
            uniform(1, 1000, random()) as customerid,
            uniform(1, 10, random()) as productid, 
            dateadd(minute,-10,getdate()) as started,
            current_date() + 1 as ended,
            'jaffle_issue' as category,
            current_timestamp() as created_timestamp,
            null as users
        
        {% if not loop.last %}
            union all 
        {%- endif %}

    {% endfor %} 

)

select * from raw
union all
select * from mock
limit 1500