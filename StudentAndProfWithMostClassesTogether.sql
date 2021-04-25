USE sql_school_project;

SELECT students_name AS "Student", Professors_name AS "Professor", COUNT(*) AS "Classes In Common"
FROM grades
JOIN students
ON grades.grades_student_id = students_id
JOIN courses
ON grades.grades_course_id = courses_id
JOIN professors
ON courses.course_professor_id = Professors_id
GROUP BY Professors_name, students_name
ORDER BY COUNT(*) DESC;