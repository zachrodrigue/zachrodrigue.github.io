-- ===============================================
-- STUDENTS & ENROLLMENT REPORTS
-- ===============================================

-- 1. Count of students currently enrolled in each course.
-- This query uses a LEFT JOIN to include all courses,
-- even those with zero enrolled students.
SELECT c.CourseName, COUNT(e.StudentID) AS EnrolledStudent
FROM courses c
LEFT JOIN enrollments e ON c.CourseID = e.CourseID
GROUP BY 1;

-- 2. List students enrolled in multiple courses and the courses they are taking.
-- Step 1: Identify students with more than one course using a CTE.
-- Step 2: Join back to get the course names and use GROUP_CONCAT for listing.
WITH multi_course_students AS (
	SELECT
		s.StudentID,
        s.Name,
        COUNT(e.CourseID) AS CourseCount
	FROM students s
	JOIN enrollments e ON s.StudentID = e.StudentID
	GROUP BY 1
	HAVING COUNT(e.CourseID) > 1
)
SELECT 
	m.StudentID, 
    m.Name, 
    m.CourseCount, 
    GROUP_CONCAT(c.CourseName SEPARATOR ', ') AS EnrolledCourses
FROM 
	multi_course_students AS m
JOIN 
	enrollments AS e ON m.StudentID = e.StudentID  -- fixed typo: m.StudentsID → m.StudentID
JOIN 
    courses c ON e.CourseID = c.CourseID
GROUP BY
	m.StudentID, 
    m.Name, 
    m.CourseCount
ORDER BY 
    m.CourseCount DESC, m.Name;

-- 3. Total number of students in each department.
-- This counts all students per department regardless of course enrollment.
SELECT
	d.DepartmentID,
	d.DepartmentName,
	COUNT(s.StudentID) AS StudentNumber
FROM departments AS d
LEFT JOIN students AS s ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY StudentNumber DESC;

-- ===============================================
-- COURSE & INSTRUCTOR ANALYSIS
-- ===============================================

-- 1. Top 5 courses with the highest enrollment numbers.
-- Counts enrollments per course and orders them descendingly.
SELECT
	c.CourseID,
    c.CourseName,
    COUNT(e.EnrollmentID) AS EnrollmentCount
FROM courses AS c
JOIN enrollments AS e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
ORDER BY EnrollmentCount DESC
LIMIT 5;

-- 2. Department with the fewest students.
-- Finds the department with the minimum student count.
SELECT 
	d.DepartmentID,
    d.DepartmentName,
    COUNT(s.StudentID) AS StudentNumber
FROM departments AS d
JOIN students AS s ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY COUNT(s.StudentID)
LIMIT 1;

-- ===============================================
-- DATA INTEGRITY & OPERATIONAL INSIGHTS
-- ===============================================

-- 1. Find students who are not enrolled in any course.
-- Uses a NOT EXISTS subquery to filter such students.
SELECT 
    s.StudentID,
    s.Name
FROM students AS s
WHERE NOT EXISTS (
    SELECT e.StudentID
    FROM enrollments AS e
    WHERE e.StudentID = s.StudentID
);

-- 2. Average number of courses taken per student.
-- Total enrollments divided by the number of unique students.
SELECT
    COUNT(*) * 1.0 / COUNT(DISTINCT StudentID) AS AvgCoursesPerStudent
FROM enrollments;

-- 3. Gender distribution of students across courses and instructors.
-- Groups data by course, instructor, and gender, counting students.
SELECT
    c.CourseID,
    c.CourseName,
    i.InstructorID,
    i.Name AS InstructorName,
    s.Gender,
    COUNT(*) AS StudentCount
FROM enrollments e
JOIN students s ON e.StudentID = s.StudentID
JOIN courses c ON e.CourseID = c.CourseID
JOIN instructors i ON i.CourseID = c.CourseID
GROUP BY c.CourseID, c.CourseName, i.InstructorID, i.Name, s.Gender
ORDER BY c.CourseID, s.Gender;

-- 4. Course with the highest number of male or female students.
-- Groups by course and gender, counts students, and returns the max.
SELECT
    c.CourseID,
    c.CourseName,
    s.Gender,
    COUNT(*) AS StudentCount
FROM enrollments e
JOIN students s ON e.StudentID = s.StudentID
JOIN courses c ON e.CourseID = c.CourseID
GROUP BY c.CourseID, c.CourseName, s.Gender
ORDER BY StudentCount DESC
LIMIT 1;
