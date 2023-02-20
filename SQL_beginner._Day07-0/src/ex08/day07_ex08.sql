SELECT person.address AS address, pizzeria.name AS name, COUNT(menu_id) AS count_of_orders
FROM person_order
JOIN person ON person.id = person_order.person_id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY address, pizzeria.name
ORDER BY address, pizzeria.name;