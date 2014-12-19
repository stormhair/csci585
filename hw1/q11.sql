/*
	list the name of all villa owners, who own villas with a 10% or more than growth in the count of reserved 
	nights in the first 8 months of 2014 compared to the similar period in 2013.
*/
select owner_id, users.first_name, users.last_name
from
(
	select o1 as owner_id
	from
	(
		select villa.owner as o1, sum(nights1) as n1
		from
		(
			select r1.res_villa as villa_id1, sum(datediff(r1.end_date, r1.start_date)) as nights1
			from reservation as r1
			where (r1.start_date between '2013-01-01' and '2013-08-31')
				and (r1.end_date between '2013-01-01' and '2013-08-31')
			group by r1.res_villa
		) as a, villa
		where villa.vid = villa_id1
		group by villa.owner
	) as _a,
	(
		select villa.owner as o2, sum(nights2) as n2
		from
		(
			select r2.res_villa as villa_id2, sum(datediff(r2.end_date, r2.start_date)) as nights2
			from reservation as r2
			where (r2.start_date between '2014-01-01' and '2014-08-31')
				and (r2.end_date between '2014-01-01' and '2014-08-31')
			group by r2.res_villa
		) as b, villa
		where villa.vid = villa_id2
		group by villa.owner
	) as _b
	where o1 = o2 and (n2-n1)>0.1*n1
) as __a, users
where owner_id = users.uid