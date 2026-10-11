/* Write your T-SQL query statement below */

SELECT
    s.product_id,
    s.year AS first_year,
    s.quantity,
    s.price
FROM
    (
        SELECT
            product_id,
            MIN(year) AS first_year
        FROM Sales
        GROUP BY product_id
    ) AS f
INNER JOIN Sales AS s
    ON f.product_id = s.product_id
    AND f.first_year = s.year;