-- https://www.jitbit.com/news/181-jitbits-sql-interview-questions/
-- List employees (names) who have a bigger salary than their boss

SELECT
  E.Name
  ,E.Salary AS Emp_Sal
  ,B.Salary AS Boss_Sal
FROM
  Employees E LEFT JOIN Employees B
ON
  E.BossID = B.EmployeeID
WHERE
  E.Salary > B.Salary
ORDER BY
  E.Name;
