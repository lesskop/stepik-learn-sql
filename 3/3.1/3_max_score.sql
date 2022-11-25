SELECT
	student.name_student,
	attempt.result
FROM
	student
	JOIN attempt ON student.student_id = attempt.student_id
WHERE
	attempt.result = (
		SELECT
			result
		FROM
			attempt
		ORDER BY
			result DESC
		LIMIT
			1
	)
ORDER BY
	student.name_student;