USE sql_school_project;

SELECT courses_name AS "Course", AVG(grades_name) AS "Average Course Grade"
FROM grades
JOIN courses
ON grades_course_id = courses_id
GROUP BY courses_name
ORDER BY AVG(grades_name) ASC;