SELECT
	author,
	MAX(price) as the_most_expensive_book,
	MIN(price) as the_most_cheap_book,
	ROUND(AVG(price), 2) as average_price
FROM
	book
GROUP BY
	author
HAVING
	SUM(price * amount) > 5000
ORDER BY
	average_price DESC;