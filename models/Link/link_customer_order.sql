{{ config(materialized='incremental',
unique_key='CUSTOMER_ORDER_HK') }}

with src as (SELECT 
CUSTOMER_ORDER_HK,
CUSTOMER_HK,
ORDER_HK,
ORDER_ID,
LOAD_DTS,
SOURCE
 FROM {{ ref('stg_orders') }})

select * from src
{%if is_incremental() %}
where CUSTOMER_ORDER_HK not in(select CUSTOMER_ORDER_HK from {{this}})
{%endif%} 