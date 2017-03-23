-- Tables:
-- sms_sent(provider, country, contact, date_time, msg_type)
-- sms_conf(contact, date_time)
--
-- 1. Use sms_sent to determine providers and countries that may be blocking.

SELECT
  country
  ,provider
  ,ROUND(AVG(num_messages), 2) AS avg_mess_per_user
FROM
  (SELECT
    country
    ,provider
    ,COUNT(*) AS num_messages
  FROM
    sms_sent
  GROUP BY
    country
    ,provider
    ,contact) AS sub
GROUP BY
  country
  ,provider
ORDER BY
  avg_mess_per_user DESC;


-- 2. Use sms_sent and sms_conf for granularity of individuals.

WITH
tmp_s AS
  (SELECT
    country
    ,provider
    ,contact
    ,COUNT(*) AS count_s
  FROM
    sms_sent
  GROUP BY
    country
    ,provider
    ,contact)
,tmp_c AS
  (SELECT
    contact
    ,COUNT(*) AS count_c
  FROM
    sms_conf
  GROUP BY
    contact)

SELECT
  country
  ,provider
  ,(count_c / count_s) AS prop
FROM
  (SELECT
    country
    ,provider
    ,COUNT(sent) AS count_s
    ,COUNT(conf) AS count_c
  FROM
    tmp
  GROUP BY
    country
    ,provider) AS sub
ORDER BY
  prop;
