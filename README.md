# University-Managment-DataBase

A relational database project developed using MySQL to organize and manage university information, including students, instructors, courses, and enrollments.

The project demonstrates database implementation, data integrity, and SQL querying techniques through a structured university management database.

## Project Overview

The University Database System is designed to store and retrieve academic information efficiently.

It consists of four related tables:

## Table Description

| Instructor | Stores instructor information, office numbers, and salaries. |
| Student | Stores student IDs, names, majors, and email addresses. |
| Course | Stores course details, credit hours, departments, and assigned instructors. |
| Enrollment | Connects students with courses and stores their grades and semesters. |

## Technologies Used

- MySQL
- SQL
- Relational Database Design
- Primary and Foreign Keys
- Database Constraints

## Project Implementation

### Phase 2 – Database Implementation

- Created the `UniversityDB` database.
- Designed four relational tables.
- Implemented Primary Keys and Foreign Keys to establish relationships.
- Applied database constraints, including `NOT NULL`, `UNIQUE`, and `CHECK`.
- Inserted five sample records into each table.
- Verified the inserted data using SELECT statements.

### Phase 3 – SQL Queries

Implemented different SQL operations to retrieve and analyze university data.

**1. Basic SELECT Queries**

- Retrieve students majoring in Computer Science.
- Display courses with more than three credit hours.

**2. Aggregate Functions**

- Count the number of students in each major using `COUNT()` and `GROUP BY`.
- Calculate the average instructor salary using `AVG()`.

**3. JOIN Operations**

Retrieve student names alongside their enrolled courses, grades, and semesters by joining multiple tables.

**4. Subqueries**

Identify instructors whose salaries are higher than the average instructor salary.

**5. Database Views**

Created an `Enrollment_Report` view to display student enrollment information in a simplified report.

## Database Relationships

The database includes the following relationships:

- One instructor can teach multiple courses.
- Each course references an instructor.
- Students and courses have a many-to-many relationship implemented through the Enrollment table.
- Each enrollment record connects a student to a course and stores the corresponding grade and semester.

## How to Run

1. Install MySQL and open MySQL Workbench or another compatible SQL environment.
2. Execute the Phase 2 SQL script to create the database and tables.
3. Insert the sample records.
4. Execute the Phase 3 SQL script to run the queries and create the enrollment report view.
5. Display the results to verify the implementation.

## Learning Outcomes

This project demonstrates practical understanding of:

- Relational database implementation.
- SQL Data Definition Language (DDL).
- SQL Data Manipulation Language (DML).
- Data integrity and table relationships.
- SQL joins, aggregate functions, and subqueries.
- Creating database views for reporting.

## Project Type

University Database Course Project.
