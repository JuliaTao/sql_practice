SELECT
  m.title
  ,COUNT(c.actorid) AS actors
FROM
  movie m JOIN casting c
ON
  m.id = c.movieid
WHERE
  m.yr = 1978
GROUP BY
  m.title
ORDER BY
  COUNT(c.actorid) DESC
  ,m.title;
