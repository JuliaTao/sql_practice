SELECT
  teamname
  ,COUNT(player) AS goals
FROM
  eteam JOIN goal
ON
  id=teamid
GROUP BY
  teamname
ORDER BY
  COUNT(player);
