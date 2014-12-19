/*
	find the most famous reviewer: the user who owns reviews that have been liked the most for a larger number
	of villas compared to any other reviewer.
*/
select r.uid, users.first_name, users.last_name
from (
  select review.rev_id as rid, review.user_id as uid, count(*) as nlike
  from review, like_review
  where review.rev_id = like_review._rev
  GROUP BY review.rev_id
) as r, users
where r.uid = users.uid
group by r.nlike, r.uid
order by count(*) desc
limit 1;