with
    orders as (
        select
            id as order_id,
            customer_id,
            ordered_at,
            extract('day', ordered_at) as day,
            store_id,
            tax_paid,
            (tax_paid * 100) / subtotal as tax_paid_percentage,
            order_total
        from {{ source("asgn_src", "orders") }}
        where order_total > 0
    )

select *
from orders
