SELECT
	name_author AS Автор,
	name_genre AS Жанр,
	COUNT(title) AS Количество_произведений
FROM
	book
	JOIN author USING (author_id)
	JOIN genre USING (genre_id)
GROUP BY
	name_author,
	name_genre
ORDER BY
	name_author,
	name_genre;