SELECT continent, name
  FROM world x
  WHERE name =
    (SELECT MIN(name)
      FROM world y
      WHERE y.continent = x.continent);
