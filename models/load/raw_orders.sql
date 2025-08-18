{{config(materialized='table')}}

Select * from {{ source('my_db','ORDERS') }}