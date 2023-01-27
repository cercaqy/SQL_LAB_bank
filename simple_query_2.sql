SELECT *
FROM client_t
WHERE CURDATE() - end_of_deal < 5
