

-- ============================================================================
-- Model: product_performance
--
-- Description:
--   Provides product-level performance metrics including sales,
--   profit, quantity sold, and margin.
--
--   This model is designed to support product and operations teams
--   in understanding which products drive revenue and profitability.
--
-- Grain:
--   One row per (product_name, product_category, product_subcategory)
--
-- Business Questions Answered:
--   - Which products generate the most sales?
--   - Which products are most profitable?
--   - How do margins vary across products?
--
-- Source Models:
--   - stg_orders
--
-- Notes:
--   - Metrics are aggregated across all historical orders
--   - This model is consumed directly by Metabase dashboards
--
-- ============================================================================

SELECT
    product_name,
    product_category,
    product_subcategory,
    SUM(order_quantity) AS total_quantity_sold,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(AVG(product_base_margin), 4) AS avg_margin,
    COUNT(DISTINCT order_id) AS num_orders
FROM "postgres_metabase1"."_staging"."stg_orders"
GROUP BY 1, 2, 3
ORDER BY total_sales DESC
LIMIT 100