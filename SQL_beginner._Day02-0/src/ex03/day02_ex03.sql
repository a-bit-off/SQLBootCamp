WITH dates AS (
  SELECT CAST(d AS DATE) AS missing_date
  FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') d
),
dates_visit AS (
  SELECT visit_date FROM person_visits
  WHERE (person_id = 1 OR person_id = 2) AND 
    visit_date BETWEEN '2022-01-01' AND '2022-01-10'
)
SELECT missing_date FROM dates
LEFT JOIN dates_visit ON dates.missing_date = dates_visit.visit_date
WHERE dates_visit.visit_date IS NULL
ORDER BY missing_date;
