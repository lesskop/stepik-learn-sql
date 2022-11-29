SELECT
	name_program
FROM
	program
	JOIN program_subject ON program_subject.program_id = program.program_id
	JOIN subject ON subject.subject_id = program_subject.subject_id
WHERE
	name_subject = 'Информатика'
ORDER BY
	name_program DESC;