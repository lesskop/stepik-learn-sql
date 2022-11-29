SELECT
	name_subject,
	COUNT(result) AS Количество,
	MAX(result) AS Максимум,
	MIN(result) AS Минимум,
	ROUND(AVG(result), 1) AS Среднее
FROM
	subject
	JOIN enrollee_subject USING (subject_id)
GROUP BY
	subject_id
ORDER BY
	name_subject;