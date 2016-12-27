SELECT
  player
FROM
  game JOIN goal
ON
  id = matchid
WHERE
  stadium = 'National Stadium, Warsaw';
