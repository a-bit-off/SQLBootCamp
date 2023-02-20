WITH andrey_visit AS (
    SELECT pizzeria.name AS pizza_name
    FROM pizzeria
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person.id = person_visits.person_id
    WHERE person.name = 'Andrey')
,
andrey_order AS (
    SELECT pizzeria.name AS pizza_name
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
    WHERE person.name = 'Andrey')

SELECT pizza_name FROM andrey_visit
EXCEPT
SELECT pizza_name FROM andrey_order;