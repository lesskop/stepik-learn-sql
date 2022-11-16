SELECT
	name,
	city,
	date_first,
	(DATEDIFF(date_last, date_first) + 1) * per_diem AS Сумма
FROM
	trip
WHERE
	YEAR(date_first) = 2020
	AND MONTH(date_first) in (2, 3) -- or AND MONTHNAME(date_first) in ('February', 'March')
ORDER BY
	name,
	Сумма DESC;