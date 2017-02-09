-- find total sales

SELECT
  sales_person
  ,SUM(sales) AS total_sales
FROM
  total_sales
GROUP BY
  sales_person;

-- find most recent sales

SELECT
  sales_person
  MAX(sale_date) AS last_sale
FROM
  total_sales
GROUP BY
  sales_person;
