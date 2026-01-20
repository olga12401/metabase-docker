select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select region
from "postgres_metabase1"."_staging"."stg_orders"
where region is null



      
    ) dbt_internal_test