SELECT
	MONTH(start_of_deal) AS deal_month,
    COUNT(*) AS clients_count
FROM client_t
WHERE YEAR(start_of_deal) = 2020 AND MONTH(start_of_deal) <= 6
GROUP BY MONTH(start_of_deal)
