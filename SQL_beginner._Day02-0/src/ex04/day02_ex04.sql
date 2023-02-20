SELECT pizza_name, pizzeria.name as pizzeria_name, price FROM menu
LEFT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name;