

SELECT emp_id,
       emp_name,
	   DATE_TRUNC('week', event_date)::date AS week_start,
	   COALESCE(hours_worked, 0) AS clean_hours
FROM "WoW Model"."raw"."raw_emp_hours"