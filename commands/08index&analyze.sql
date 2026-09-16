
-- INDEXING: process of creating an index on table to improve the speed of data retrieval

-- create an index 
CREATE INDEX idx_student_name ON students(email);

-- composite index (index on multiple columns)
CREATE INDEX idx_student_name_age ON students(name, email);

-- unique index (index with unique constraint)
CREATE UNIQUE INDEX idx_student_email ON students(email);


-- drop an index
DROP INDEX idx_student_name ON students;


-- EXPLAIN: used to obtain information about how the database engine executes a query
EXPLAIN SELECT * FROM students WHERE email = 'john@example.com';

-- EXPLAIN ANALYZE: provides detailed information about the execution plan and actual execution statistics of a query
-- postgresql specific command
EXPLAIN ANALYZE SELECT * FROM students WHERE email = 'john@example.com';


-- OPTIMIZE: used to optimize the performance of a table by reorganizing its storage and updating statistics
-- MySQL/MARIADB specific command
OPTIMIZE TABLE students;
-- POSTGRESQL specific command
VACUUM ANALYZE students;
VACUUM FULL students; -- reclaims storage and compacts the table

-- reindex: used to rebuild indexes on a table to improve performance
-- MySQL/MARIADB specific command
ALTER TABLE students FORCE;
-- POSTGRESQL specific command
REINDEX TABLE students;