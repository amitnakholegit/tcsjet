{{config (materialized='incremental', 
          unique_key= 'order_id')}}

with
    orders as (select * from {{ ref("stg_orders") }}),
    order_items as (select * from {{ ref("stg_order_items") }})
select
    o.order_id as order_id,
    customer_id,
    i.sku,
    ordered_at,
    store_id,
    subtotal,
    tax_paid,
    tax_paid_percentage,
    {{inr_eur('order_total',2)}} as order_total_eur,
    {{inr_yen('order_total',2)}} as order_total_yen
from orders o
inner join order_items i 
    on o.order_id = i.order_id
{% if is_incremental() %}
    where o.ordered_at > (select nvl(max(ordered_at),'{{ var("min_dt") }}') from {{this}})
{% endif %}    
