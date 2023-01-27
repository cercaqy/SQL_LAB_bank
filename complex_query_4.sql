SELECT a.*

FROM account_t AS a
LEFT JOIN transaction_t AS t
	ON a.account_id = t.account_id_from
    
WHERE transaction_id IS NULL 
