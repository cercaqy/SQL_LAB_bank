CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `transactions_count` AS
    SELECT 
        `c`.`client_id` AS `client_id`,
        `c`.`surname` AS `surname`,
        `c`.`phone_number` AS `phone_number`,
        `c`.`birth_date` AS `birth_date`,
        `c`.`address` AS `address`,
        `c`.`start_of_deal` AS `start_of_deal`,
        `c`.`end_of_deal` AS `end_of_deal`,
        COUNT(`t`.`transaction_id`) AS `tr_cnt`
    FROM
        ((`client_t` `c`
        JOIN `account_t` `a` ON ((`c`.`client_id` = `a`.`client_id`)))
        JOIN `transaction_t` `t` ON ((`a`.`account_id` = `t`.`account_id_from`)))
    WHERE
        (YEAR(`t`.`transaction_dt`) = 2020)
    GROUP BY `c`.`client_id`