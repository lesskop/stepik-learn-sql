DELETE FROM
	applicant
WHERE
	(program_id, enrollee_id) IN (
		SELECT
			program.program_id,
			enrollee.enrollee_id
		FROM
			program
			JOIN program_subject USING (program_id)
			JOIN enrollee_subject USING (subject_id)
			JOIN enrollee USING (enrollee_id)
			JOIN program_enrollee ON program_enrollee.program_id = program.program_id
			AND enrollee.enrollee_id = program_enrollee.enrollee_id
		WHERE
			result < min_result
		GROUP BY
			program.program_id,
			enrollee.enrollee_id
	);