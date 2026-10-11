/* Write your T-SQL query statement below */

SELECT ROUND(AVG(CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1.0 ELSE 0.0 END) * 100, 2) AS immediate_percentage
FROM Delivery AS d
INNER JOIN
    (
        SELECT
            customer_id,
            MIN(order_date) AS first_order_date
        FROM Delivery
        GROUP BY customer_id
    ) AS f
    ON f.customer_id = d.customer_id
    AND f.first_order_date = d.order_date;