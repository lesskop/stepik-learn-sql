SELECT
	buy_step.buy_id,
	step.name_step
FROM
	step
	JOIN buy_step ON step.step_id = buy_step.step_id
WHERE
	buy_step.date_step_beg IS NOT NULL
	AND buy_step.date_step_end IS NULL
ORDER BY
	buy_step.buy_id;