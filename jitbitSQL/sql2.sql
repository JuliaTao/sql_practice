-- https://www.jitbit.com/news/181-jitbits-sql-interview-questions/
-- List employees who have the biggest salary in their departments

SELECT
  Name
  ,DepartmentID
  ,Salary
FROM
  Employees
WHERE
  Salary IN (SELECT
              MAX(Salary)
            FROM
              Employees
            GROUP BY
              DepartmentID);
