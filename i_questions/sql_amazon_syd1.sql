-- items (item_id, category, price), sales (item_id, date, num_sold)

CREATE TABLE items (item_id INT, category INT, price MONEY);
CREATE TABLE sales (item_id INT, date DATE, num_sold INT);

INSERT INTO
  items
VALUES
  (1,2,10.00)


-- 1. Number of total sales (based on num_sold column) in December by category.


WITH dec AS
(
  SELECT
    *
  FROM
    items i FULL JOIN sales s
  ON
    i.item_id = s.item_id
  WHERE
    date_part('month', date) = 12
)

SELECT
  category
  ,SUM(num_sold) AS total_sales
FROM
  dec
GROUP BY
  category;


-- 2. Make the query handle categories in which there are no sales.


WITH dec AS
(
  SELECT
    *
  FROM
    items i FULL JOIN sales s
  ON
    i.item_id = s.item_id
  WHERE
    date_part('month', date) = 12
)

SELECT
  category
  ,SUM(COALESCE(num_sold,0)) AS total_sales
FROM
  dec
GROUP BY
  category;


-- 3. What if I want to see only the sales by for December of 2016?


WITH dec AS
(
  SELECT
    *
  FROM
    items i FULL JOIN sales s
  ON
    i.item_id = s.item_id
  WHERE
    date_part('month', date) = 12
    AND
    date_part('year', date) = 2016
)

SELECT
  category
  ,SUM(COALESCE(num_sold,0)) AS total_sales
FROM
  dec
GROUP BY
  category;
