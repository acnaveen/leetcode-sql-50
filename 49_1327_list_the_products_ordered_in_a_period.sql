/* Write your T-SQL query statement below */

WITH OrdersAgg AS
(
    SELECT
        product_id,
        SUM(unit) AS unit
    FROM Orders
    WHERE order_date >= '2020-02-01'
        AND order_date <= '2020-02-29'
    GROUP BY product_id
)
SELECT
    p.product_name,
    o.unit
FROM OrdersAgg AS o
INNER JOIN Products AS p
    ON o.product_id = p.product_id
WHERE o.unit >= 100;