-- display all records
SELECT * FROM students;

-- display specific columns
SELECT name, age FROM students;

-- where clause to filter records
SELECT * FROM students WHERE age > 20;

-- distinct clause to get unique values
SELECT DISTINCT age FROM students;

-- WHERE clause with multiple conditions
-- 1. = (equal to) 
SELECT * FROM students WHERE age = 22;
-- 2. <> (not equal to) or != (not equal to)
SELECT * FROM students WHERE age <> 22;
-- 3. > (greater than)
SELECT * FROM students WHERE age > 22;
-- 4. < (less than)
SELECT * FROM students WHERE age < 22;
-- 5. >= (greater than or equal to)
SELECT * FROM students WHERE age >= 22;
-- 6. <= (less than or equal to)
SELECT * FROM students WHERE age <= 22;

-- 7. AND 
SELECT * FROM students WHERE age > 20 AND age < 25;
-- 8. OR
SELECT * FROM students WHERE age < 20 OR age > 25;
-- 9. NOT (returns records that do not match a condition)
SELECT * FROM students WHERE NOT age = 22;

-- 10. IN (returns records that match any value in a list) {works like OR}
SELECT * FROM students WHERE age IN (20, 22, 24);
-- 11. NOT IN (returns records that do not match any value in a list) {works like AND}
SELECT * FROM students WHERE age NOT IN (20, 22, 24);

-- 12. BETWEEN (returns records within a range) {inclusive of the range values}
SELECT * FROM students WHERE age BETWEEN 20 AND 25; -- >= 20 AND <= 25
-- 13. LIKE (returns records that match a pattern) {used with wildcards}
SELECT * FROM students WHERE name LIKE 'A%'; -- names starting with A
SELECT * FROM students WHERE name LIKE '%a'; -- names ending with a
SELECT * FROM students WHERE name LIKE '%an%'; -- names containing an
SELECT * FROM students WHERE name LIKE '_a%'; -- names with a as the second character

-- ILIKE (case-insensitive version of LIKE) for PostgreSQL

-- NULL & NOT NULL (returns records with NULL values)
SELECT * FROM students WHERE age IS NULL; -- records with NULL age
SELECT * FROM students WHERE age IS NOT NULL; -- records with non-NULL age


-- ORDER BY clause to sort records
SELECT * FROM students ORDER BY age; -- ascending order by default
SELECT * FROM students ORDER BY age DESC; -- descending order
SELECT * FROM students ORDER BY age ASC; -- ascending order

SELECT * FROM students ORDER BY age ASC, name DESC; -- sort by age first, then by name

-- LIMIT clause to limit the number of records returned
SELECT * FROM students LIMIT 5; -- returns first 5 records
SELECT * FROM students LIMIT 5 OFFSET 10; -- returns 5 records starting from the 11th record (offset is 0-based)