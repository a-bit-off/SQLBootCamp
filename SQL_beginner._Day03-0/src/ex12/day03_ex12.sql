WITH count_id AS (
  SELECT COUNT(DISTINCT person_id) FROM person_order
),
count_id_max AS (
  SELECT MAX(id) + (SELECT * FROM count_id) FROM person_order
),
new_orders AS (
  SELECT
      (generate_series((SELECT MAX(id) + 1 FROM person_order), (SELECT * FROM count_id_max))) AS id,
      (generate_series(1, (SELECT * FROM count_id))) AS person_id,
      (menu.id) AS menu_id,
      (CAST('2022.02.25' AS DATE)) AS order_date
  FROM menu
  WHERE pizza_name = 'greek pizza'
)
INSERT INTO person_order
((SELECT * FROM new_orders));
