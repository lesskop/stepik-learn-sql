UPDATE
	book
	JOIN author USING (author_id)
	JOIN supply ON book.title = supply.title
	and supply.author = author.name_author
SET
	book.amount = book.amount + supply.amount,
	supply.amount = 0,
	book.price = (
		book.price * book.amount + supply.price * supply.amount
	) / (book.amount + supply.amount)
WHERE
	book.price <> supply.price;