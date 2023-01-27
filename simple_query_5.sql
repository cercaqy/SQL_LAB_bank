SELECT 
	account_id,
    COUNT(*) AS changing_count
FROM account_history
WHERE YEAR(account_history_dt) = 2020 AND MONTH(account_history_dt) = 3
GROUP BY account_id