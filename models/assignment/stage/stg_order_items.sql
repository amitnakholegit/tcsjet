with
    order_items as (
        select  id as item_id, 
                order_id as order_id, 
                sku 
        from {{ source("asgn_src", "items") }}
    )

select *
from order_items
