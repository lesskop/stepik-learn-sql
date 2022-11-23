CREATE TABLE buy_pay AS
SELECT
	book.title,
	author.name_author,
	book.price,
	buy_book.amount,
	(buy_book.amount * book.price) AS Стоимость
FROM
	author
	JOIN book ON book.author_id = author.author_id
	JOIN buy_book on book.book_id = buy_book.book_id
WHERE
	buy_book.buy_id = 5
ORDER BY
	book.title;