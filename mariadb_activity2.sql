
USE school;

-- CREATE TABLE
-- Already created in the database.
-- CREATE TABLE enrollments (
-- enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
-- student_id INT,
-- course_id INT,
-- enrollment_date DATE
-- );

-- ALTER TABLE
-- Foreign keys already exist.
-- ALTER TABLE enrollments
-- ADD CONSTRAINT fk_student
-- FOREIGN KEY (student_id)
-- REFERENCES students(id);

-- ALTER TABLE enrollments
-- ADD CONSTRAINT fk_course
-- FOREIGN KEY (course_id)
-- REFERENCES courses(course_id);

-- INSERT
-- Original sample records already exist.
-- INSERT INTO enrollments
-- (student_id, course_id, enrollment_date)
-- VALUES
-- (1, 1, '2026-10-07'),
-- (1, 2, '2026-10-07'),
-- (2, 1, '2026-10-07'),
-- (4, 3, '2026-10-07');

-- Add six more enrollment records.
-- Run this INSERT only once.
-- INSERT INTO enrollments
-- (student_id, course_id, enrollment_date)
-- VALUES
-- (2, 3, '2026-10-07'),
-- (4, 1, '2026-10-07'),
-- (5, 4, '2026-10-07'),
-- (6, 5, '2026-10-07'),
-- (7, 6, '2026-10-07'),
-- (8, 8, '2026-10-07');

-- SELECT
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- JOIN
SELECT
students.name,
courses.course_name,
enrollments.enrollment_date
FROM enrollments
JOIN students
ON enrollments.student_id = students.id
JOIN courses
ON enrollments.course_id = courses.course_id;

-- WHERE
SELECT
students.name,
courses.course_name
FROM enrollments
JOIN students
ON enrollments.student_id = students.id
JOIN courses
ON enrollments.course_id = courses.course_id
WHERE courses.course_name = 'BSIT';

-- ORDER BY
SELECT * FROM students
ORDER BY name ASC;

-- GROUP BY and COUNT
SELECT
courses.course_name,
COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;

-- Most popular course
SELECT
courses.course_name,
COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name
ORDER BY number_of_students DESC
LIMIT 1;

-- Total students
SELECT COUNT(*) AS total_students
FROM students;

-- Total enrollments
SELECT COUNT(*) AS total_enrollments
FROM enrollments;

-- CHALLENGE TASK 1
SELECT students.name, courses.course_name
FROM enrollments
JOIN students ON enrollments.student_id = students.id
JOIN courses ON enrollments.course_id = courses.course_id
WHERE courses.course_name = 'BSIT';

-- CHALLENGE TASK 2
SELECT students.name, courses.course_name
FROM enrollments
JOIN students ON enrollments.student_id = students.id
JOIN courses ON enrollments.course_id = courses.course_id
WHERE students.name = 'Juan Dela Cruz';

-- CHALLENGE TASK 3
SELECT courses.course_name,
COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;

-- CHALLENGE TASK 4
SELECT courses.course_name,
COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name
ORDER BY number_of_students DESC
LIMIT 1;

-- CHALLENGE TASK 5
SELECT * FROM students
ORDER BY name ASC;

-- CHALLENGE TASK 6
SELECT COUNT(*) AS total_enrollments
FROM enrollments;