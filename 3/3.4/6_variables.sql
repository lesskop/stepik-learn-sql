SET
	@num_pr := 0;

SET
	@row_num := 1;

UPDATE
	applicant_order AS ao
	JOIN (
		SELECT
			program_id,
			enrollee_id,
			IF(
				program_id = @num_pr,
				@row_num := @row_num + 1,
				@row_num := 1
				AND @num_pr := program_id
			) AS str_num
		from
			applicant_order
	) AS temp ON ao.program_id = temp.program_id
	AND ao.enrollee_id = temp.enrollee_id
SET
	ao.str_id = temp.str_num;