select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    region as unique_field,
    count(*) as n_records

from "postgres_metabase1"."raw"."stg_users"
where region is not null
group by region
having count(*) > 1



      
    ) dbt_internal_test