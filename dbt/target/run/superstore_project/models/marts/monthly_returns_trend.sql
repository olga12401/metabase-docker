
  
    

  create  table "postgres_metabase1"."_analytics"."monthly_returns_trend__dbt_tmp"
  
  
    as
  
  (
    

-- ============================================================================
-- Model: monthly_returns_trend
--
-- Description:
--   Tracks monthly trends in order returns.
--   Used by executives and operations teams to monitor
--   product quality and return behavior over time.
--
-- Grain:
--   One row per month
--
-- Business Questions Answered:
--   - Are return rates increasing or decreasing over time?
--   - Are there seasonal patterns in returns?
--
-- Source Models:
--   - stg_orders
--   - stg_returns
--
-- ============================================================================

WITH orders_with_returns AS (
    SELECT
        o.order_id,
        o.order_date,
        r.status
    FROM "postgres_metabase1"."_staging"."stg_orders" o
    LEFT JOIN "postgres_metabase1"."_staging"."stg_returns" r
        ON o.order_id = r.order_id
),
returns_by_month AS (
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        COUNT(*) FILTER (WHERE status = 'Returned') AS returned_orders,
        COUNT(*) AS total_orders,
        ROUND(
            COUNT(*) FILTER (WHERE status = 'Returned')::decimal
            / NULLIF(COUNT(*), 0),
            2
        ) AS return_rate
    FROM orders_with_returns
    GROUP BY 1
)

SELECT *
FROM returns_by_month
ORDER BY month
  );
  