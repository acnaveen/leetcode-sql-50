/* Write your T-SQL query statement below */

SELECT
    MAX(salary) AS SecondHighestSalary
FROM
(
    SELECT
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS drnk
    FROM Employee
) AS e
WHERE e.drnk = 2;