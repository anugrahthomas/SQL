
-- Views: stores the deifinition of a query

-- create a view
CREATE VIEW eligible_students AS
SELECT name, age
FROM students
WHERE age >= 18;

-- view a view table
SELECT * FROM eligible_students;

-- update a view
UPDATE eligible_students
SET age = 19
WHERE name = 'Alice Wonderland';
-- NOT ALL VIEWS ARE UPDATABLE, depends on the database system and the complexity of the view.

-- delete a view
DROP VIEW eligible_students;

-- views with joins
CREATE VIEW student_department AS
SELECT
    s.id,
    s.name,
    s.age,
    d.name AS department
FROM students s
JOIN departments d
    ON s.department_id = d.id;


-- replace a view (create or update) -- postgres specific
CREATE OR REPLACE VIEW eligible_students AS
SELECT id, name, age, department_id
FROM students
WHERE age >= 18;

-- materialized view: stores the result of a query physically, can be refreshed periodically
-- in postgres
CREATE MATERIALIZED VIEW student_stats AS
SELECT
    department_id,
    COUNT(*) AS total_students,
    AVG(age) AS average_age
FROM students
GROUP BY department_id;

-- refresh a materialized view
REFRESH MATERIALIZED VIEW student_stats;

