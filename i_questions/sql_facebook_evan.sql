
-- We use the log content_actions to track a variety of users activity.
-- It has the following data:
--
-- table content_actions:
-- date
-- user_id
-- content_id - unique id for generated content
-- action_type - one of the following {'post', 'share', 'photo', 'comment'}
-- target_id - id of the object that is receiving this content
--
-- 1) userid = Ben,  content_id = 11, action_type = 'photo',   target_id = null
-- 2) userid = Ben,  content_id = 12, action_type = 'comment', target_id = 11
-- 3) userid = Sam,  content_id = 13, action_type = 'comment', target_id = 11
-- 4) userid = John, content_id = 14, action_type = 'share',   target_id = 11
--
-- Compute a distribution of the number comments per number of stories
-- ('post', 'share', 'photo').
-- num_comments num_stories
-- 2                  10M
-- 10                 400k
-- 50                 2k
-- 10                 600k
-- 50                 1k

WITH
  origin AS (SELECT *
             FROM content_actions
             WHERE target_id IS NULL)
  ,responses AS (SELECT *
                 FROM content_actions
                 WHERE target_id IS NOT NULL
                  AND action_type = 'comment')

SELECT
  num_comments
  ,SUM(num_comments) AS num_stories
FROM
      (SELECT
        COUNT(r.action_type) AS num_comments
      FROM
        origin o LEFT JOIN responses r
      ON
        o.content_id = r.target_id
      GROUP BY
        o.content_id) AS sub
GROUP BY
  num_comments
WHERE
  num_comments IN (2,10,50);


-- follow up
-- num_comments num_stories (action_type)
-- 2                  10M      photo
-- 10                 400k     phot
-- 50                 2k       photo
-- 10                 600k     post
-- 50                 1k       post

WITH
  origin AS (SELECT *
             FROM content_actions
             WHERE target_id IS NULL)
  ,responses AS (SELECT *
                 FROM content_actions
                 WHERE target_id IS NOT NULL
                  AND action_type = 'comment')

SELECT
  num_comments
  ,SUM(num_comments) AS num_stories
  ,action_type
FROM
      (SELECT
        o.action_type
        ,COUNT(r.action_type) AS num_comments
      FROM
        origin o LEFT JOIN responses r
      ON
        o.content_id = r.target_id
      GROUP BY
        o.action_type
        o.content_id) AS sub
GROUP BY
  num_comments
  ,action_type
WHERE
  num_comments IN (2,10,50);
