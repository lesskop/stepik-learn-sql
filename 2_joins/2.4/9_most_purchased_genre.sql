SELECT
	name_genre,
	SUM(buy_book.amount) AS Количество
FROM
	genre
	JOIN book USING (genre_id)
	JOIN buy_book USING (book_id)
GROUP BY
	name_genre
HAVING
	SUM(buy_book.amount) = (
		SELECT
			SUM(buy_book.amount)
		FROM
			buy_book
			JOIN book USING (book_id)
		GROUP BY
			genre_id
		ORDER BY
			SUM(buy_book.amount) DESC
		LIMIT
			1
	);