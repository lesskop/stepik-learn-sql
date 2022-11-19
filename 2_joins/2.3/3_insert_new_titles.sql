INSERT INTO
	book (title, author_id, genre_id, price, amount)
SELECT
	title,
	author_id,
	Null AS genre_id,
	price,
	amount
FROM
	author
	JOIN supply ON author.name_author = supply.author
WHERE
	amount <> 0;