{{ config(
materialized = 'table'
)}}

SELECT emp_id,
       emp_name,
	   week_start,
	   current_week_total_hours,
	   previous_week_total_hours,
	   percentage_change,
	   CASE
	       WHEN previous_week_total_hours IS NULL THEN 'Insufficient Data'
		   WHEN percentage_change > 0 THEN 'Improving'
		   WHEN percentage_change < 0 THEN 'Declining'
		   ELSE 'Stable'
	   END AS percentage_change_flag
FROM {{ ref('transform_emp_hours') }}