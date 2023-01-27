SELECT 
	account_id AS 'Номер счета',
    surname AS 'Фамилия владельца счета',
    COUNT(action_h) AS 'Количество действий'
    
FROM client_t
JOIN account_t
	USING(client_id)
JOIN account_history
	USING (account_id)
    
WHERE YEAR(account_history_dt) = 2020
GROUP BY account_id