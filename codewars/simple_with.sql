WITH
  special_sales AS (SELECT
                      *
                    FROM
                      sales
                    WHERE
                      price IN (SELECT
                                  price
                                FROM
                                  sales
                                WHERE
                                  price > 90)
                                )
SELECT * FROM special_sales;
