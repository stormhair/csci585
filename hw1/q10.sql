/*
	find any user who has reserved two or more villas at overlapping periods. Such a user has two or more
	reservations with overlapping(but not necessarily the same) stay periods.
*/
select user_id, users.first_name, users.last_name
from
(
	select r1.res_user as user_id
	from reservation as r1, reservation as r2
	where r1.res_user = r2.res_user and r1.reservation_id != r2.reservation_id and
	(
	(r1.start_date>r2.start_date and r1.start_date<r2.end_date)
	or
	(r1.end_date>r2.start_date and r1.end_date<r2.end_date)
	)
)as a, users
where user_id = users.uid