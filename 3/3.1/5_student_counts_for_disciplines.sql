SELECT
	name_subject,
	COUNT(DISTINCT student_id) AS Количество
FROM
	subject
	LEFT JOIN attempt ON subject.subject_id = attempt.subject_id
GROUP BY
	name_subject
ORDER BY
	Количество DESC,
	name_subject;