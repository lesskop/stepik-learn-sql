SELECT
	author AS Автор,
	COUNT(title) as Различных_книг,
	SUM(amount) AS Количество_экземпляров
FROM
	book
GROUP BY
	author;