{{ config(materialized='incremental',
unique_key='CUSTOMER_HK') }}

WITH source_data AS (
    SELECT
        CUSTOMER_ID,
        CUSTOMER_HK,
        customer_name,
        customer_email,
        customer_phone,
        CURRENT_TIMESTAMP() AS load_dts,
        'RAW' AS source
    FROM {{ ref('stg_customers') }}
)
select * from source_data
{%if is_incremental() %}
where customer_hk not in(select customer_hk from {{this}})
{%endif%}