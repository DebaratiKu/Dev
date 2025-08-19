{{ config(materialized='incremental',
unique_key='CUSTOMER_HK') }}

SELECT customer_id,
customer_hk,
load_dts,
source
 FROM {{ ref('stg_customers') }}