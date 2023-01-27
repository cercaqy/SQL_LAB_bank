SELECT a.*

FROM account_t AS a
LEFT JOIN (SELECT *
		   FROM transaction_t
           WHERE transaction_dt LIKE '2020-03%') AS t
ON a.account_id = t.account_id_from
WHERE transaction_id IS NULL
