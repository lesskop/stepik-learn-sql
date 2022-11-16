UPDATE
	fine,
	traffic_violation AS tv
SET
	fine.sum_fine = tv.sum_fine
WHERE
	fine.sum_fine IS NULL
	AND fine.violation = tv.violation;