-- Tables:
-- shippers(driver_id, carrier_id, truck_type, has_app, time_to_accept)
-- shipments(shipment_id, driver_id, origin, dest, ttc, ttt)
--
-- 1. Find number of lanes for each truck type, origin and destination.

WITH tmp AS
  (SELECT
    a.truck_type
    ,b.origin
    ,b.dest
  FROM
    shippers a JOIN shipments b
  ON
  a.driver_id = b.driver_id)

SELECT
  truck_type
  ,origin
  ,dest
  ,COUNT(*)
FROM
  tmp
GROUP BY
  truck_type
  ,origin
  ,dest;

-- 2. Percent of shipments made with app.

WITH
has AS
  (SELECT
    COUNT(*)
  FROM
    shippers a JOIN shipments B
  WHERE
    has_app =1)
,all_ship AS
  (SELECT
    COUNT(*)
  FROM
    shippments)

SELECT (
  (SELECT * FROM has) * 100 / (SELECT * FROM all_ship)
);

-- 3. Data for scatter plot of time to accept vs margin.

WITH tmp AS
  (SELECT
    MEAN(b.ttc) AS ttc
    ,MEAN(b.ttt) AS ttt
    ,MEAN(a.time_to_accept) AS time_to_accept
  FROM
    shippers a JOIN shipments b
  ON
    a.driver_id = b.driver_id
  GROUP BY
    a.carrier_id)

SELECT
  ((ttc - ttt) / ttt) AS margin
  ,time_to_accept
  ,carrier_id
FROM
  tmp;
