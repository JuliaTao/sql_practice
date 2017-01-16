SELECT
  s.transaction_date::DATE AS day
  ,d.name AS department
  ,COUNT(s.id) AS sale_count
FROM
  department d JOIN sale s
ON
  d.id = s.department_id
GROUP BY
  department
  ,day
ORDER BY
  d.name;
