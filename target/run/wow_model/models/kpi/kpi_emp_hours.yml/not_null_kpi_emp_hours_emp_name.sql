
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select emp_name
from "WoW Model"."raw"."kpi_emp_hours"
where emp_name is null



  
  
      
    ) dbt_internal_test