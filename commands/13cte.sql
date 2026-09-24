
-- creating a CTE (Common Table Expression) 
WITH cte_example AS (
    SELECT student_id, first_name, last_name
    FROM students
    WHERE enrollment_year = 2020
)
SELECT * FROM cte_example;

-- multiple CTEs
WITH cte_students AS (
    SELECT student_id, first_name, last_name
    FROM students
    WHERE enrollment_year = 2020
), cte_courses AS (
    SELECT course_id, course_name
    FROM courses
    WHERE course_year = 2020
)
SELECT s.student_id, s.first_name, s.last_name, c.course_id, c.course_name
FROM cte_students s
JOIN cte_courses c ON s.student_id = c.student_id;

-- recursive CTE 
WITH RECURSIVE cte_recursive AS (
    SELECT student_id, first_name, last_name, 1 AS level
    FROM students
    WHERE enrollment_year = 2020

    UNION ALL

    SELECT s.student_id, s.first_name, s.last_name, cte.level + 1
    FROM students s
    INNER JOIN cte_recursive cte ON s.advisor_id = cte.student_id
)