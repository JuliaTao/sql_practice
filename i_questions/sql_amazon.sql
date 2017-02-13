SELECT
  p.name
  ,SUM(total) AS total_sales
FROM
  salesperson p JOIN sales s
ON
  p.id = s.salesperson_id
LIMIT
  1
OFFSET
  1;
