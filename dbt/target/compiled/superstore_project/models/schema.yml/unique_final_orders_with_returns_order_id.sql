
    
    

select
    order_id as unique_field,
    count(*) as n_records

from "postgres_metabase1"."raw"."final_orders_with_returns"
where order_id is not null
group by order_id
having count(*) > 1


