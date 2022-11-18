SELECT
	title AS Название,
	name_author AS Автор,
	book.amount + supply.amount AS Количество
FROM
	book
	JOIN author USING (author_id)
	JOIN supply USING (title, price);