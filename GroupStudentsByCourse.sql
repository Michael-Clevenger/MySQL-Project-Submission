USE sql_school_project;

SELECT students_name as "Student", courses_name as "Course"
FROM grades
JOIN courses
ON grades.grades_course_id = courses_id
JOIN students
ON grades.grades_student_id = students_id
ORDER BY courses_name;