CREATE OR REPLACE VIEW v_symmetric_union AS
    WITH R AS (
      SELECT * FROM person_visits
      WHERE visit_date = '2022.01.02'
    ),
    S AS (
      SELECT * FROM person_visits
      WHERE visit_date = '2022.01.06'
    ),
    R_sub_S AS (
      SELECT person_id FROM R
      WHERE person_id NOT IN (SELECT person_id FROM S)
    ),
    S_sub_R AS (
      SELECT person_id FROM S
      WHERE person_id NOT IN (SELECT person_id FROM R)
    )
    SELECT * FROM R_sub_S
    UNION
    SELECT * FROM S_sub_R;
