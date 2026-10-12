/* Write your T-SQL query statement below */

SELECT
    CASE
        WHEN (MAX(id) OVER ()) % 2 = 1 AND id = MAX(id) OVER() THEN id
        WHEN id % 2 = 0 THEN id - 1
        ELSE id + 1
    END AS id,
    student
FROM Seat
ORDER BY id;