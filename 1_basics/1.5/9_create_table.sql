CREATE TABLE ordering AS
SELECT
	author,
	title,
	ROUND(
		(
			SELECT
				AVG(amount)
			FROM
				book
		)
	) as amount
FROM
	book
WHERE
	amount < (
		SELECT
			AVG(amount)
		FROM
			book
	);