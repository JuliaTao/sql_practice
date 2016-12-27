SELECT
  SUM(population)
FROM
  world
WHERE
  name IN ('France'
          ,'Germany'
          ,'Spain');
