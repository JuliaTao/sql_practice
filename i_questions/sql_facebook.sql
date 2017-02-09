-- Make table

CREATE TABLE accepted
 (recieverid int
  ,senderid int)
;

INSERT INTO
  accepted
VALUES
  (9,1)
  ,(9,2)
  ,(9,3)
  ,(4,9)
  ,(5,9)
  ,(6,9)
  ,(1,2)
  ,(1,3)
  ,(1,4)
  ,(5,1)
;


-- What percentage of friend requests have been accepted?


SELECT (
  (SELECT 100 * COUNT(*) FROM accepted) /
  (SELECT COUNT(*) FROM requested)
) AS per_accepted;


-- Who has the most friends on facebook?


WITH
  sent AS (SELECT
            senderid AS id
            ,COUNT(receiverid) AS total
          FROM
            accepted
          GROUP BY
            id)
  ,rcv AS (SELECT
            receiverid AS id
            ,COUNT(senderid) AS total
          FROM
            accepted
          GROUP BY
            id)

SELECT
  s.id
  ,COALESCE((s.total + r.total), 0) AS friends
FROM
  sent s FULL JOIN rcv r
ON
  s.id = r.id
ORDER BY
  friends DESC
LIMIT 1;


-- Union all


WITH
  sent AS (SELECT
            senderid AS id
            ,COUNT(receiverid) AS total
          FROM
            accepted
          GROUP BY
            id)
  ,rcv AS (SELECT
            receiverid AS id
            ,COUNT(senderid) AS total
          FROM
            accepted
          GROUP BY
            id)

SELECT
  id
  ,SUM(total) AS friends
FROM
(SELECT
  *
FROM
  sent
UNION ALL
SELECT
  *
FROM
  rcv) AS tmp
GROUP BY
  id
ORDER BY
  friends DESC;
