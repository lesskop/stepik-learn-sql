SELECT
	name_subject,
	CONCAT(LEFT(name_question, 30), '...') AS Вопрос,
	COUNT(result) AS Всего_ответов,
	ROUND(SUM(is_correct) / COUNT(result) * 100, 2) AS Успешность
FROM
	student
	JOIN attempt USING(student_id)
	JOIN testing USING(attempt_id)
	JOIN answer USING(answer_id)
	JOIN question ON question.question_id = testing.question_id
	JOIN subject ON subject.subject_id = attempt.subject_id
GROUP BY
	name_subject,
	name_question
ORDER BY
	name_subject,
	Успешность DESC,
	name_question;