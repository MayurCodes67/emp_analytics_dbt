
  
    

  create  table "WoW Model"."raw"."transform_emp_hours__dbt_tmp"
  
  
    as
  
  (
    

WITH current_wk_emp_total_hrs AS (
SELECT emp_id,
       emp_name,
	   week_start,
	   SUM(clean_hours) AS total_hours_worked
FROM "WoW Model"."raw"."stg_emp_hours"
GROUP BY emp_id,
         emp_name,
		 week_start
),

prev_wk_emp_total_hrs AS (
SELECT emp_id,
       emp_name,
	   week_start,
	   total_hours_worked AS current_week_total_hours,
	   LAG(total_hours_worked) OVER(PARTITION BY emp_id ORDER BY week_start) AS previous_week_total_hours
FROM current_wk_emp_total_hrs
)

SELECT emp_id,
       emp_name,
	   week_start,
	   current_week_total_hours,
	   previous_week_total_hours,
	   ((current_week_total_hours - previous_week_total_hours) / NULLIF(previous_week_total_hours, 0) * 100) AS percentage_change
FROM prev_wk_emp_total_hrs
  );
  