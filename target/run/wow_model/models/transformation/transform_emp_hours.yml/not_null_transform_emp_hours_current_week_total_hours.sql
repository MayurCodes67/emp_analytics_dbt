
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select current_week_total_hours
from "WoW Model"."raw"."transform_emp_hours"
where current_week_total_hours is null



  
  
      
    ) dbt_internal_test