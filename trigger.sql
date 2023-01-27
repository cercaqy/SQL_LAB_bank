CREATE DEFINER=`root`@`localhost` TRIGGER `transaction_t_AFTER_INSERT` AFTER INSERT ON `transaction_t` FOR EACH ROW BEGIN
	/* Переменная, куда извлекаются данные */
	DECLARE r DOUBLE DEFAULT 1;
    
    /* Флаг для обработчика ошибок*/
    DECLARE done INT DEFAULT 0;
    
    /* Обработчик ошибок */
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000'
    SET done = 1;
    
    /* Извлечение соответствующего переводу rate в переменную r */
    SELECT rate
    INTO r
    FROM transaction_t
    JOIN exchange_rate
		USING(exchange_rate_id)
    WHERE transaction_id = new.transaction_id;
    
    IF done = 0 THEN
    
    /* Обновление данных для счета, с которого переводятся деньги */
    UPDATE account_t
			SET
				balance = balance - new.amount_of_money,
				balance_dt = new.transaction_dt
			WHERE account_id = new.account_id_from;
	
    /* Обновление данных для счета, на который переводятся деньги */
	UPDATE account_t
			SET
				balance = balance + new.amount_of_money * r,
				balance_dt = new.transaction_dt
			WHERE account_id = new.account_id_to;
	END IF;
END