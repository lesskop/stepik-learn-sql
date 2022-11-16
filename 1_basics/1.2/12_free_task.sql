SELECT
	'Донцова Дарья' AS author,
	concat('Евлампия Романова и ', title) AS title,
	round(price * 1.42, 2) AS price
FROM
	book
ORDER BY
	price DESC,
	title DESC;