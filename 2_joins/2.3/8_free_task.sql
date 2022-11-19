-- Update amount of books in "book" table from "supply" table
UPDATE
	book
	INNER JOIN author ON author.author_id = book.author_id
	INNER JOIN supply ON book.title = supply.title
	and supply.author = author.name_author
SET
	book.amount = book.amount + supply.amount,
	supply.amount = 0
WHERE
	book.price = supply.price;

-- Insert new authors from "supply" into "author" table
INSERT INTO
	author (name_author)
SELECT
	supply.author
FROM
	author
	RIGHT JOIN supply ON author.name_author = supply.author
WHERE
	name_author IS Null;

-- Insert new titles from "supply" into "book" table
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

SELECT
	name_author AS author,
	SUM(amount) AS total_amount,
	ROUND(AVG(price), 2) AS average_price
FROM
	author
	LEFT JOIN book USING (author_id)
GROUP BY
	name_author
ORDER BY
	name_author;