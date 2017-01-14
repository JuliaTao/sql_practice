SELECT
  p.id
  ,p.name
  ,COUNT(t.id)
FROM
  people p JOIN toys t
ON
  p.id = t.people_id
GROUP BY
  p.id
  ,p.name;
