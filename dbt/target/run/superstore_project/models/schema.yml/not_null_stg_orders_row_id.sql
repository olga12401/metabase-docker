select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select row_id
from "postgres_metabase1"."_staging"."stg_orders"
where row_id is null



      
    ) dbt_internal_test