/* Write your T-SQL query statement below */

SELECT
    user_id,
    name,
    mail
FROM Users
WHERE mail LIKE '[A-Za-z]%@leetcode.com'
	AND mail NOT LIKE '[A-Za-z]%[^A-Za-z0-9_.-]%@leetcode.com'
	AND mail like '%@leetcode.com' collate Latin1_General_BIN;

--This works in newer versions of MS SQL Server
--WHERE REGEXP_LIKE(mail, '^[A-Za-z][A-Za-z0-9_.-]*@leetcode[.]com$');