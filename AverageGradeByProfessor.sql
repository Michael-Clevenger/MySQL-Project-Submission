USE sql_school_project;

SELECT Professors_name as "Professor", AVG(grades_name) as "Average Grade Given"
FROM courses
JOIN professors 
ON courses.course_professor_id = Professors_id
JOIN grades
ON courses.courses_id = grades_course_id
GROUP BY Professors_name;