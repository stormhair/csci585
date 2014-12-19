/*
	list all those villas that are equipped with Jaccuzzi and follow a no-pet policy
*/
SELECT v.vid, v.name
FROM villa AS v, has_feature AS h, features AS f
WHERE v.vid = h._villa AND h._feature = f.feature_id AND f.feature_name = 'Jacuzzi' AND
	v.vid NOT IN(
		SELECT v.vid
		FROM villa AS v, has_feature AS h, features AS f
		WHERE v.vid = h._villa AND h._feature = f.feature_id AND f.feature_name = 'pets allowed'
	)
;