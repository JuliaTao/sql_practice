SELECT
  name
  ,CONCAT(ROUND(100*(population/
  (SELECT
    population
  FROM
    world
  WHERE
    name = 'Germany')), 0), '%')
    AS percentage
FROM
  world
WHERE
  continent = 'Europe';
