INSERT INTO person_visits
VALUES ((SELECT MAX(id) + 1 FROM person_visits), 
        (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT pizzeria.id FROM pizzeria
        JOIN menu ON menu.pizzeria_id = pizzeria.id
        WHERE menu.price < 800
        LIMIT 1),
        '2022.01.11');
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;