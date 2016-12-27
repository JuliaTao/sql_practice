SELECT
  m.title AS movie
FROM
  movie m JOIN casting c
ON
  m.id = c.movieid
WHERE
  c.ord <> 1
  AND
  c.actorid = (SELECT
                id
              FROM
                actor a
              WHERE a.name = 'Harrison Ford');
