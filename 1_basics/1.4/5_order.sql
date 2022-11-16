SELECT
	title,
	author,
	amount,
	(
		SELECT
			MAX(amount)
		FROM
			book
	) - amount AS Заказ
FROM
	book
WHERE
	amount <> (
		SELECT
			MAX(amount)
		FROM
			book
	);