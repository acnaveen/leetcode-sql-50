/* Write your T-SQL query statement below */

WITH DailyAgg AS
(
    SELECT
        visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
),
RollingTotal AS
(
    SELECT
        visited_on,
        SUM(amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        ROUND(AVG(1.0 * amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ), 2) AS average_amount,
        ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
    FROM DailyAgg
)
SELECT
    visited_on,
    amount,
    average_amount
FROM RollingTotal
WHERE rn >= 7
ORDER BY visited_on;