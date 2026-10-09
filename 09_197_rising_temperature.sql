/* Write your T-SQL query statement below */

SELECT c.id
FROM Weather AS c
INNER JOIN Weather AS p
    ON c.recordDate = DATEADD(day, 1, p.recordDate)
WHERE c.temperature > p.temperature;