SELECT
  matchid
  ,mdate
  ,COUNT(player) AS goals
FROM
  game JOIN goal
ON
  matchid = id
WHERE
  (team1 = 'POL'
  OR
  team2 = 'POL')
GROUP BY
  matchid
  ,mdate;
