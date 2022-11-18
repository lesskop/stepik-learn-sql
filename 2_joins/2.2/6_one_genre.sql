SELECT
	name_author
FROM
	author
	JOIN book ON author.author_id = book.author_id
GROUP BY
	name_author
HAVING
	COUNT(DISTINCT genre_id) = 1