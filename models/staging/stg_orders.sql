{{ config(materialized='view')}}

WITH source_data AS (
    SELECT
        MD5(CONCAT(c.customer_id,'-', o.order_id)) AS CUSTOMER_ORDER_HK,
        MD5(c.customer_id) as CUSTOMER_HK,
        MD5(o.order_id) as ORDER_HK,
        o.order_id AS ORDER_ID,
        CURRENT_TIMESTAMP() AS LOAD_DTS,
        'RAW' AS SOURCE
    FROM {{ ref('raw_orders') }} o 
    join {{ ref('raw_customers') }} c 
    on o.customer_id=c.customer_id
)
SELECT * FROM source_data
