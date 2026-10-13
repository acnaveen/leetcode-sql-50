/* Write your T-SQL query statement below */

WITH ActivitiesDeduped AS
(
    SELECT DISTINCT
        sell_date,
        product
    FROM Activities
)
SELECT
    sell_date,
    COUNT(*) AS num_sold,
    STRING_AGG(product, ',') WITHIN GROUP (ORDER BY product) AS products
FROM ActivitiesDeduped
GROUP BY sell_date
ORDER BY sell_date;