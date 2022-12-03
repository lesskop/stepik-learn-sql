SELECT
	author,
	COUNT(author) AS Количество_произведений,
	MIN(price) AS Минимальная_цена,
	SUM(amount) AS Число_книг
FROM
	book
WHERE
	amount > 1
GROUP BY
	author
HAVING
	COUNT(author) > 1
ORDER BY
	author;