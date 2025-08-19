{{ config(materialized='view')}}

WITH source_data AS (
    SELECT
        customer_id AS customer_id,
        MD5(customer_id) AS customer_hk,
        customer_name,
        customer_email,
        customer_phone,
        CURRENT_TIMESTAMP() AS load_dts,
        'RAW' AS source
    FROM {{ ref('raw_customers') }}
)
SELECT * FROM source_data
