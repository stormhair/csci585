/*
	find the name of top three users who have had the highest amount of deposit during 2013.
*/
SELECT u.first_name, u.last_name, SUM(r.deposit) AS _sum
FROM reservation AS r, users AS u
WHERE u.uid = r.res_user AND
	(r.start_date BETWEEN '2013-01-01' AND '2013-12-31') AND
	(r.end_date BETWEEN '2013-01-01' AND '2013-12-31')
GROUP BY u.uid
ORDER BY _sum DESC
LIMIT 3;