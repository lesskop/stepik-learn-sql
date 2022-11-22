SELECT
	name_city,
	COUNT(buy_id) AS Количество
FROM
	city
	JOIN client USING (city_id)
	JOIN buy USING (client_id)
GROUP BY
	name_city
ORDER BY
	Количество DESC,
	name_city;