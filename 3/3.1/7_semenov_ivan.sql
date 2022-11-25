SELECT
	question.name_question,
	answer.name_answer,
	IF(answer.is_correct = 1, 'Верно', 'Неверно') AS Результат
FROM
	question
	JOIN testing ON question.question_id = testing.question_id
	JOIN answer ON answer.answer_id = testing.answer_id
WHERE
	testing.attempt_id = 7;