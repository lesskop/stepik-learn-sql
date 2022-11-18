SELECT
	name_genre,
	title,
	name_author
FROM
	author
	JOIN book ON author.author_id = book.author_id
	JOIN genre ON genre.genre_id = book.genre_id
WHERE
	name_genre = 'Роман'
ORDER BY
	title;