-- GROUP BY DAY, MONTH is straight forward, assume you have a DATE column
-- day 
SELECT AVG(num) FROM my_table 
GROUP BY [date]

-- month 
SELECT AVG(num) FROM my_table
GROUP BY DATEPART(MONTH, [date]), DATEPART(year, [date]) 

-- week 
SELECT AVG(num)
FROM
(SELECT num, DATEADD(DAY,1-DATEPART(WEEKDAY,date),date) AS [week])
GROUP BY week