WITH tmp AS
  (SELECT
    s.id
    ,s.name
    ,o.cust_id
    ,MAX(o.amount) AS max_amount
  FROM
    salesperson s JOIN orders o
  ON
    s.id = o.salesperson_id
  GROUP BY
    s.ID
    ,s.Name
    ,o.cust_id)

SELECT
  tmp.id AS salesperson_id
  ,tmp.name AS salesperson_name
  ,tmp.cust_id
  ,c.name AS cust_name
  ,tmp.max_amount
FROM
  tmp JOIN customers c
ON
  tmp.cust_id = c.id
ORDER BY
  tmp.max_amount DESC;
