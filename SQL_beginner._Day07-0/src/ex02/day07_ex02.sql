WITH count_of_visits AS (
	SELECT pizzeria.name AS name, COUNT(*) AS count, CONCAT('visit') AS action_type
	FROM person_visits
	JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
	GROUP BY name
	ORDER BY count DESC, name
),
count_of_orders AS (
	SELECT pizzeria.name AS name, COUNT(*) AS count, CONCAT('order') AS action_type
	FROM person_order
	JOIN menu ON menu.id = person_order.menu_id
	JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
	GROUP BY name
	ORDER BY count DESC, name
)
SELECT * FROM count_of_visits
UNION ALL 
SELECT * FROM count_of_orders
ORDER BY action_type, count DESC;