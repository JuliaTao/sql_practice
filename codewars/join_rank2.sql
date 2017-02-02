SELECT
  p.id
  ,p.name
  ,COUNT(s.id) AS sale_count
  ,RANK() OVER(PARTITION BY p.id
               ORDER BY COUNT(s.id) DESC) AS sale_rank
FROM
  people p JOIN sales s
ON
  p.id = s.people_id
GROUP BY
  p.id
  ,p.name
ORDER BY
  sale_rank;
