SELECT
  d.name
  ,COUNT(t.name) AS count
FROM
  dept d LEFT JOIN teacher t
ON
  d.id = t.dept
GROUP BY
  d.name;
