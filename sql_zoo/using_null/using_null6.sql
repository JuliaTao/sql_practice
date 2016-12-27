SELECT
  t.name
  ,COALESCE(d.name, 'None') as dept
FROM
  teacher t LEFT JOIN dept d
ON
  t.dept = d.id
ORDER BY
  d.name,
  t.name;
