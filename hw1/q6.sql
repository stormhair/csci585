/*
	find the three villas and their associated owners, who have the highest average user rating.
*/
select v.vid, o.oid
from villa as v, owners as o
where v.owner = o.oid and v.vid in
(
	select villa.vid
	from villa, review
	where villa.vid = review.villa_id
	group by villa.vid
	order by avg(review.rating) desc
)
limit 3