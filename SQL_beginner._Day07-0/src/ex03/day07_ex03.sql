WITH count_of_visits AS (
	SELECT pizzeria.name AS name, COUNT(*) AS count
	FROM person_visits
	JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
	GROUP BY name
	ORDER BY count DESC, name
),
count_of_orders AS (
	SELECT pizzeria.name AS name, COUNT(*) AS count
	FROM person_order
	JOIN menu ON menu.id = person_order.menu_id
	JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
	GROUP BY name
	ORDER BY count DESC, name
),
t1 AS (
	SELECT * FROM count_of_visits
	UNION
	SELECT * FROM count_of_orders
)
SELECT name, SUM(count) AS totatl_count FROM t1
GROUP BY name
ORDER BY totatl_count DESC, name ASC;