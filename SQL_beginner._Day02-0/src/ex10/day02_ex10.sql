WITH table1 AS ( 
  SELECT * FROM person
)
, table2 AS ( 
  SELECT * FROM person
)
SELECT table1.name AS person_name1,
	     table2.name AS person_name2,
	  table1.address AS common_address
FROM table1
JOIN table2 ON table2.address = table1.address
WHERE table1.id > table2.id
ORDER BY person_name1, person_name2, common_address;
