WITH t1 AS (
	SELECT address,
			ROUND(MAX(age) -  CAST(MIN(age) AS DEC(4, 2)) / MAX(age), 2) AS formula,
			ROUND(AVG(age), 2) AS average
	FROM person
	GROUP BY address
	ORDER BY address
)
SELECT address, formula, average, formula > average AS comparison
FROM t1;