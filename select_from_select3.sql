SELECT name, continent
  FROM world
  WHERE continent IN
    (SELECT continent
      FROM world
      WHERE name IN ('Australia', 'Argentina'))
  ORDER BY name;
