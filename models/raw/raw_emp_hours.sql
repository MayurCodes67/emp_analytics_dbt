{{ config(
materialized = 'table'
)}}

SELECT *
FROM {{ source('source_data', 'raw_emp_hours') }}