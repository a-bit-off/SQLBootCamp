BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;          -- Session1
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- rating 3.6
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';    -- новое значение rating 4
COMMIT WORK;                                                -- коммит новго значения из первой ссесии, так как первый update пришел из первой сессии
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- rating 4


BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;          -- Session2
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- rating 3.6
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';  -- не удалось сериализовать доступ
COMMIT WORK;                                                -- коммит значения 4 из первой сессии
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- rating 4
