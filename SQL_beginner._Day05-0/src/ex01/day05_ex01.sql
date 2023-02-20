SET enable_indexscan = ON;
SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT pizza_name, pizzeria.name AS pizzeria_name FROM menu
LEFT JOIN pizzeria ON pizzeria.id = menu.pizzeria_id;