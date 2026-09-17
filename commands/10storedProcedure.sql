
-- create stored procedure 
DELIMITER //
CREATE PROCEDURE get_students(IN studentID INT)
BEGIN
    SELECT * FROM students WHERE id = studentID
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE getstud(IN studentID INT)
BEGIN
    SELECT * FROM students WHERE id = studentID
END //
DELIMITER ;

-- delete stored procedure
DROP PROCEDURE IF EXISTS get_students;


DELIMITER //

CREATE PROCEDURE getstud(IN studentID INT)
BEGIN
    SELECT *
    FROM students
    WHERE id = studentID;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE getstud(IN studentID INT)
BEGIN
    SELECT *
    FROM students
    WHERE id = studentID;
END //

DELIMITER ; -- important space between DELIMITER and ; to avoid syntax error

-- multiple parameters & statement in stored procedure
DELIMITER //
CREATE PROCEDURE insert_get_students(IN studentID INT, IN studentName VARCHAR(255))
BEGIN
    INSERT INTO students (id, name) VALUES (studentID, studentName);
    SELECT * FROM students WHERE id = studentID;
END //
DELIMITER ;

-- stored procedure with OUT parameter

DELIMITER //
CREATE PROCEDURE get_student_name(IN studentID INT, OUT studentName VARCHAR(255))
BEGIN
    SELECT name INTO studentName FROM students WHERE id = studentID;
END //
DELIMITER ;

CALL get_student_name(1, @name);
SELECT @name;

-- stored procedure with INOUT parameter
DELIMITER //
CREATE PROCEDURE update_student_name(INOUT studentID INT, IN newName VARCHAR(255))
BEGIN
    UPDATE students SET name = newName WHERE id = studentID;
    SELECT name INTO studentID FROM students WHERE id = studentID;
END //
DELIMITER ;

CALL update_student_name(1, 'New Name', @id);
SELECT @id;

-- procedure in postgresql
CREATE OR REPLACE PROCEDURE get_students(studentID INT)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT * FROM students WHERE id = studentID;
END;
$$;




-- Function: it is a stored program that can be called and returns a value. Functions can be used in SQL statements, such as SELECT, WHERE, and HAVING clauses.

-- create function
DELIMITER //
CREATE FUNCTION get_student_name(studentID INT) RETURNS VARCHAR(255) 
DETERMINISTIC
BEGIN
    DECLARE studentName VARCHAR(255);
    SELECT name INTO studentName FROM students WHERE id = studentID;
    RETURN studentName;
END //
DELIMITER ;

-- call function
SELECT get_student_name(1);

-- delete function
DROP FUNCTION IF EXISTS get_student_name;