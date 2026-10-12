/* Write your T-SQL query statement below */

SELECT
    cat.category,
    COUNT(acc.category) AS accounts_count
FROM
    (
        SELECT 'Low Salary' AS category
        UNION ALL
        SELECT 'Average Salary'
        UNION ALL
        SELECT 'High Salary'
    ) AS cat
LEFT JOIN
    (
        SELECT
            CASE
                WHEN income < 20000 THEN 'Low Salary'
                WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
                WHEN income > 50000 THEN 'High Salary'
            END AS category
        FROM Accounts
    ) AS acc
    ON acc.category = cat.category
GROUP BY cat.category;