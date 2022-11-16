INSERT INTO
	book (title, author, price, amount)
SELECT
	title,
	author,
	price,
	amount
FROM
	supply
WHERE
	author not IN ('Булгаков М.А.', 'Достоевский Ф.М.');