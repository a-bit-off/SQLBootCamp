BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;           -- Session1
SELECT SUM(rating) FROM pizzeria;                           -- Sum(rating) 21.9
SELECT SUM(rating) FROM pizzeria;                           -- Sum(rating) 19.9 => Session2 update rating Pizza Hut from 3 by 1
COMMIT WORK;                                                -- commit for Session1
SELECT SUM(rating) FROM pizzeria;                           -- Sum(rating) 19.9


BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;           -- Session2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';  	-- rating from 3 by 1
COMMIT WORK;                                                -- commit for Session2
SELECT SUM(rating) FROM pizzeria;							              -- Sum(rating) 19.9