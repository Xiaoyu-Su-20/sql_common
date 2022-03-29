-- random number generator
SELECT TOP 10 ABS(CHECKSUM(NEWID())) % 100
FROM my_table

-- sampling 1%
-- if sample for a discrete value, make a random subset on the application level amd then retrieve those rows. 
SELECT *
FROM (SELECT ABS(CHECKSUM(NEWID())) % 100 AS rand_int
      FROM my_table) AS t
WHERE rand_int > 98