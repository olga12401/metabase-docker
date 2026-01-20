WITH raw_users AS (
    SELECT
        region,
        manager
    FROM "postgres_metabase1"."raw"."managers"
)
SELECT *
FROM raw_users