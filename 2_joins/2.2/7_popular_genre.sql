SELECT
	title,
	name_author,
	name_genre,
	price,
	amount
FROM
	book
	JOIN author USING (author_id)
	JOIN genre USING (genre_id)
WHERE
	name_genre in (
		-- Select the most popular genre(s)
		SELECT
			name_genre
		FROM
			author
			JOIN book USING (author_id)
			JOIN genre USING (genre_id)
		GROUP BY
			name_author,
			name_genre,
			genre.genre_id
		HAVING
			genre.genre_id IN (
				SELECT
					query_in_1.genre_id
				FROM
					(
						-- Select genre_id and amount of relative titles
						SELECT
							genre_id,
							SUM(amount) AS sum_amount
						FROM
							book
						GROUP BY
							genre_id
					) query_in_1
					INNER JOIN (
						-- Select genre_id with most popular genre
						SELECT
							genre_id,
							SUM(amount) AS sum_amount
						FROM
							book
						GROUP BY
							genre_id
						ORDER BY
							sum_amount DESC
						LIMIT
							1
					) query_in_2 USING (sum_amount)
			)
	)
ORDER BY
	title;