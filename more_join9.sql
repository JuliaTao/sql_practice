SELECT
  m.title AS movies
FROM
  movie m JOIN casting c
ON
  m.id = c.movieid
WHERE
  c.actorid = (SELECT
                a.id
              FROM
                actor a
              WHERE
                a.name = 'Harrison Ford');
