
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select emp_id
from "WoW Model"."raw"."kpi_emp_hours"
where emp_id is null



  
  
      
    ) dbt_internal_test