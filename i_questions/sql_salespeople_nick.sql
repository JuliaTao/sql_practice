-- Tables:
-- salesperson (id, name)
-- sales (id, salesperson_id, item_id, date, amount)
-- item (id, price)
--
-- 1. Find the date of the most recent sale for each salesperson.

SELECT
  p.id
  ,p.name
  ,MAX(s.date)
FROM
  salesperson p JOIN sale s
ON
  p.id = s.salesperson_id
GROUP BY
  p.id
  ,p.name;


-- 2. Find each salesperson's total sales in dollars for 2017.

WITH tmp AS
  (SELECT
    p.id
    ,p.name
    ,(s.amount * i.price) AS sale
  FROM
    salesperson p
    JOIN
    sale s
    ON
      p.id = s.salesperson_id
    JOIN
    item i
    ON
      s.item_id = i.id
    WHERE
      date_part('year', s.date) = 2017)

SELECT
  id
  ,name
  ,SUM(sale) AS total
FROM
  tmp
GROUP BY
  id
  ,name
ORDER BY
  total DESC;
