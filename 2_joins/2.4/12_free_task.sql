SELECT
	YEAR(buy_archive.date_payment) as Год,
	city.name_city AS Город,
	SUM(buy_archive.amount) AS Количество_заказов
FROM
	city
	JOIN client ON client.city_id = city.city_id
	JOIN buy_archive ON client.client_id = buy_archive.client_id
GROUP BY
	Год,
	Город
UNION
SELECT
	YEAR(buy_step.date_step_end) AS Год,
	city.name_city AS Город,
	SUM(buy_book.amount) AS Количество
FROM
	book
	JOIN buy_book ON book.book_id = buy_book.book_id
	JOIN buy_step ON buy_book.buy_id = buy_step.buy_id
	JOIN buy ON buy.buy_id = buy_step.buy_id
	JOIN client ON client.client_id = buy.client_id
	JOIN city ON city.city_id = client.city_id
WHERE
	buy_step.step_id = 1
	AND buy_step.date_step_end IS NOT NULL
GROUP BY
	Год,
	Город
ORDER BY
	Количество_заказов DESC,
	Год,
	Город;