SELECT DISTINCT
  a.company
  ,a.num
FROM
  route a JOIN route b
ON
  a.num = b.num
WHERE
  a.stop = 115
  AND
  b.stop = 137;
