UPDATE
	fine,
	(
		SELECT
			name,
			number_plate,
			violation
		FROM
			fine
		GROUP BY
			name,
			number_plate,
			violation
		HAVING
			count(violation) >= 2
		ORDER BY
			name,
			number_plate,
			violation
	) AS query_in
SET
	fine.sum_fine = fine.sum_fine * 2
WHERE
	fine.name = query_in.name
	AND fine.number_plate = query_in.number_plate
	AND fine.violation = query_in.violation
	AND fine.date_payment IS NULL;