SELECT
  First_name+'_'+Last_name AS Name
FROM
  employee;

or

SELECT
  CONCAT(First_name, '_', Last_name) AS Name
FROM
  employee;
