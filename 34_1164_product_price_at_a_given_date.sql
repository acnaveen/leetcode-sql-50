/* Write your T-SQL query statement below */

SELECT
    p.product_id,
    CASE
        WHEN p.change_date > '2019-08-16' THEN 10
        ELSE p.new_price
    END AS price
FROM
    (
        SELECT
            product_id,
            MIN(change_date) AS change_date
        FROM Products
        GROUP BY product_id
        HAVING MIN(change_date) > '2019-08-16'

        UNION ALL

        SELECT
            product_id,
            MAX(change_date) AS change_date
        FROM Products
        WHERE change_date <= '2019-08-16'
        GROUP BY product_id
    ) AS a
INNER JOIN Products AS p
    ON p.product_id = a.product_id
    AND p.change_date = a.change_date;