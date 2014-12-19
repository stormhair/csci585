/*
	list the villa owner names, as well as the count of villas they own, sorted by count of villas.
*/
SELECT u.first_name, u.last_name, count(v.vid) AS num
FROM users AS u, owners AS o, villa AS v
WHERE u.uid = o.oid AND v.owner = o.oid
GROUP BY u.uid
ORDER BY num DESC;