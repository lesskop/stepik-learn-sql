SELECT
	DISTINCT name_client
FROM
	client
	JOIN buy USING (client_id)
	JOIN buy_book USING (buy_id)
WHERE
	book_id IN (
		SELECT
			book_id
		FROM
			author
			JOIN book USING (author_id)
		WHERE
			name_author = 'Достоевский Ф.М.'
	)
ORDER BY
	name_client;