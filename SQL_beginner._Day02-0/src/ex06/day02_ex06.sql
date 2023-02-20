WITH names AS (
SELECT menu.id as menu_id, pizza_name, pizzeria.name AS pizzeria_name FROM menu
LEFT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
)
SELECT pizza_name, pizzeria_name FROM names
JOIN person_order ON names.menu_id = person_order.menu_id
JOIN person ON person_order.person_id = person.id
WHERE person.name = 'Denis' OR person.name = 'Anna'
ORDER BY pizza_name, pizzeria_name;