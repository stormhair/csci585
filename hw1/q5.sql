/*
	find the average age (in years) of users who rented villas during low-season last year.
*/
select avg(timestampdiff(year, users.dob, r.start_date)) as average_age
from users, reservation as r
where (r.start_date between '2013-09-01' and '2013-12-31')
	and users.uid = r.res_user;