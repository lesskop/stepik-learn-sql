UPDATE
	attempt
SET
	result = (
		SELECT
			ROUND(SUM(is_correct) / 3 * 100, 0)
		FROM
			answer
			JOIN testing ON answer.answer_id = testing.answer_id
		WHERE
			attempt_id = 8
	)
WHERE
	attempt_id = 8;