{{ config(materialized='incremental',
unique_key='CUSTOMER_HK') }}

with src as(SELECT customer_id,
customer_hk,
load_dts,
source
 FROM {{ ref('stg_customers') }})

select * from src
{%if is_incremental() %}
where customer_hk not in(select customer_hk from {{this}})
{%endif%}