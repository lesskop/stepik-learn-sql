SELECT
	name_author,
	title,
	COUNT(buy_book.amount) AS Количество
FROM
	author
	JOIN book USING(author_id)
	LEFT JOIN buy_book USING(book_id)
GROUP BY
	title,
	name_author
ORDER BY
	name_author,
	title;