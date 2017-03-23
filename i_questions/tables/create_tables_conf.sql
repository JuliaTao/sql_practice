CREATE TABLE sms_sent (
  provider VARCHAR(24)
  ,country VARCHAR(24)
  ,contact VARCHAR(24)
  ,date_time TIMESTAMP
  ,msg_type VARCHAR(24)
);

CREATE TABLE sms_conf (
  contact VARCHAR(24)
  ,date_time TIMESTAMP
);


INSERT INTO sms_sent
  VALUES
    ('Ver','USA','Nick',NOW(),'stuff')
    ,('Spr','UKR','Sally',NOW(),'stuff')
    ,('T-M','CAN','Evan',NOW(),'stuff')
    ,('Ver','MEX','Morgan',NOW(),'stuff')
    ,('Spr','UKR','Sally',NOW(),'stuff')
    ,('T-M','CAN','Evan',NOW(),'stuff')
    ,('Ver','MEX','Morgan',NOW(),'stuff')
    ,('Ver','MEX','Morgan',NOW(),'stuff');

INSERT INTO sms_conf
  VALUES
    ('Nick',NOW())
    ,('Sally',NOW())
    ,('Evan',NOW())
    ,('Morgan',NOW());
