/* Write your T-SQL query statement below */

WITH RunningTotals AS
(
    SELECT
        person_name,
        turn,
        SUM(weight) OVER (ORDER BY turn) AS running_weight
    FROM Queue
)
SELECT person_name
FROM RunningTotals
WHERE turn =
(
    SELECT MAX(turn)
    FROM RunningTotals
    WHERE running_weight <= 1000
);