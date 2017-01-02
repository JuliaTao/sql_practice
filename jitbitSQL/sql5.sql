-- https://www.jitbit.com/news/181-jitbits-sql-interview-questions/
-- List employees that don't have a boss in the same department

SELECT
  E.Name
FROM
  Employees E LEFT JOIN Employees B
ON
  E.BossID = B.EmployeeID
WHERE
  E.DepartmentID != B.DepartmentID;
