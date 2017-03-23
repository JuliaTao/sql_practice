SELECT
  s.id
  ,s.name
  ,COUNT(*)
FROM
  salesperson s JOIN orders o
ON
  s.id = o.salesperson_id
GROUP BY
  s.id
  ,s.name
HAVING
  COUNT(*) > 1
ORDER BY
  COUNT(*) DESC;
