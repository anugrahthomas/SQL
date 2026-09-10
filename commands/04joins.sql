

-- INNER JOIN: Returns records that have matching values in both tables.
SELECT s.name as student_name, c.name as course_name
FROM students s
INNER JOIN courses c ON s.id = c.student_id;

-- LEFT JOIN: returns all records from left table + matched records from right table.
SELECT s.name as student_name, c.name as course_name
FROM students s
LEFT JOIN courses c ON s.id = c.student_id;

-- RIGHT JOIN: returns all records from right table + matched records from left table.
SELECT s.name as student_name, c.name as course_name
FROM students s
RIGHT JOIN courses c ON s.id = c.student_id;

-- FULL OUTER JOIN: returns all records when there is a match in either left or right table.
SELECT s.name as student_name, c.name as course_name
FROM students s
FULL OUTER JOIN courses c ON s.id = c.student_id;

-- FULL OUTER JOIN alternative: UNION of LEFT JOIN and RIGHT JOIN
SELECT s.name as student_name, c.name as course_name
FROM students s
LEFT JOIN courses c ON s.id = c.student_id
UNION
RIGHT JOIN courses c ON s.id = c.student_id;

-- CROSS JOIN: returns the Cartesian product of both tables (all combinations of records).
SELECT s.name as student_name, c.name as course_name
FROM students s
CROSS JOIN courses c;

-- SELF JOIN: A self join is a regular join, but the table is joined with itself.
SELECT a.name as student_name, b.name as friend_name
FROM students a
INNER JOIN students b ON a.friend_id = b.id;