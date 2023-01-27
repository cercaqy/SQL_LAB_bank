CREATE DEFINER=`root`@`localhost` PROCEDURE `account_t_updating_balance`(t_num INT)
BEGIN
	/* Объявление переменных, куда извлекаются данные */
	DECLARE a_money FLOAT;
	DECLARE t_dt DATETIME;
	DECLARE a_from CHAR(12);
	DECLARE a_to CHAR(12);
	DECLARE r DOUBLE DEFAULT 1;

	/* Флаг для обработчика ошибок*/
	DECLARE	done INT DEFAULT 0;

	/* Обработчик ошибок */
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000'
	SET done = 1;
		
	/* Извлечение данных в соответствующие переменные */
	SELECT
		amount_of_money,
		transaction_dt,
		account_id_from,
		account_id_to,
		rate
	INTO 
		a_money,
		t_dt,
		a_from,
		a_to,
		r
	FROM transaction_t
    JOIN exchange_rate
		USING(exchange_rate_id)
	WHERE transaction_id = 	t_num;

	/* Транзакция для обновления данных в таблице account_t  */
	START TRANSACTION;
		/* Обновление данных для счета, с которого переводятся деньги */
		UPDATE account_t
			SET
				balance = balance - a_money,
				balance_dt = t_dt
			WHERE account_id = a_from;
		/* Обновление данных для счета, на который переводятся деньги */
		UPDATE account_t
			SET
				balance = balance + a_money * r,
				balance_dt = t_dt
			WHERE account_id = a_to;	
	/* Если транзакция выполнилась без ошибок, то сохраняем текущее состояние БД */
	IF done = 0 THEN COMMIT;
	/* Если при выполнении транзакции произошла ошибка, то откатываем БД до ее состояния перед началом выполнения транзакции */
	ELSE ROLLBACK;
	END IF;
END