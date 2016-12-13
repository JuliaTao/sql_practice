SELECT
  DISTINCT(m.title)
  ,a.name
FROM movie m
  JOIN
    casting c
  ON
    m.id = c.movieid
  JOIN
    actor a
  ON
    c.actorid = a.id
WHERE
  c.ord = 1
  AND
  m.id IN (SELECT
            movieid
          FROM
            casting
          WHERE
            actorid = (SELECT
                        id
                      FROM
                        actor
                      WHERE
                        name = 'Julie Andrews'));
