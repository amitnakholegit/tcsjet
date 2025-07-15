{{
    config(
        schema = 'int',
        store_failures = true
    )
}}
 
with orders as (
    select * from {{ ref('stg_orders') }}
)
 
select order_id, sum(order_total) ordertotal
from orders
group by 1
having (ordertotal<600)