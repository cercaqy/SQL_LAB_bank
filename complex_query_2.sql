SELECT
	account_id,
    COUNT(transaction_id) AS transactions_count
    
FROM client_t AS c
JOIN account_t AS a
	USING(client_id)
LEFT JOIN transaction_t AS t
	ON a.account_id = t.account_id_from
    
WHERE surname = 'Астафьев'
GROUP BY account_id