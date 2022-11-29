SELECT
	name_program
FROM
	program
	JOIN program_subject ON program_subject.program_id = program.program_id
	JOIN subject ON subject.subject_id = program_subject.subject_id
WHERE
	name_subject IN ('Информатика', 'Математика')
GROUP BY
	name_program
HAVING
	COUNT(name_program) = 2
ORDER BY
	name_program;