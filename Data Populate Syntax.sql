use sql_school_project;

-- INSERTING STUDENT DATA
-- 100 STUDENTS

DELIMITER $$
DROP PROCEDURE IF EXISTS students_data$$
CREATE PROCEDURE students_data()
BEGIN
	DECLARE i INT default 1;
    WHILE i <= 100 DO
		INSERT INTO students (students_name)
        VALUES (CONCAT("Student", i));
        SET i = i + 1;
	END WHILE;
END$$;
DELIMITER ;
CALL students_data();
DROP PROCEDURE students_data;

select *
from professors;



-- professors data 
-- 10 PROFESSORS

DELIMITER $$
DROP PROCEDURE IF EXISTS professor_data$$
CREATE PROCEDURE professor_data()
BEGIN
	DECLARE i INT default 1;
    WHILE i <= 10 DO
		INSERT INTO professors (Professors_name)
		VALUES (CONCAT("Professor", i));
		SET i = i + 1;
	END WHILE;
END$$;
DELIMITER ;
CALL professor_data();
DROP PROCEDURE professor_data;


-- courses data
-- 20 COURSES
--  to get this to work i commented out the drop procedure if exists, didn't have my schema, didn't use cmd /

DELIMITER $$
DROP PROCEDURE IF EXISTS course_data$$
CREATE PROCEDURE course_data()
BEGIN
	DECLARE i INT default 1;
    WHILE i <= 20 DO
		INSERT INTO courses (courses_name, course_professor_id)
        VALUES (
			CONCAT("Course", i),
            
			CEILING(RAND() * (SELECT COUNT(*) FROM professors))
        );
        SET i = i + 1;
	END WHILE;
END$$;
DELIMITER ;
CALL course_data();
DROP PROCEDURE course_data;

-- RUN THIS AFTER TO MAKE SURE THAT EACH PROFESSOR IS TEACHING A COURSE:
SELECT *
FROM courses
ORDER BY course_professor_id ASC;

INSERT INTO courses (course_name, course_professor_id)
VALUES("Course21", 7);

select *
from grades;


-- grades data RAN THIS 5 TIMES TO GET 500 GRADES!
DELIMITER $$
DROP PROCEDURE IF EXISTS grades_data$$
CREATE PROCEDURE grades_data()
BEGIN
	DECLARE i INT default 1;
    WHILE i <= 100
		DO
			INSERT INTO grades (grades_name, grades_course_id, grades_student_id)
			VALUES (
				RAND()*100,
				CEILING(RAND() * (SELECT COUNT(*) FROM courses)),
				i
			);
		SET i = i + 1;
	END WHILE;
END$$;
DELIMITER ;
CALL grades_data();
DROP PROCEDURE grades_data;
