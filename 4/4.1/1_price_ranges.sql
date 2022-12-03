SELECT
	beg_range,
	end_range,
	ROUND(AVG(price), 2) AS Средняя_цена,
	ROUND(SUM(price * amount), 2) AS Стоимость,
	COUNT(*) AS Количество
FROM
	(
		SELECT
			beg_range,
			end_range,
			price,
			amount
		FROM
			book
			CROSS JOIN stat
		WHERE
			price >= beg_range
			AND price < end_range
	) temp_table
GROUP BY
	beg_range,
	end_range
ORDER BY
	beg_range;