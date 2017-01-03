-- http://www.programmerinterview.com/index.php/database-sql/practice-interview-question-1/
-- The names of all salespeople that do not have any order with Samsonic.

SELECT
  Name
FROM
  Salesperson
WHERE
  Name NOT IN (SELECT DISTINCT
                s.name
              FROM
                Salesperson S
                JOIN Orders O
                  ON
                    S.ID = O.salesperson_id
                JOIN Customers C
                  ON
                    O.cust_id = C.ID
              WHERE
                C.Name = 'Samsonic');
