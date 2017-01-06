CREATE TABLE accepted (
  senderID INTEGER
  ,receiverID INTEGER
  ,timestamp TIMESTAMP
);

INSERT INTO accepted
  VALUES
    (1,2,NOW())
    ,(1,3,NOW())
    ,(1,4,NOW())
    ,(2,3,NOW());

CREATE TABLE requested (
  senderID INTEGER
  ,receiverID INTEGER
  ,timestamp TIMESTAMP
);

INSERT INTO requested
  VALUES
    (1,2,NOW())
    ,(1,3,NOW())
    ,(1,4,NOW())
    ,(2,3,NOW())
    ,(2,4,NOW())
    ,(3,4,NOW());
