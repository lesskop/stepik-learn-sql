SELECT
	title,
	SUM(Количество) AS Количество,
	SUM(Сумма) AS Сумма
FROM
	(
		-- Year 2019
		SELECT
			book.title,
			SUM(buy_archive.amount) AS Количество,
			SUM(buy_archive.price * buy_archive.amount) AS Сумма
		FROM
			book
			JOIN buy_archive ON book.book_id = buy_archive.book_id
		GROUP BY
			book.title
		UNION
		-- Year 2020
		SELECT
			book.title,
			SUM(buy_book.amount) AS Количество,
			SUM(buy_book.amount * book.price) AS Сумма
		FROM
			book
			JOIN buy_book ON book.book_id = buy_book.book_id
			JOIN buy_step ON buy_book.buy_id = buy_step.buy_id
		WHERE
			buy_step.step_id = 1
			AND buy_step.date_step_end IS NOT NULL
		GROUP BY
			book.title
	) union_table
GROUP BY
	title
ORDER BY
	Сумма DESC;