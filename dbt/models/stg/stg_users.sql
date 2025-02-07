WITH raw_users AS (
    SELECT
        region,
        manager
    FROM {{ source('raw', 'managers') }}
)
SELECT *
FROM raw_users;
