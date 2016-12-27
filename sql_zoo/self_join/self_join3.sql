SELECT
  s.id
  ,s.name
FROM
  stops s JOIN route r
ON
  s.id = r.stop
WHERE
  r.num = 4
  AND
  r.company = 'LRT';
