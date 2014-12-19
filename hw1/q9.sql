/*
	find the vacancy ratio for each owner in 8/15/2014. The vacancy ratio is defined as the ratio of villas
	not reserved for a specific date, over the total number of villas owned by that owner.
*/
select o1 as owner_id, numer/denom as vacancy_ratio
from(
	select villa.owner as o1, count(villa.vid) as denom
	from villa
	group by villa.owner
) as a,
(
	select villa.owner as o2, count(villa.vid) as numer
	from villa
	where villa.vid not in(
		select distinct(reservation.res_villa)
		from reservation
		where '2014-08-15' between reservation.start_date and reservation.end_date
	)
	group by villa.owner
) as b
where o1 = o2
