WITH raw_returns AS (
    SELECT
        order_id,
        status
    FROM {{ source('raw', 'returns') }}
)
SELECT *
FROM raw_returns;
