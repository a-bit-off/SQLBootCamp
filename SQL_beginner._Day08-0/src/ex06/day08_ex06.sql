BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;          -- Session1
SELECT SUM(rating) FROM pizzeria;                           -- Sum(rating) 19.9
SELECT SUM(rating) FROM pizzeria;                           -- Sum(rating) 19.9 
COMMIT WORK;                                                -- commit for Session1 first update from Session2 23.9
SELECT SUM(rating) FROM pizzeria;                           -- Sum(rating) 23.9


BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;          -- Session2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';  	-- rating from 1 by 5
COMMIT WORK;                                                -- commit for Session2
SELECT SUM(rating) FROM pizzeria;							              -- Sum(rating) 23.9
