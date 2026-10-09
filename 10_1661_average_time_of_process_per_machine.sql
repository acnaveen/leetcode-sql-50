/* Write your T-SQL query statement below */

SELECT
    s.machine_id,
    ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
FROM Activity AS s
INNER JOIN Activity AS e
    ON s.machine_id = e.machine_id
    AND s.process_id = e.process_id
    AND e.activity_type = 'end'
WHERE s.activity_type = 'start'
GROUP BY s.machine_id;