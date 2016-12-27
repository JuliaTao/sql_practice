SELECT
  t.name
  ,d.name
FROM
  dept d LEFT JOIN teacher t
ON
  d.id = t.dept
ORDER BY
  d.name,
  t.name;
