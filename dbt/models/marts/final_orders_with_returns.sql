WITH orders_with_returns AS (
    SELECT
        o.*,
        r.status AS return_status,
        u.manager AS region_manager
    FROM {{ ref('stg_orders') }} o
    LEFT JOIN {{ ref('stg_returns') }} r
    ON o.order_id = r.order_id
    LEFT JOIN {{ ref('stg_users') }} u
    ON o.region = u.region
)
SELECT *
FROM orders_with_returns;
