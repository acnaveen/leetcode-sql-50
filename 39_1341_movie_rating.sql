/* Write your T-SQL query statement below */

WITH TopUser AS
(
    SELECT
        u.name,
        ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC, u.name ASC) AS rn
    FROM MovieRating AS mr
    INNER JOIN Users AS u
        ON mr.user_id = u.user_id
    GROUP BY u.name
),
TopMovie AS
(
    SELECT
        m.title,
        ROW_NUMBER() OVER (ORDER BY AVG(1.0 * mr.rating) DESC, m.title ASC) AS rn
    FROM MovieRating AS mr
    INNER JOIN Movies AS m
        ON mr.movie_id = m.movie_id
    WHERE mr.created_at >= '2020-02-01'
        AND mr.created_at <= '2020-02-29'
    GROUP BY m.title
)
SELECT name AS results
FROM TopUser
WHERE rn = 1

UNION ALL

SELECT title AS results
FROM TopMovie
WHERE rn = 1;