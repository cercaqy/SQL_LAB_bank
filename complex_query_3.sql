SELECT *
FROM client_t
WHERE birth_date = (SELECT MAX(birth_date)
					FROM client_t)
                    