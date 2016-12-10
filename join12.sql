SELECT matchid, mdate, COUNT(player) as goals
  FROM game JOIN goal
  ON id = matchid
  WHERE teamid = 'GER'
  GROUP BY matchid, mdate;
