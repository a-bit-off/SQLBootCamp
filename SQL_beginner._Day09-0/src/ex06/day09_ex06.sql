CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
										IN pperson varchar DEFAULT 'Dmitriy',
										IN pprice int DEFAULT 500,
										IN pdate date DEFAULT '2022-01-08')
RETURNS TABLE (pizzeria_name varchar)
AS $$
	SELECT DISTINCT pizzeria.name FROM pizzeria
	JOIN menu ON menu.pizzeria_id = pizzeria.id
	JOIN person_order ON person_order.menu_id = menu.id
	JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
	JOIN person ON person.id = person_order.person_id
	WHERE person.name = pperson
				AND menu.price < pprice
				AND person_order.order_date = pdate
				AND person_visits.visit_date = pdate;
$$ LANGUAGE sql;

select * from fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');

select * from fnc_person_visits_and_eats_on_date(pprice := 800);