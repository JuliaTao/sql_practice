SELECT
  a.name as actors
FROM
  casting c JOIN actor a
ON
  c.actorid = a.id
WHERE
  c.movieid = (SELECT
                m.id
              FROM
                movie m
              WHERE
                m.title = 'Alien');
