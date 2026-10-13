/* Write your T-SQL query statement below */

WITH Temp AS
(
    SELECT
        id,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) as rn
    FROM Person
)
DELETE p
FROM Person AS p
INNER JOIN Temp AS t
    ON p.id = t.id
WHERE t.rn > 1;