UPDATE
	book,
	buy_book
SET
	book.amount = book.amount - buy_book.amount
WHERE
	buy_book.buy_id = 5
	AND book.book_id = buy_book.book_id;

select
	*
from
	book;