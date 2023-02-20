insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION names_proc(VARCHAR) RETURNS VARCHAR AS $$
BEGIN
  IF $1 IS NULL
    THEN RETURN 'is not defined';
    ELSIF ($1 IS NOT NULL)
      THEN RETURN $1;  
  END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION currency_trans(NUMERIC, NUMERIC, NUMERIC) RETURNS NUMERIC AS $$
BEGIN
  IF $1 IS NULL
    THEN RETURN $2 * $3;
  ELSIF $1 IS NOT NULL
    THEN RETURN $1 * $3;
  END IF;
END;
$$ LANGUAGE plpgsql;

SELECT names_proc(u.name) AS name,
  names_proc(u.lastname)  AS lastname,
  names_proc(c.name)      AS currency_name,
  (currency_trans(
    (SELECT rate_to_usd FROM currency AS c
    WHERE b.currency_id = c.id AND c.updated < b.updated
    ORDER BY c.updated DESC
    LIMIT 1),
    (SELECT rate_to_usd FROM currency AS c
    WHERE b.currency_id = c.id AND c.updated > b.updated
    ORDER BY c.updated
    LIMIT 1),
    money)
  )::real AS currency_in_usd
FROM balance AS b 
JOIN (SELECT DISTINCT c.id, c.name FROM currency AS c) AS c ON c.id = b.currency_id
LEFT JOIN "user" AS u ON u.id = b.user_id
ORDER BY 1 desc, 2, 3;
