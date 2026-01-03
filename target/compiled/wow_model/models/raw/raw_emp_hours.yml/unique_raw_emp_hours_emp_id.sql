
    
    

select
    emp_id as unique_field,
    count(*) as n_records

from "WoW Model"."raw"."raw_emp_hours"
where emp_id is not null
group by emp_id
having count(*) > 1


