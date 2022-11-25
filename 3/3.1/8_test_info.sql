SELECT
	name_student,
	name_subject,
	date_attempt,
	ROUND(SUM(is_correct) / 3 * 100, 2) AS Результат
FROM
	student
	JOIN attempt USING(student_id)
	JOIN testing USING(attempt_id)
	JOIN answer USING(answer_id)
	JOIN question ON question.question_id = testing.question_id
	JOIN subject ON subject.subject_id = attempt.subject_id
GROUP BY
	name_student,
	name_subject,
	date_attempt
ORDER BY
	name_student,
	date_attempt DESC;