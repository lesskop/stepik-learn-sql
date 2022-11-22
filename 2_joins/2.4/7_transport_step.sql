SELECT
	buy.buy_id,
	DATEDIFF(buy_step.date_step_end, buy_step.date_step_beg) AS Количество_дней,
	IF(
		DATEDIFF(buy_step.date_step_end, buy_step.date_step_beg) > city.days_delivery,
		DATEDIFF(
			buy_step.date_step_end,
			buy_step.date_step_beg
		) - city.days_delivery,
		0
	) AS Опоздание
FROM
	city
	JOIN client ON city.city_id = client.city_id
	JOIN buy ON client.client_id = buy.client_id
	JOIN buy_step ON buy.buy_id = buy_step.buy_id
WHERE
	buy_step.step_id = 3
	AND buy_step.date_step_end IS NOT NULL
ORDER BY
	buy.buy_id;