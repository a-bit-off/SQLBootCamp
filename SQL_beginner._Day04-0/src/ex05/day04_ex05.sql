
CREATE OR REPLACE VIEW v_price_with_discount AS
    SELECT person.name AS name,
      menu.pizza_name AS pizza_name,
      menu.price AS price,
      ROUND(price * 0.9) as discount_price
    FROM person_order 
    JOIN menu ON menu.id = person_order.menu_id
    JOIN person ON person.id = person_order.person_id
    ORDER BY name, pizza_name;
