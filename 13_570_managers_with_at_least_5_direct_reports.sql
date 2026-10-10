/* Write your T-SQL query statement below */

SELECT m.name
FROM Employee AS m
INNER JOIN Employee AS r
    ON m.id = r.managerId
GROUP BY
    m.id,
    m.name
HAVING COUNT(*) >= 5;