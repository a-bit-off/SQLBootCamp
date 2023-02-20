SELECT pizzeria.name AS name, COUNT(menu_id) AS count_of_orders,
	ROUND(SUM(price) / COUNT(price), 2) AS average_price,
	MAX(price) AS max_price,
	MIN(price) AS min_price
FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
JOIN person_order ON person_order.menu_id = menu.id
GROUP BY name
ORDER BY name;
