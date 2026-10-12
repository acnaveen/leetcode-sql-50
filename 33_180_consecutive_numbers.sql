/* Write your T-SQL query statement below */

SELECT DISTINCT num AS ConsecutiveNums
FROM
    (
        SELECT
            num,
            id - ROW_NUMBER() OVER(PARTITION BY num ORDER BY id) as diff
        FROM Logs
    ) AS n
GROUP BY
    num,
    diff
HAVING COUNT(*) >= 3;