{{ config(materialized='incremental',
unique_key='CUSTOMER_HK')}}

WITH source_data AS (
    SELECT
        customer_id AS customer_id,
        MD5(cast(customer_id as String) AS customer_hk,
        CURRENT_TIMESTAMP() AS load_dts,
        'RAW' AS source
    FROM {{ ref('raw_customers') }}
)
SELECT * FROM source_data
