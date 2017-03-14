CREATE TABLE salesperson (
  id INTEGER
  ,name VARCHAR(24)
);

CREATE TABLE sale (
  id INTEGER
  ,salesperson_id INTEGER
  ,item_id INTEGER
  ,date DATE
  ,amount INTEGER
);

CREATE TABLE item (
  id INTEGER
  ,price NUMERIC(10,2)
);

INSERT INTO salesperson
  VALUES
    (1,'Nick')
    ,(2,'Sally')
    ,(3,'Evan')
    ,(4,'Morgan');

INSERT INTO sale
  VALUES
    (1,1,2,NOW(),4)
    ,(2,2,3,NOW(),10)
    ,(3,3,2,NOW(),3)
    ,(4,4,1,NOW(),2)
    ,(5,1,1,NOW(),5)
    ,(6,2,3,NOW(),6);

INSERT INTO item
  VALUES
    (1,3.99)
    ,(2,10.99)
    ,(3,5.99);
