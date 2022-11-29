SELECT
	DISTINCT name_enrollee
FROM
	enrollee
	JOIN program_enrollee ON enrollee.enrollee_id = program_enrollee.enrollee_id
	JOIN program ON program.program_id = program_enrollee.program_id
WHERE
	name_program = 'Мехатроника и робототехника'
ORDER BY
	name_enrollee;