SELECT
  RANK() OVER (ORDER BY SUM(points) DESC) AS rank
  ,CASE WHEN clan = 'none' THEN '[no clan specified]'
  ELSE clan
  END AS clan
  ,SUM(points) AS total_points
  ,COUNT(name) AS total_people
FROM
  people
GROUP BY
  clan
ORDER BY
  rank;
