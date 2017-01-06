(SELECT
  senderID
  ,COUNT(receiverID)
FROM
  accepted
GROUP BY
  senderID) AS tmp1;


(SELECT
  receiverID
  ,COUNT(senderID)
FROM
  accepted
GROUP BY
  receiverID) AS tmp2;


SELECT
  tmp1.senderID
  (tmp1.COUNT(receiverID) + tmp2.COUNT(senderID))
FROM
  tmp1 OUTER JOIN tmp2
ON
  tmp1.senderID = tmp2.receiverID
ORDER BY
  (tmp1.COUNT(receiverID) + tmp2.COUNT(senderID)) DESC
LIMIT 5;
