
  
    

  create  table "postgres_metabase1"."_analytics"."top_customers__dbt_tmp"
  
  
    as
  
  (
    

-- ============================================================================
-- Model: top_customers
--
-- Description:
--   Identifies the highest-value customers based on total sales,
--   order frequency, and average profit.
--
--   This model is designed for executive and customer analytics use cases,
--   supporting decisions around customer retention, segmentation,
--   and revenue concentration.
--
-- Grain:
--   One row per customer
--
-- Business Questions Answered:
--   - Who are the top customers by total revenue?
--   - How many orders do top customers place?
--   - Which customer segments generate the most value?
--
-- Source Models:
--   - stg_orders
--
-- Notes:
--   - Customers are ranked by total sales
--   - Limited to the top 50 customers by revenue
--   - Consumed directly by Metabase dashboards
--
-- ============================================================================

SELECT
    customer_name,
    customer_segment,
    region,
    SUM(sales) AS total_sales,
    COUNT(DISTINCT order_id) AS num_orders,
    ROUND(AVG(profit), 2) AS avg_profit
FROM "postgres_metabase1"."_staging"."stg_orders"
GROUP BY 1, 2, 3
ORDER BY total_sales DESC
LIMIT 50
  );
  