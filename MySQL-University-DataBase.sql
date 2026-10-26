-- =========================================
-- University Database System
-- Phase 2 - SQL Implementation
-- =========================================

-- 1. Create Database
CREATE DATABASE UniversityDB;
USE UniversityDB;

-- =========================================
-- 2. Create Tables with Constraints
-- =========================================

-- -------------------------
-- Table: Instructor
-- -------------------------
CREATE TABLE Instructor (
    Instructor_ID INT PRIMARY KEY,
    Instructor_Name VARCHAR(100) NOT NULL,
    Office_Number VARCHAR(20),
    Salary DECIMAL(10,2) CHECK (Salary > 0)
);

-- -------------------------
-- Table: Student
-- -------------------------
CREATE TABLE Student (
    student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(100) NOT NULL,
    Student_Major VARCHAR(50) NOT NULL,
    Student_Email VARCHAR(100) UNIQUE NOT NULL
);

-- -------------------------
-- Table: Course
-- -------------------------
CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100) NOT NULL,
    Credit_Hours INT CHECK (Credit_Hours > 0),
    Department VARCHAR(50),
    Instructor_ID INT,
    FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID)
);

-- -------------------------
-- Table: Enrollment
-- -------------------------
CREATE TABLE Enrollment (
    student_ID INT,
    Course_ID INT,
    Grade CHAR(2),
    Semester VARCHAR(20),
    PRIMARY KEY (student_ID, Course_ID),
    FOREIGN KEY (student_ID) REFERENCES Student(student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

-- =========================================
-- 3. Insert Sample Data (5 Records Each)
-- =========================================

-- -------------------------
-- Instructor Data
-- -------------------------
INSERT INTO Instructor VALUES
(101, 'Dr. Ahmed', 'A101', 12000),
(102, 'Dr. Sara', 'B202', 11000),
(103, 'Dr. Khalid', 'C303', 13000),
(104, 'Dr. Noor', 'D404', 12500),
(105, 'Dr. Faisal', 'E505', 14000);

-- -------------------------
-- Student Data
-- -------------------------
INSERT INTO Student VALUES
(1, 'Ali Ahmed', 'CS', 'ali@uni.com'),
(2, 'Sara Khalid', 'IT', 'sara@uni.com'),
(3, 'Omar Saleh', 'IS', 'omar@uni.com'),
(4, 'Lama Hassan', 'CS', 'lama@uni.com'),
(5, 'Nora Fahad', 'IT', 'nora@uni.com');

-- -------------------------
-- Course Data
-- -------------------------
INSERT INTO Course VALUES
(201, 'Database', 3, 'CS', 101),
(202, 'Programming', 4, 'IT', 102),
(203, 'Networks', 3, 'IS', 103),
(204, 'Operating Systems', 3, 'CS', 104),
(205, 'Software Engineering', 3, 'IT', 105);

-- -------------------------
-- Enrollment Data
-- -------------------------
INSERT INTO Enrollment VALUES
(1, 201, 'A', 'Fall 2025'),
(2, 202, 'B', 'Fall 2025'),
(3, 203, 'A', 'Spring 2026'),
(4, 204, 'C', 'Spring 2026'),
(5, 205, 'B', 'Fall 2025');

-- =========================================
-- 4. Verification Queries
-- =========================================

SELECT * FROM Instructor;
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Enrollment;

-- =========================================
-- University Database System
-- Phase 3 - SQL Queries
-- =========================================


-- =========================================
-- 1. TWO Basic SELECT Queries
-- =========================================

-- -------------------------
-- Query 1: Students in CS Major
-- -------------------------
SELECT Student_Name, Student_Email
FROM Student
WHERE Student_Major = 'CS';


-- -------------------------
-- Query 2: Courses with more than 3 Credit Hours
-- -------------------------
SELECT Course_Name, Credit_Hours
FROM Course
WHERE Credit_Hours > 3;



-- =========================================
-- 2. TWO Aggregate Functions
-- =========================================

-- -------------------------
-- Query 3: Count Students in Each Major
-- -------------------------
SELECT Student_Major, COUNT(*) AS Total_Students
FROM Student
GROUP BY Student_Major;


-- -------------------------
-- Query 4: Average Instructor Salary
-- -------------------------
SELECT AVG(Salary) AS Average_Salary
FROM Instructor;



-- =========================================
-- 3. ONE JOIN Between Tables
-- =========================================

-- -------------------------
-- Query 5: Students with their Courses and Grades
-- -------------------------
SELECT s.Student_Name,
       c.Course_Name,
       e.Grade,
       e.Semester
FROM Enrollment e
JOIN Student s ON e.student_ID = s.student_ID
JOIN Course c ON e.Course_ID = c.Course_ID;



-- =========================================
-- 4. ONE Subquery
-- =========================================

-- -------------------------
-- Query 6: Instructors with Salary Above Average
-- -------------------------
SELECT Instructor_Name, Salary
FROM Instructor
WHERE Salary >
      (SELECT AVG(Salary) FROM Instructor);



-- =========================================
-- 5. VIEW for Simple Report
-- =========================================

-- -------------------------
-- Create Enrollment Report View
-- -------------------------
CREATE VIEW Enrollment_Report AS
SELECT s.Student_Name,
       c.Course_Name,
       e.Grade,
       e.Semester
FROM Enrollment e
JOIN Student s ON e.student_ID = s.student_ID
JOIN Course c ON e.Course_ID = c.Course_ID;


-- -------------------------
-- Display Report
-- -------------------------
SELECT * FROM Enrollment_Report;