SELECT
  c.name AS company_name
  ,p.id
  ,p.name
  ,p.isbn
  ,p.company_id
  ,p.price
FROM
  products p JOIN companies c
ON
  p.company_id = c.id;
