WITH table_menu AS (
  SELECT id AS menu_id, pizzeria_id, pizza_name, price FROM menu
),
table1 AS (
  SELECT * FROM (SELECT id AS menu_id, pizzeria_id, pizza_name, price FROM menu) AS table0
  JOIN pizzeria ON pizzeria.id = table0.pizzeria_id
),
table2 AS (
  SELECT * FROM (SELECT id AS menu_id, pizzeria_id, pizza_name, price FROM menu) AS table0
  JOIN pizzeria ON pizzeria.id = table0.pizzeria_id
)
SELECT DISTINCT table1.pizza_name AS pizza_name,
             table1.name AS pizzeria_name_1,
             table2.name AS pizzeria_name_2,
            table1.price AS price
FROM table1
JOIN table2 ON table2.pizza_name = table1.pizza_name
WHERE table1.menu_id > table2.menu_id AND
      table1.price = table2.price
ORDER BY pizza_name;