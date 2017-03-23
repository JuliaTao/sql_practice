SELECT
  COUNT(*) AS num_emp
  ,e.hourly_rate
  ,s.city
FROM
  starbucks_emp e JOIN starbucks_stores s
ON
  e.store_id = s.store_id
GROUP BY
  e.hourly_rate
  s.city
ORDER BY
  COUNT(*) DESC;
