SELECT 	person.name AS name,
		pizza_name,
		price,
		ROUND(menu.price * (100 - person_discounts.discount) / 100) AS discount_price,
		pizzeria.name AS pizzeria_name
FROM person_discounts
JOIN person ON person.id = person_discounts.person_id
JOIN pizzeria ON pizzeria.id = person_discounts.pizzeria_id
JOIN menu ON menu.pizzeria_id = person_discounts.pizzeria_id
ORDER BY name, pizza_name;