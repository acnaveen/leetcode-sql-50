/* Write your T-SQL query statement below */

SELECT ROUND(SUM(a.tiv_2016), 2) AS tiv_2016
FROM Insurance AS a
WHERE EXISTS
    (
        SELECT NULL
        FROM Insurance AS b
        WHERE a.pid != b.pid
            AND a.tiv_2015 = b.tiv_2015
    )
    AND NOT EXISTS
    (
        SELECT NULL
        FROM Insurance AS c
        WHERE a.pid != c.pid
            AND a.lat = c.lat
            AND a.lon = c.lon
    );