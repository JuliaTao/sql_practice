-- There are two tables:
--
-- People (ID, FirstName, LastName, AddressID)
-- Addresses (ID, Street, City, State, Zip)
--
-- Find the addresses with no residents.

SELECT
  a.Street
  ,a.City
  ,a.State
  ,a.Zip
FROM
  People p RIGHT JOIN Addresses a
ON
  p.AddressID = a.ID
WHERE
  p.ID IS NULL;


-- Find the addresses with more than one resident

SELECT
  COUNT(a.ID) AS NumberResidents
  ,a.Street
  ,a.City
  ,a.State
  ,a.Zip
FROM
  People p JOIN Addresses a
ON
  p.AddressID = a.ID
GROUP BY
  a.ID
  ,a.Street
  ,a.City
  ,a.State
  ,a.Zip
HAVING
  COUNT(a.ID) >= 2;
