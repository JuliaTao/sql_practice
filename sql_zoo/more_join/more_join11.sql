SELECT
  m.title
  ,a.name
FROM
  movie m
    JOIN casting c
    ON
    m.id = c.movieid
    JOIN actor a
    ON
    c.actorid = a.id
WHERE
  m.yr = 1962
  AND
  c.ord = 1;
