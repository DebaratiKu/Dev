{{ config(materialized='incremental') }}

WITH source_data AS (
    SELECT
        CUSTOMER_ID,
        customer_name,
        customer_email,
        customer_phone,
        CURRENT_TIMESTAMP() AS load_dts,
        'RAW' AS source
    FROM {{ ref('raw_customers') }}
)
SELECT * FROM source_data