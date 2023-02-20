BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; 	-- Session1
UPDATE pizzeria SET rating = 1 WHERE id = 1;		    -- rating1 1
UPDATE pizzeria SET rating = 3 WHERE id = 2;	    	-- rating2 3
COMMIT WORK;										                    -- commit Session1
SELECT name, rating FROM pizzeria;					        -- rating1 = 1 / rating2 3


BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; 	-- Session2
UPDATE pizzeria SET rating = 2 WHERE id = 2;		    -- rating2 2
UPDATE pizzeria SET rating = 4 WHERE id = 1;	    	-- rating1 4
COMMIT WORK;										                    -- commit Session2
SELECT name, rating FROM pizzeria;				        	-- rating2 = 3 / rating1 = 1 => value from Session1 => first Update from Session1








