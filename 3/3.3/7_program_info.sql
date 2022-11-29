SELECT
	name_department,
	name_program,
	plan,
	COUNT(program_enrollee_id) AS Количество,
	ROUND(COUNT(program_enrollee_id) / plan, 2) AS Конкурс
FROM
	department
	JOIN program USING (department_id)
	JOIN program_enrollee USING (program_id)
GROUP BY
	name_program,
	name_department,
	plan
ORDER BY
	Конкурс DESC;