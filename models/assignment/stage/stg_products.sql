with
    products as (
        select
            sku,
            name,
            type,
            price,
            price / 100 as product_price,
            description,
            case type when 'jaffle' then 1 else 0 end as is_food_item,
            case type when 'beverage' then 1 else 0 end as is_drink_item,
            update_at
        from {{ source("asgn_src", "products") }}
    )
select *
from products
