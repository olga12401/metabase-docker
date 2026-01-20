
  create view "postgres_metabase1"."_staging"."stg_users__dbt_tmp"
    
    
  as (
    WITH raw_users AS (
    SELECT
        region,
        manager
    FROM "postgres_metabase1"."raw"."managers"
)
SELECT *
FROM raw_users
  );