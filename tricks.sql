-- random number generator
SELECT TOP 10 ABS(CHECKSUM(NEWID())) % 100
FROM my_table

-- sampling 1%
-- if sample for a discrete value, make a random subset on the application level amd then retrieve those rows. 
SELECT *
FROM (SELECT ABS(CHECKSUM(NEWID())) % 100 AS rand_int
      FROM my_table) AS t
WHERE rand_int > 98

-- pivot 
SELECT *
FROM
    (SELECT client_id, date, name, value
     FROM lab_data
     WHERE client_id = 4
       AND (name = 'TOTAL BODY FAT %' OR name = 'SUPINEHR' OR name = 'STANDING HEART RATE 1 MIN')
    ) t
        PIVOT
        (
        MAX(value) -- the aggreationq you want
        FOR name IN (
            [TOTAL BODY FAT %],
            [SUPINEHR],
            [STANDING HEART RATE 1 MIN]
        )
        ) AS pivot_table

-- timezone conversion
SELECT TOP 1 date_time,
              CONVERT(date, SWITCHOFFSET(date_time, DATEPART(TZOFFSET,
date_time AT TIME ZONE 'Mountain Standard Time')))
FROM lab_data

-- median 
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY num_of_records) OVER(PARTITION BY data_source), data_source
from client_data_summary

