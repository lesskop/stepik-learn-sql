SELECT
	program.name_program,
	enrollee.name_enrollee,
	SUM(enrollee_subject.result) AS itog
FROM
	enrollee
	JOIN enrollee_subject ON enrollee.enrollee_id = enrollee_subject.enrollee_id
	JOIN subject ON subject.subject_id = enrollee_subject.subject_id
	JOIN program_subject ON subject.subject_id = program_subject.subject_id
	JOIN program ON program.program_id = program_subject.program_id
	JOIN program_enrollee ON program.program_id = program_enrollee.program_id
	AND enrollee.enrollee_id = program_enrollee.enrollee_id
GROUP BY
	program.name_program,
	enrollee.name_enrollee
ORDER BY
	program.name_program,
	itog DESC;