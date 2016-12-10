SELECT
  name
FROM
  world
WHERE
  gdp >
  ALL(SELECT
        gpd
      FROM
        world
      WHERE
        continent = 'Europe'
      AND
        gpd > 0);
