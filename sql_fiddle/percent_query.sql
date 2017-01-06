SELECT
  (SELECT
    100 * COUNT(*)
  FROM
    accepted)
  /
  (SELECT
    COUNT(*)
  FROM
    requested) as per_accepted;
