WITH raw_orders AS (
    SELECT
        row_id,
        order_id,
        order_date,
        ship_date,
        ship_mode,
        order_priority,
        product_container,
        customer_name,
        customer_segment,
        zip_code,
        state,
        city,
        region,
        product_category,
        product_subcategory,
        product_name,
        unit_price,
        quantity AS order_quantity,
        sales,
        profit,
        discount,
        shipping_cost,
        product_base_margin
    FROM {{ source('raw', 'orders') }}
)
SELECT *
FROM raw_orders;
