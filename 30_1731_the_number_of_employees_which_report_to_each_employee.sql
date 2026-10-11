/* Write your T-SQL query statement below */

SELECT
    e.reports_to AS employee_id,
    m.name,
    COUNT(*) AS reports_count,
    CAST(ROUND(AVG(1.0 * e.age), 0) AS int) AS average_age
FROM Employees AS e
INNER JOIN Employees AS m
    ON e.reports_to = m.employee_id
GROUP BY
    e.reports_to,
    m.name
ORDER BY employee_id;