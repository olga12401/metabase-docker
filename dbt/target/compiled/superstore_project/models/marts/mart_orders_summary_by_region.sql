

-- ============================================================================
-- Model: mart_orders_summary_by_region
--
-- Description:
--   This model provides an aggregated view of sales, profitability, and
--   return behavior by sales region and regional manager.
--
--   It is designed for executive and management reporting and is used
--   directly by Metabase dashboards.
--
-- Grain:
--   One row per (region, region_manager)
--
-- Business Questions Answered:
--   - Which regions generate the most sales and profit?
--   - Which regions have the highest return rates?
--   - How do regional managers compare in performance?
--
-- Source Models:
--   - final_orders_with_returns
--
-- ============================================================================

WITH region_summary AS (

    SELECT
        region,
        region_manager,

        -- Order metrics
        COUNT(DISTINCT order_id) AS total_orders,
        COUNT(
            DISTINCT CASE
                WHEN return_status = 'Returned' THEN order_id
            END
        ) AS returned_orders,

        -- Return rate (%)
        ROUND(
            100.0
            * COUNT(
                DISTINCT CASE
                    WHEN return_status = 'Returned' THEN order_id
                END
            )
            / NULLIF(COUNT(DISTINCT order_id), 0),
            2
        ) AS return_rate_percent,

        -- Financial metrics
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit,

        -- Discount behavior
        ROUND(AVG(discount), 4) AS avg_discount

    FROM "postgres_metabase1"."_analytics"."final_orders_with_returns"

    GROUP BY
        region,
        region_manager
)

SELECT *
FROM region_summary