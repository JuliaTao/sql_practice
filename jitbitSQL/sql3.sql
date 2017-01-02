-- https://www.jitbit.com/news/181-jitbits-sql-interview-questions/
-- List departments that have less than 3 people in it

SELECT
  D.Name
  ,COUNT(E.EmployeeID) As Count
FROM
  Employees E LEFT JOIN Departments D
ON
  E.DepartmentID = D.DepartmentID
GROUP BY
  D.Name
HAVING
  COUNT(E.EmployeeID) < 3;
