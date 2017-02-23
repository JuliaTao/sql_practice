-- Tables:
-- Sites (ID, Name, Location)
-- Finds (ID, SiteID, Date, BoneID)
-- Bones (ID, Name)
--
-- Find the names of the top 3 sites each year for veloceraptor bones.

WITH tmp AS (SELECT
              date_part('year', f.Date) AS Year
              ,s.Name
              ,f.ID
            FROM
              Sites s
              JOIN
              Finds f
              ON s.ID = f.SiteID
              JOIN
              Bones b
              ON f.BoneID = b.ID
              WHERE
              b.name = 'veloceraptor')

SELECT
  *
FROM (SELECT
        Year
        ,Name
        ,Count
        ,RANK() OVER(PARTITION BY Year)
                     ORDER BY Count DESC) AS Rank
      FROM (SELECT
              Year
              ,Name
              ,COUNT(f.ID) AS Count
            FROM
              tmp
            GROUP BY
              Year
              ,Name) AS sub1) AS sub2
WHERE
  Rank <= 3;
