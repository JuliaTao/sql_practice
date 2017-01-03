-- http://www.programmerinterview.com/index.php/database-sql/practice-interview-question-1/
-- The names of all salespeople that do not have any order with Samsonic.

SELECT DISTINCT
  S.Name
FROM
  Salesperson S LEFT JOIN Orders O
ON
  S.ID = O.salesperson_id
WHERE
  O.cust_id NOT IN (SELECT
                      C.ID
                    FROM
                      Cusomter C
                    WHERE
                      C.Name = "Samsonic");
