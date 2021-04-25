USE sql_school_project;

SELECT students_name as "Student", MAX(grades_name) as "Top Grade Earned"
FROM grades
JOIN students
ON grades.grades_student_id = students_id
GROUP BY students_name;