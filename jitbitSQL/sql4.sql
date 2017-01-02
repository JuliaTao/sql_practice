-- https://www.jitbit.com/news/181-jitbits-sql-interview-questions/
-- List all departments along with the number of people there

SELECT
  D.Name
  ,COUNT(E.EmployeeID) AS Count
FROM
  Employees E OUTER JOIN Deparments D
ON
  E.DepartmentID = D.DepartmentID
GROUP BY
  D.Name;
