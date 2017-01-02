SELECT
  D.Name
  ,SUM(E.Salary) AS Total_Dept_Sal
FROM
  Employees E OUTER JOIN Departments D
ON
  E.DepartmentID = D.DepartmentID
GROUP BY
  D.Name;
