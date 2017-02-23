-- Tables:
--   Order (id, order_date, cust_id, salesperson_id, amount)
--   Customer (id, name, city, industry)
--   Salesperson (id, name, age, salary)
--
-- Find the largest order amount for each salesperson with order id, customer.

WITH tmp AS (SELECT
              MAX(amount) as max_amount
              ,s.id AS salesperson_id
              ,s.name AS salesperson_name
              ,o.id AS order_id
              ,o.cust_id
            FROM
              Order o JOIN Salesperson s
              ON o.salesperson_id = s.id
            GROUP BY
              ,s.id
              ,s.name)

SELECT
  t.max_amount
  ,t.salesperson_id
  ,t.salesperson_name
  ,t.order_id
  ,t.cust_id
  ,c.name AS cust_name
FROM
  tmp t JOIN Customer c
  ON t.cust_id = c.id
;
