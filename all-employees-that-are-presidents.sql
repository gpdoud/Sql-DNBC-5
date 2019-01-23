-- all employees with job President

select * 
from job j
join employee e
	on e.JobId = j.Id 
where j.Description = 'President';