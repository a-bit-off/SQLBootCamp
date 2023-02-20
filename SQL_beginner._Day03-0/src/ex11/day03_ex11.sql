UPDATE menu
SET price = ROUND(price * 0.9)
WHERE menu.pizza_name = 'greek pizza';