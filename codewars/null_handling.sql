SELECT
  id
  ,COALESCE(name, '[product name not foumd]') as name
  ,price
  ,COALESCE(card_name, '[card name not found]') as card_name
  ,card_number
  ,transaction_date
FROM
  eusales
WHERE
  price IS NOT NULL
  AND price > 50;
