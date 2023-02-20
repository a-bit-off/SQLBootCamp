with value_eur AS (
  SELECT * FROM currency
  WHERE name = 'EUR'
  ORDER BY updated DESC
  LIMIT 1
),
value_usd AS (
  SELECT * FROM currency
  WHERE name ='USD'
  ORDER BY updated DESC
  LIMIT 1
),
value_jpy AS (
  SELECT * FROM currency
  WHERE name ='JPY'
  ORDER BY updated DESC
  LIMIT 1
),
max_result AS (
  SELECT * FROM value_eur
  UNION
  SELECT * FROM value_usd
  UNION
  SELECT * FROM value_jpy
)

SELECT 
  (CASE
    WHEN "user".name IS NULL THEN 'not defined'
    WHEN "user".name IS NOT NULL THEN "user".name
  END) AS name,

  (CASE
    WHEN "user".lastname IS NULL THEN 'not defined'
    WHEN "user".lastname IS NOT NULL THEN "user".lastname
  END) AS lastname,

  balance.type,
  sum(balance.money) AS volume,

  (CASE
    WHEN max_result.name IS NULL THEN 'not defined'
    WHEN max_result.name IS NOT NULL THEN max_result.name
  END) AS currency_name,

  (CASE
    WHEN max_result.rate_to_usd IS NULL THEN 1
    WHEN max_result.rate_to_usd IS NOT NULL THEN max_result.rate_to_usd
  END) AS last_rate_to_usd,

  (CASE
    WHEN max_result.rate_to_usd IS NULL THEN 1 * sum(balance.money)
    WHEN max_result.rate_to_usd IS NOT NULL THEN max_result.rate_to_usd * sum(balance.money)
  END)::real AS total_volume_in_usd

FROM "user"
FULL JOIN balance ON balance.user_id = public."user".id
FULL JOIN max_result ON balance.currency_id = max_result.id
GROUP BY "user".name, "user".lastname, balance.type, currency_name, max_result.rate_to_usd
ORDER BY 1 DESC, 2, 3;
