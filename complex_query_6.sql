SELECT 
	client_id,
    surname,
    phone_number,
    birth_date,
    address,
    start_of_deal,
    end_of_deal
FROM transactions_count
WHERE tr_cnt = (SELECT MAX(tr_cnt)
				FROM transactions_count)