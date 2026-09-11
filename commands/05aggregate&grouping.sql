
-- aggregation functions: used to perform calculations on a set of values and return a single value

-- COUNT: returns the number of rows that match a specified condition
SELECT COUNT(*) AS total_students FROM students; -- count all rows in the table
SELECT COUNT(age) AS total_students_with_age FROM students; -- count rows where age is not NULL
SELECT COUNT(DISTINCT age) AS unique_ages FROM students; -- count unique ages

-- SUM: returns the total sum of a numeric column
SELECT SUM(age) AS total_age FROM students; -- sum of all ages

-- AVG: returns the average value of a numeric column
SELECT AVG(age) AS average_age FROM students; -- average age

-- MIN: returns the minimum value of a column
SELECT MIN(age) AS youngest_student FROM students; -- youngest student age

-- MAX: returns the maximum value of a column
SELECT MAX(age) AS oldest_student FROM students; -- oldest student age


-- GROUP BY: groups rows that have the same values in specified columns into summary rows, like "find the number of students in each age group"
SELECT age, COUNT(*) AS total_students FROM students GROUP BY age; -- group by age and count the number of students in each age group

-- HAVING: used to filter records that work on aggregated data, similar to WHERE but for groups
SELECT age, COUNT(*) AS total_students FROM students GROUP BY age HAVING COUNT(*) > 1; -- only show age groups with more than 1 student

