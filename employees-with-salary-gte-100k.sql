-- all employees making 100,000 or more

select *
from job j
join employee e
	on j.Id = e.JobId
where j.salary >= 100000