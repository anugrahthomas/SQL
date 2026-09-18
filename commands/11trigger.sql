
-- show triggers
SHOW TRIGGERS;
SHOW TRIGGERS FROM university;

-- delete trigger
DROP TRIGGER IF EXISTS before_student_insert;

-- create trigger
DELIMITER //

CREATE TRIGGER before_student_insert
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
    IF NEW.age < 18 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Student must be at least 18 years old';
    END IF;
END //

DELIMITER ;


-- on delete log trigger
DELIMITER //
CREATE TRIGGER after_student_delete
AFTER DELETE ON students
FOR EACH ROW
BEGIN
    INSERT INTO student_deletion_log (student_id, deleted_at)
    VALUES (OLD.id, NOW());
END //


