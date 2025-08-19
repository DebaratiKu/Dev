{{ config(materialized='incremental',
unique_key='CUSTOMER_ORDER_HK') }}

SELECT 
CUSTOMER_ORDER_HK,
CUSTOMER_HK,
ORDER_HK,
ORDER_ID,
LOAD_DTS,
SOURCE
 FROM {{ ref('stg_orders') }}