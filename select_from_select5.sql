SELECT name, ROUND(100*(population/
  (SELECT population
    FROM world
    WHERE name = 'Germany')), 0) as percentage
  FROM world
  WHERE continent = 'Europe';
