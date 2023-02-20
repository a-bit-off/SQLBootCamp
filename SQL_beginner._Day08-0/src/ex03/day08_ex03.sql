BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;           -- Session1
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- rating 4
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- rating 3.6 => Update Session2
COMMIT WORK;                                                -- commit for Session1
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- rating 3.6

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;           -- Session2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';  -- rating from 4 by 3.6
COMMIT WORK;                                                -- commit for Session2
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- rating 3.6