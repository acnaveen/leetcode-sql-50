/* Write your T-SQL query statement below */

SELECT MAX(s.num) AS num
FROM
    (
        SELECT num
        FROM MyNumbers
        GROUP BY num
        HAVING COUNT(*) = 1
    ) AS s;