

-- ============================================================================
-- Model: final_orders_with_returns
--
-- Description:
--   Core fact table combining order-level data with return status
--   and regional manager information.
--
--   This model serves as the foundation for downstream analytical marts
--   and is consumed directly by BI tools such as Metabase.
--
-- Grain:
--   One row per order line (row_id from stg_orders)
--
-- Business Questions Answered:
--   - Which orders were returned?
--   - How do returns vary by region and manager?
--   - How do returns impact sales and profit?
--
-- Source Models:
--   - stg_orders
--   - stg_returns
--   - stg_users
--
-- Notes:
--   - This is the primary fact table in the analytics layer
--   - Downstream marts depend on this model
--   - No filtering or aggregation is applied at this stage
--
-- ============================================================================

WITH orders_with_returns AS (

    SELECT
        o.*,
        r.status AS return_status,
        u.manager AS region_manager
    FROM "postgres_metabase1"."_staging"."stg_orders" o
    LEFT JOIN "postgres_metabase1"."_staging"."stg_returns" r
        ON o.order_id = r.order_id
    LEFT JOIN "postgres_metabase1"."_staging"."stg_users" u
        ON o.region = u.region
)

SELECT *
FROM orders_with_returns