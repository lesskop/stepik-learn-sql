DELETE FROM
	book
WHERE
	author IN (
		SELECT
			author
		FROM
			supply
		GROUP BY
			author
		HAVING
			sum(amount * price) > 3500
	);