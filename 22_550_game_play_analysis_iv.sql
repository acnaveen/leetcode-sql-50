/* Write your T-SQL query statement below */

SELECT ROUND(AVG(CASE WHEN n.player_id IS NULL THEN 0.0 ELSE 1.0 END), 2) AS fraction
FROM
    (
        SELECT
            player_id,
            MIN(event_date) AS first_event_date
        FROM Activity
        GROUP BY player_id
    ) AS f
LEFT JOIN Activity AS n
    ON n.player_id = f.player_id
    AND n.event_date = DATEADD(day, 1, f.first_event_date);