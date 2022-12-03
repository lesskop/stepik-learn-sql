SELECT
	author,
	SUM(price * amount) AS Стоимость
FROM
	book
GROUP BY
	author
HAVING
	MAX(price) > (
		SELECT
			AVG(price)
		FROM
			book
	)
ORDER BY
	Стоимость DESC;