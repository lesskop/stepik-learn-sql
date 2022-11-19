DELETE FROM
	author USING author
	JOIN book USING (author_id)
	JOIN genre USING (genre_id)
WHERE
	name_genre = 'Поэзия';