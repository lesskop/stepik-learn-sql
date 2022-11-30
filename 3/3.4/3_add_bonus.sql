UPDATE
	applicant
	JOIN (
		SELECT
			enrollee_id,
			IFNULL(SUM(bonus), 0) AS Бонус
		FROM
			enrollee_achievement
			JOIN achievement USING (achievement_id)
		GROUP BY
			enrollee_id
	) AS temp USING(enrollee_id)
SET
	itog = itog + Бонус;