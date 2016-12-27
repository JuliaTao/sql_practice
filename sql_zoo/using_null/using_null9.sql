SELECT
  name
  ,CASE dept
    WHEN 1 THEN 'Sci'
    WHEN 2 THEN 'Sci'
    ELSE 'Art'
  END AS dept
FROM
  teacher
ORDER BY
  name;
