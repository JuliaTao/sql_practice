SELECT stadium, COUNT(player) AS goals
  FROM game JOIN goal
  ON id = matchid
  GROUP BY stadium
  ORDER BY goals;
