with seed as (
  
  select *,
    uniform(1, 20, random()) as rand_int
  
  from raw.do_not_look.products_seed

)

select

  id,
  case when rand_int = 1
    then cogs + rand_int
    else cogs
    end as cogs,
  case when rand_int = 2
    then price + rand_int
    else price
    end as price,
  case when rand_int = 3
    then 'the all-new '||product_name
    else product_name
    end as product_name,
  case when rand_int = 4
    then not is_active
    else is_active end as is_active,
  created_at,
  case when rand_int in (1,2,3,4)
    then current_timestamp
    else created_at
    end as updated_at

from seed

  


