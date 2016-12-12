SELECT
  a.name
FROM
  casting c JOIN actor a
ON
  c.actorid = a.id
WHERE
  c.movieid = 11768;
