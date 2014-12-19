/*
	find the villa with the highest count of reserved nights in 2014.
*/
select v.vid, v.name
from villa as v, reservation as r
where v.vid = r.res_villa and ((r.start_date between '2014-01-01' and '2014-12-31') or (r.end_date between '2014-01-01' and '2014-12-31'))
group by v.vid
order by sum(datediff(r.end_date, r.start_date)) desc
limit 1