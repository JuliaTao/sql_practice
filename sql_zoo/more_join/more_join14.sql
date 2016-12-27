SELECT
  a.name
FROM
  casting c JOIN actor a
ON
  c.actorid = a.id
WHERE
  c.ord = 1
GROUP BY
  a.name
HAVING
  COUNT(c.ord) >= 30;
