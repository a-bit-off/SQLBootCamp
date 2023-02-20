WITH menu_cte AS (
  SELECT id AS menu_id FROM menu
  EXCEPT
  SELECT menu_id FROM person_order
  ORDER BY menu_id
)
SELECT DISTINCT pizza_name, price, pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
JOIN person_order ON person_order.menu_id = menu.pizzeria_id
JOIN menu_cte ON menu_cte.menu_id = menu.id
ORDER BY pizza_name, price;