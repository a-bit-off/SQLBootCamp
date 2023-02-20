WITH male_pizzeria AS (
  SELECT pizzeria.name AS pizzeria_name FROM pizzeria
  JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
  JOIN person ON person.id = person_visits.person_id
  WHERE person.gender = 'male')
,
female_pizzeria AS (
  SELECT pizzeria.name AS pizzeria_name FROM pizzeria
  JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
  JOIN person ON person.id = person_visits.person_id
  WHERE person.gender = 'female')
 
((SELECT * FROM male_pizzeria) EXCEPT ALL (SELECT * FROM female_pizzeria)) 
UNION ALL
((SELECT * FROM female_pizzeria) EXCEPT ALL (SELECT * FROM male_pizzeria))
ORDER BY pizzeria_name;