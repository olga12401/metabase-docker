
  create view "postgres_metabase1"."_staging"."stg_returns__dbt_tmp"
    
    
  as (
    WITH raw_returns AS (
    SELECT
        order_id,
        status
    FROM "postgres_metabase1"."raw"."returns"
)
SELECT *
FROM raw_returns
  );