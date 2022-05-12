-- get table column info
SELECT c.name, t.name AS dtype, c.is_nullable
FROM sys.columns AS c
         JOIN sys.types AS t ON c.system_type_id = t.system_type_id
WHERE object_id = OBJECT_ID('my_vitals')
ORDER BY column_id

-- get all procedures 
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE'