CREATE TABLE buy_pay AS
SELECT
	buy_book.buy_id,
	SUM(buy_book.amount) AS Количество,
	SUM(buy_book.amount * book.price) AS Итого
FROM
	book
	JOIN buy_book on book.book_id = buy_book.book_id
WHERE
	buy_book.buy_id = 5
GROUP BY
	buy_id;