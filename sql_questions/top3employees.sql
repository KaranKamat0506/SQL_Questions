SELECT t.*
FROM (
    SELECT emp_id,
           emp_name,
           salary,
           dept_id,
           ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn
    FROM employees
) t
WHERE rn <= 3;