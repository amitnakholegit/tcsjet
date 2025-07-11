with orders as
(
    select * from {{ref("stg_orders")}}
),

order_item as
(
    select * from {{ref("stg_order_items")}}
)
select * from 
order join order_item

