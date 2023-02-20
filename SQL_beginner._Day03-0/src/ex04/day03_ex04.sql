WITH male_pizzeria AS (
  SELECT pizzeria.name AS pizzeria_name FROM pizzeria
  JOIN menu ON menu.pizzeria_id = pizzeria.id
  JOIN person_order ON person_order.menu_id = menu.id
  JOIN person ON person.id = person_order.person_id
  WHERE person.gender = 'male')
,
female_pizzeria AS (
  SELECT pizzeria.name AS pizzeria_name FROM pizzeria
  JOIN menu ON menu.pizzeria_id = pizzeria.id
  JOIN person_order ON person_order.menu_id = menu.id
  JOIN person ON person.id = person_order.person_id
  WHERE person.gender = 'female')
 
((SELECT * FROM male_pizzeria) EXCEPT (SELECT * FROM female_pizzeria)) 
UNION
((SELECT * FROM female_pizzeria) EXCEPT (SELECT * FROM male_pizzeria))
ORDER BY pizzeria_name;