SELECT
  DISTINCT(a.name)
FROM
  casting c JOIN actor a
ON
  c.actorid = a.id
WHERE
  a.name <> 'Art Garfunkel'
  AND
  c.movieid IN (SELECT
                  movieid
                FROM
                  casting
                WHERE
                  actorid = (SELECT
                               id
                             FROM
                               actor
                             WHERE
                               name = 'Art Garfunkel'))
ORDER BY
  a.name;
