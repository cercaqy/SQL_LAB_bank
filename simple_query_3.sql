SELECT 
	client_id,
    COUNT(account_id) AS accounts_count
FROM account_t
GROUP BY client_id
