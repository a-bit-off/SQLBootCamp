BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;             -- Session1
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- rating 3.6
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- rating 3.6 nothing update
COMMIT WORK;                                                -- commit for Session1 last vertion from Session2
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- rating 3 from Session2

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;             -- Session2
UPDATE pizzeria SET rating = 3 WHERE name = 'Pizza Hut';    -- rating from 3.6 by 3
COMMIT WORK;                                                -- commit for Session2
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- rating 3