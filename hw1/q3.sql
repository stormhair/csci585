/*
	find the (first and last) name of all users who have ever used a coupon code offering
	a discount more than 10%.
*/
SELECT DISTINCT(u.uid), u.first_name, u.last_name
FROM users AS u, reservation AS r, coupon AS c
WHERE u.uid = r.res_user AND c.coupon_id = r.res_coupon and c.discount>10