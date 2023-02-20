SELECT person_order.order_date AS order_date,
  CONCAT(name, ' (age:', age, ')') AS person_information FROM person
NATURAL JOIN (SELECT order_date, person_id AS id FROM person_order) AS person_order
ORDER BY order_date, person_information;