{{ config(materialized='incremental',
unique_key='CUSTOMER_ORDER_HK')}}

WITH source_data AS (
    SELECT
        MD5(CONCAT(customer_id,'-', order_id)) AS CUSTOMER_ORDER_HK,
        MD5(customer_id) as CUSTOMER_HK,
        MD5(order_id) as ORDER_HK,
        order_id AS ORDER_ID,
        CURRENT_TIMESTAMP() AS LOAD_DTS,
        'RAW' AS SOURCE
    FROM {{ ref('raw_orders') }}
)
SELECT * FROM source_data
