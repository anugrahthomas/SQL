-- show all tables in the current database
SHOW TABLES;

-- create a table
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
);

-- show the structure of the table
DESCRIBE students;

-- insert data into the table
INSERT INTO students (name, age) VALUES ('Bob The Builder', 30);

-- more than 1 insert
INSERT INTO students (name, age) 
VALUES
    ('Alice Wonderland', 25),
    ('Charlie Brown', 28),
    ('Dora Explorer', 22);

-- replace data into the table (insert or update) 
REPLACE INTO students (id, name, age) VALUES (1, 'Bob The Builder', 31); -- if id 1 exists, update it, else insert a new record, specific to MySQL and SQLite, not supported in PostgreSQL

-- delete data from the table (row deletion)
DELETE FROM students WHERE name = 'Charlie Brown';

-- delete all data from the table without dropping the table
DELETE FROM students;
-- delete all data from the table without dropping the table (faster than DELETE)
TRUNCATE TABLE students;

-- alter/modify the table
ALTER TABLE students ADD COLUMN email VARCHAR(100) UNIQUE;

-- alter more than 1 column
ALTER TABLE students
    MODIFY COLUMN name VARCHAR(150) NOT NULL,
    MODIFY COLUMN age INT NOT NULL;

-- drop a column from the table (column deletion)
ALTER TABLE students DROP COLUMN email;

-- drop more than 1 column from the table 
ALTER TABLE students
    DROP COLUMN IF EXISTS name,
    DROP COLUMN IF EXISTS age;

-- rename column in the table
ALTER TABLE students RENAME COLUMN name TO full_name; -- PostgreSQL specific syntax
ALTER TABLE students CHANGE name full_name VARCHAR(150) NOT NULL; -- MySQL specific syntax

-- rename the table
RENAME TABLE students TO university_students;


-- drop the table, deleting the table and all its data
DROP TABLE university_students;


-- update data in the table, row update
UPDATE students SET age = 26 WHERE name = 'Alice Wonderland';

-- creating a table with foreign key constraint, referencing another table
CREATE TABLE courses (
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    name VARCHAR(100) NOT NULL,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);

-- creating a table with composite primary key
CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);