SELECT CAST(dates AS DATE) AS missing_date
FROM generate_series('2022.01.01', '2022.01.10', interval '1 day') dates
LEFT JOIN
    (SELECT visit_date FROM person_visits
    WHERE (person_id = 1 OR person_id = 2) AND 
    visit_date BETWEEN '2022.01.01' AND '2022.01.10') AS dates_visit
  ON dates = dates_visit.visit_date
WHERE dates_visit.visit_date IS NULL
ORDER BY missing_date;