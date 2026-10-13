
/* Write your T-SQL query statement below */

WITH AllIds AS
(
    SELECT requester_id AS id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id
    FROM RequestAccepted
)
SELECT TOP (1)
    id,
    COUNT(*) AS num
FROM AllIds
GROUP BY id
ORDER BY COUNT(*) DESC;