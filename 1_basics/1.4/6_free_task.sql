SELECT
	author,
	title,
	price,
	(
		SELECT
			ROUND(AVG(price), 2)
		FROM
			book
	) as average_price
FROM
	book
WHERE
	price > (
		SELECT
			AVG(price)
		FROM
			book
	)
ORDER BY
	price DESC;