SELECT
  name
  ,CASE dept
    WHEN 1 THEN 'Sci'
    WHEN 2 THEN 'Sci'
    WHEN 3 THEN 'Art'
    ELSE 'None'
  END AS 'dept'
FROM
  teacher
ORDER BY
  name;
