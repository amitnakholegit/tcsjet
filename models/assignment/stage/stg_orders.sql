with orders as
(select  ID as order_id, 
        CUSTOMER_ID, 
        ORDERED_AT,
        extract('day',ORDERED_AT) as day, 
        STORE_ID, 
        SUBTOTAL,
        TAX_PAID,
        (TAX_PAID*100)/subtotal as TAX_PAID_percentage,  
        ORDER_TOTAL        
from {{source("asgn_src","orders")}}
where order_total > 0
)

select * from orders