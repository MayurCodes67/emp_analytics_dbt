
    
    

with all_values as (

    select
        percentage_change_flag as value_field,
        count(*) as n_records

    from "WoW Model"."raw"."kpi_emp_hours"
    group by percentage_change_flag

)

select *
from all_values
where value_field not in (
    'Improving','Declining','Stable','Insufficient Data'
)


