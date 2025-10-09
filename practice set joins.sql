create database tushardb;
use tushardb;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50),
    EnrollmentYear INT
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50),
    Credits INT
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);



-- Students Table
INSERT INTO Students VALUES
(1, 'Aditi Sharma', 'Computer Science', 2022),
(2, 'Rohan Patel', 'Mechanical', 2023),
(3, 'Sara Khan', 'Computer Science', 2022),
(4, 'Michael Brown', 'Civil', 2023),
(5, 'Neha Gupta', 'Mechanical', 2024),
(6, 'David Miller', 'Civil', 2022),
(7, 'Priya Verma', 'Computer Science', 2023);

-- Courses Table
INSERT INTO Courses VALUES
(101, 'Data Structures', 'Computer Science', 4),
(102, 'Thermodynamics', 'Mechanical', 3),
(103, 'Fluid Mechanics', 'Civil', 4),
(104, 'DBMS', 'Computer Science', 3),
(105, 'Machine Design', 'Mechanical', 4),
(106, 'Structural Analysis', 'Civil', 3),
(107, 'Operating Systems', 'Computer Science', 4);

-- Enrollments Table
INSERT INTO Enrollments VALUES
(1, 1, 101, '2025-01-10'),
(2, 1, 104, '2025-01-12'),
(3, 2, 102, '2025-01-11'),
(4, 2, 105, '2025-01-15'),
(5, 3, 101, '2025-01-13'),
(6, 3, 107, '2025-01-17'),
(7, 4, 103, '2025-01-16'),
(8, 5, 102, '2025-01-18'),
(9, 6, 103, '2025-01-19'),
(10, 7, 104, '2025-01-20'),
(11, 7, 107, '2025-01-21');

select * from students;
select * from courses;
select * from enrollments;

-- students(studentid,studentname,department,enrollmentyear)
-- courses(courseid,coursename,department,credits)
-- enrollments(enrollmentid,studentid,courseid,enrollmentdate)

-- 1. Count how many students are in each department.

select department,count(studentId) as Totalstudents from students 
group by department order by department;

-- 2. Find how many courses each department offers.

select department,count(courseId) as totalcourse
from courses group by department order by department;

-- 3. Find how many enrollments happened for each course.
 
select c.coursename,count(e.studentId) from courses as c
left join enrollments as e on c.courseId=e.courseId
group by c.coursename;

-- 4. List students with the courses they are enrolled in.

select s.studentId,s.studentname,c.coursename from students as s 
inner join enrollments as e  on s.studentId=e.studentID
inner join courses as c on e.courseId=c.courseId order by s.studentname;

select c.coursename,s.studentname from courses as c
inner join enrollments as e on c.courseId=e.courseId
inner join students as s on e.studentId=s.studentId
order by c.coursename;

-- 6. Show all students and the courses they enrolled in (even if some didn’t enroll). L(2

select s.studentId,s.studentname,c.coursename from students as s 
left join enrollments as e  on s.studentId=e.studentID
left join courses as c on e.courseId=c.courseId order by s.studentname;

-- 7. Show all courses and the students enrolled (even if no one enrolled yet).
select c.coursename,s.studentname from courses as c
left join enrollments as e on c.courseId=e.courseId
left join students as s on e.studentId=s.studentId
order by c.coursename;

-- 8. Find the number of students enrolled in each course.

select c.coursename,count(s.studentname) as totalstudent from courses as c
left join enrollments as e on c.courseId=e.courseId
left join students as s on e.studentId=s.studentId
group by c.coursename order by totalstudent  desc;

-- 9. Find total credits each student is taking.

select s.studentname,sum(c.credits) from students as s 
inner join enrollments as e  on s.studentId=e.studentID
inner join courses as c on e.courseId=c.courseId
group by s.studentname;

-- 10.Count how many students are in each department enrolled in each course.

select c.coursename,c.department,count(s.studentname) from courses as c
inner join enrollments as e on c.courseId=e.courseId
inner join students as s on e.studentId=s.studentId
group by c.coursename , c.department order by c.department;



