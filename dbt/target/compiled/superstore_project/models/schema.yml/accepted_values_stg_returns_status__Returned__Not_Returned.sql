
    
    

with all_values as (

    select
        status as value_field,
        count(*) as n_records

    from "postgres_metabase1"."_staging"."stg_returns"
    group by status

)

select *
from all_values
where value_field not in (
    'Returned','Not Returned'
)


