SELECT
  First_name
  ,to_char(joining_date, 'YYYY') AS Joining_year
  ,to_char(joining_date, 'Mon') AS Joining_mon
  ,to_char(joining_date, 'dd') AS Joining_day
FROM
  employee;

or

SELECT
  First_name
  ,YEAR(Joining_date) AS Joining_year
  ,MONTH(Joining_date) AS Joining_mon
  ,DAY(Joining_date) AS Joining_day
FROM
  employee;
