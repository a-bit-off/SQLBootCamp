BEGIN TRANSACTION;                                          -- Session1
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- rating 5
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';    -- новое значение rating 4
COMMIT WORK;                                                -- коммит новго значения из второй ссесии, так как последний update пришел из второй сессии
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- rating 3.6


BEGIN TRANSACTION;                                          -- Session2
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- rating 5
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';  -- rating 3.6
COMMIT WORK;                                                -- коммит значения 3.6
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- rating 3.6