  SELECT
    'US' AS location
    ,u.id
    ,u.name
    ,u.price
    ,u.card_name
    ,u.card_number
    ,u.transaction_date
  FROM
    ussales u
  WHERE
   u.price > 50
UNION ALL
  SELECT
    'EU' AS location
    ,e.id
    ,e.name
    ,e.price
    ,e.card_name
    ,e.card_number
    ,e.transaction_date
  FROM
    eusales e
  WHERE
    e.price > 50;
