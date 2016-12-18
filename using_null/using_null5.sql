SELECT
  name
  ,COALESCE(mobile, '07986 444 2266') AS mobile
FROM
  teacher
ORDER BY
  name;
