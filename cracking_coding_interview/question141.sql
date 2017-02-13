-- Find tenants with more than 1 apartment
-- Tables:
-- Apartments (ApartmentID, ApartmentAddress, BuildingID)
-- Buildings (BuildingID, BuildingName, BuildingAddress)
-- TenantApartments (TenantID, ApartmentID)
-- Tenants (TenantID, TenantName, TenantAddress)

SELECT
  t.Name
  ,COUNT(ta.ApartmentID) AS NumApartments
FROM
  Tenant t JOIN TenantApartments ta
ON
  t.TenantID = ta.TenantID
GROUP BY
  t.TenantID
  ,t.Name
HAVING
  COUNT(ta.ApartmentID)
ORDER BY
  COUNT(ta.ApartmentID) DESC;
