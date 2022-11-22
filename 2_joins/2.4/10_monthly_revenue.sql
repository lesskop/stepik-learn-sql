-- Year 2020
SELECT
	YEAR(date_step_end) AS Год,
	MONTHNAME(date_step_end) AS Месяц,
	SUM(book.price * buy_book.amount) AS Сумма
FROM
	buy_step
	JOIN buy_book USING (buy_id)
	JOIN book USING (book_id)
WHERE
	step_id = 1
	AND date_step_end IS NOT NULL
GROUP BY
	Год,
	Месяц
UNION
-- Year 2019
SELECT
	YEAR(date_payment) AS Год,
	MONTHNAME(date_payment) AS Месяц,
	SUM(price * amount) AS Сумма
FROM
	buy_archive
GROUP BY
	Год,
	Месяц
ORDER BY
	Месяц,
	Год;