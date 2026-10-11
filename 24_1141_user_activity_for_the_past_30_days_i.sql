/* Write your T-SQL query statement below */

SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date > DATEADD(day, -30, CAST('2019-07-27' AS date))
    AND activity_date <= CAST('2019-07-27' AS date)
GROUP BY activity_date;