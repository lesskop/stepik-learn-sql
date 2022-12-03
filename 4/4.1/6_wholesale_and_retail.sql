SELECT
	author AS Автор,
	title AS Название_книги,
	amount AS Количество,
	price AS Розничная_цена,
	IF(amount >= 10, 15, 0) AS Скидка,
	ROUND(IF(amount >= 10, price * 0.85, price), 2) AS Оптовая_цена
FROM
	book
ORDER BY
	author,
	title;