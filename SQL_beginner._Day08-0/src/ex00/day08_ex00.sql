BEGIN;                                                      -- Session1
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';    -- изменение рейтинга 4.6 на 5
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- вывод 5
COMMIT WORK;                                                -- коммит изменений

-- Session2
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- 4.6 никаких изменений
SELECT name, rating FROM pizzeria WHERE name = 'Pizza Hut'; -- изменение рейтинга 4.6 на 5 за счет коммита