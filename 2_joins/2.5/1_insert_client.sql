INSERT INTO
	client (name_client, city_id, email)
SELECT
	'Попов Илья',
	city_id,
	'popov@test'
FROM
	city
WHERE
	city.name_city = 'Москва';