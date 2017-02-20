-- Tables:
-- Orders (ID, CustomerID, CreatedAt, FulfilledAt)
-- OrderItems (ID, OrderID, ItemID, Quantity)
-- Items (ID, Price)
-- Customers (ID, Name, Address, City, State, Zip)

-- 1. Sales in Feb 2017?

SELECT
  SUM(i.Price * oi.Quantity) AS Sales_2_2017
FROM
  Orders o
  JOIN
  OrderItems oi
  ON o.ID = oi.OrderID
  JOIN
  Items i
  ON oi.ItemID = i.ID
WHERE
  date_part('month', o.FulfilledAt) =  2
  AND
  date_part('year', o.FulfilledAt) = 2017;


-- 2. Sales by month in 2016?

SELECT
  SUM(i.Price * oi.Quantity) AS Sales_2016
  ,date_part('month', o.FulfilledAt) AS Month
FROM
  Orders o
  JOIN
  OrderItems oi
  ON o.ID = oi.OrderID
  JOIN
  Items i
  ON oi.ItemID = i.ID
WHERE
  date_part('year', o.FulfilledAt) = 2016
GROUP BY
  date_part('month', o.FulfilledAt);


-- 3. Top 3 customers by state in 2016?

WITH tmp AS
(SELECT
  c.State
  c.ID AS CustomerID
  ,SUM(i.Price * oi.Quantity) AS Sales_2016
FROM
  Orders o
  JOIN
  OrderItems oi
  ON o.ID = oi.OrderID
  JOIN
  Items i
  ON oi.ItemID = i.ID
  JOIN
  Customers c
  ON o.CustomerID =  c.ID
WHERE
  date_part('year', o.FulfilledAt) = 2016
GROUP BY
  c.State
  ,c.ID)

SELECT
  *
FROM
  (SELECT
    State
    ,CustomerID
    ,Sales_2016
    ,RANK() OVER(PARTITION BY State
                ORDER BY Sales_2016 DESC) AS Rank
    FROM
      tmp) AS sub
WHERE
  Rank <= 3;
