INSERT INTO
	buy_book (buy_id, book_id, amount)
SELECT
	5,
	book.book_id,
	2
FROM
	book
	JOIN author ON book.author_id = author.author_id
WHERE
	book.title = 'Лирика'
	AND author.name_author = 'Пастернак Б.Л.';

INSERT INTO
	buy_book (buy_id, book_id, amount)
SELECT
	5,
	book.book_id,
	1
FROM
	book
	JOIN author ON book.author_id = author.author_id
WHERE
	book.title = 'Белая гвардия'
	AND author.name_author = 'Булгаков М.А.';