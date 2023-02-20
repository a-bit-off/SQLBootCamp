WITH allFemale AS (
	SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name, person.name
	FROM person_order
	LEFT JOIN person ON person.id = person_id
	LEFT JOIN menu ON menu.id = menu_id
	LEFT JOIN pizzeria ON pizzeria.id = pizzeria_id
	WHERE person.gender = 'female'
)
SELECT DISTINCT name
FROM allFemale
WHERE name IN (SELECT name FROM allFemale WHERE pizza_name = 'cheese pizza') AND 
      name IN (SELECT name FROM allFemale WHERE pizza_name = 'pepperoni pizza')
ORDER BY name;