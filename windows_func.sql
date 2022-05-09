-- row_number()

SELECT *,
    ROW_NUMBER() OVER (PARTITION BY client_id, biomarker
        ORDER BY (date DESC) AS rn
FROM c

-- row_number but select the first not null row
SELECT *
FROM (SELECT *,
            ROW_NUMBER() OVER (PARTITION BY client_id, biomarker
                ORDER BY (CASE
                            WHEN reference_range IS NOT NULL
                                THEN 1
                            ELSE 2 END), date DESC) AS rn
    FROM c) AS t
WHERE rn = 1