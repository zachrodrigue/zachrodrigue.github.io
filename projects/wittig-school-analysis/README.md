# Wittig School Database Analysis

## Project Overview

Designed and analyzed a relational database for managing students, courses, and enrollments at Wittig School. This project demonstrates database design, SQL optimization, and data-driven insights for educational institution management.

## Objective

Create a comprehensive database to support operational decision-making for student enrollments, course planning, and academic performance analysis.

## Key Questions Answered

- What are the enrollment trends across departments and time periods?
- How is student distribution across courses and programs?
- What gender balance exists in different course categories?
- Which departments are growing and which are declining?
- What data can support curriculum and resource planning?

## Key Achievements

- ✅ Modeled the database schema with proper relationships and normalization (3NF)
- ✅ Developed 15+ SQL queries to extract actionable insights on enrollment trends
- ✅ Identified departmental student distribution and course popularity patterns
- ✅ Analyzed gender breakdown across courses to inform diversity initiatives
- ✅ Provided actionable recommendations for academic planning and resource allocation

## Technologies Used

- **SQL** - Complex database queries and analysis
- **MySQL** - Relational database management system
- **MySQL Workbench** - Database design, visualization, and query development
- **EER Diagram (Entity-Relationship)** - Database schema visualization

## Project Structure

```text
wittig-school-analysis/
├── Database/
│   ├── wittig_school_db_script.sql         # Database creation & schema (DDL)
│   ├── wittig_school_erd.mwb.bak           # ERD backup file
│   └── wittig_school_model.mwb             # MySQL Workbench model
├── data/
│   ├── Courses.csv                         # Course data (mock data)
│   ├── Departments.csv                     # Department data
│   ├── Enrollments.csv                     # Enrollment records
│   ├── Instructors.csv                     # Instructor data
│   └── Students.csv                        # Student data
├── plots/                                   # Query results & visualizations
├── reports_queries.sql                     # Analysis queries (DML)
├── requirements.txt                        # Project dependencies
└── README.md                               # This file
```

## Database Schema

### Core Tables (5 Tables)

- **Students**: StudentID, Name, Gender (Male/Female/Other), DOB, DepartmentID
- **Departments**: DepartmentID, DepartmentName (unique identifier)
- **Courses**: CourseID, CourseName, DepartmentID (offering department)
- **Enrollments**: EnrollmentID, StudentID, CourseID, EnrollmentDate
- **Instructors**: InstructorID, Name, Gender, DepartmentID, HireDate, CourseID (primary course)

### Key Relationships

- **One-to-Many**: Departments → Students, Instructors, Courses
- **Many-to-Many**: Students ↔ Courses (via Enrollments table)
- **One-to-One**: Each course taught by one instructor
- **Referential Integrity**: Foreign keys maintain data consistency across all tables
- **Normalization**: Designed in 3rd Normal Form (3NF) to eliminate redundancy

## Key Findings Summary

### Enrollment & Course Analysis

- **Top 3 Courses by Enrollment**:
  1. Counseling: 205 students
  2. Immunology: 204 students
  3. Cybersecurity: 204 students
- **Departmental Distribution**:
  - Largest: Electrical Engineering (210 students)
  - Smallest: Biological Sciences (192 students)
- **Student Enrollment Status**: 100% of students are enrolled in at least one course (no unenrolled students)
- **Average Course Load**: 9 courses per student (significantly higher than typical 5-6 course institutional standard)

### Gender Distribution Insights

- **Overall Balance**: Equal representation across most courses with departmental variations
- **Course with Highest Male Enrollment**: Operations Systems
- **Course with Highest Female Enrollment**: Evolution & Finance
- **Departmental Patterns**: Gender distribution varies by course; some programs show clear gender preferences

### Data Quality & Integrity

- All referential integrity constraints validated
- No orphaned records (students without valid departments, courses without valid departments)
- Consistent data types across all imported tables
- Complete enrollment records with valid foreign key relationships

## How to Reproduce

### Prerequisites

- MySQL Server (8.0+)
- MySQL Workbench (free, optional but recommended)

### Setup Database

```bash
# Connect to MySQL
mysql -u [username] -p

# Create and populate database
SOURCE wittig_school_db_script.sql;

# Verify tables
USE wittig_school;
SHOW TABLES;
```

### Run Analysis Queries

```sql
-- Connect to database
USE wittig_school;

-- Run queries from wittig_insight_queries.sql
-- Example: View enrollment by department
SELECT 
  d.DepartmentName,
  COUNT(DISTINCT s.StudentID) as TotalStudents,
  COUNT(DISTINCT e.EnrollmentID) as TotalEnrollments
FROM students s
JOIN departments d ON s.DepartmentID = d.DepartmentID
LEFT JOIN enrollments e ON s.StudentID = e.StudentID
GROUP BY d.DepartmentName
ORDER BY TotalStudents DESC;
```

### View Schema

Open `wittig_school_erd.png` to see the database structure visually, or:

```sql
-- View table structure
DESCRIBE students;
DESCRIBE courses;
DESCRIBE enrollments;
```

## SQL Query Categories

### 1. Enrollment Analysis

- Student enrollment by department
- Enrollment trends over time
- Course capacity and utilization
- Duplicate enrollment detection

### 2. Academic Performance

- GPA by student and course
- Course success rates
- Student progress tracking
- At-risk student identification

### 3. Course Planning

- Course popularity and demand
- Instructor load analysis
- Class scheduling optimization
- Room capacity planning

### 4. Demographic Analysis

- Gender distribution in courses
- Departmental diversity metrics
- International student enrollment
- Age group analysis

### 5. Resource Allocation

- Faculty workload by department
- Classroom utilization rates
- Budget recommendations by department
- Staffing needs analysis

## Database Design Principles

- **Normalization**: 3rd Normal Form (3NF) to eliminate redundancy
- **Integrity Constraints**: Foreign keys, unique constraints, check constraints
- **Indexing**: Indexes on frequently queried columns for performance
- **Scalability**: Designed to handle growth in student and course data
- **Referential Integrity**: Maintains data consistency across tables

## Methodology

1. **Requirements Analysis**: Identified business needs for school operations
2. **Database Design**: Created EER diagram with entities and relationships
3. **Schema Development**: Implemented tables with proper constraints
4. **Query Development**: Created 15+ queries addressing key business questions
5. **Analysis & Insights**: Generated insights from query results
6. **Recommendations**: Provided actionable insights for decision-makers

## Strategic Recommendations

### 1. Course Load Management (Priority)

- **Challenge**: Average 9 courses per student exceeds institutional standard (5-6 courses)
- **Action**: Implement academic advising to help students manage heavy workloads
- **Goal**: Balance academic rigor with student well-being and success rates
- **Impact**: May improve student retention and academic performance

### 2. Support High-Enrollment Courses

- **Focus**: Counseling (205), Immunology (204), and Cybersecurity (204)
- **Action**: Allocate additional resources and faculty support to manage demand
- **Strategy**: Consider adding course sections or hiring additional instructors
- **Benefit**: Maintain course quality despite high enrollment

### 3. Strengthen Underperforming Departments

- **Target**: Biological Sciences (192 students - smallest)
- **Action**: Investigate reasons for lower enrollment (curriculum, marketing, prerequisites)
- **Strategy**: Review course offerings and consider program improvements
- **Goal**: Increase enrollment to match institutional averages

### 4. Diversity & Gender Balance Initiatives

- **Current State**: Unequal gender distribution in specific programs (Operations Systems skews male; Evolution & Finance skews female)
- **Action**: Develop targeted recruitment and retention programs
- **Strategy**: Mentor and support underrepresented genders in each program
- **Goal**: Achieve better gender balance across all departments

### 5. Departmental Growth Planning

- **Leverage**: Electrical Engineering's success (210 students - largest)
- **Action**: Study and replicate success factors from high-enrollment departments
- **Apply**: Share best practices with smaller departments
- **Outcome**: Support balanced growth across all departments

## Files Reference

- **Database Setup**: `wittig_school_db_script.sql` - Creates tables and schema
- **Analysis Queries**: `wittig_insight_queries.sql` - All analysis queries with comments
- **Schema Diagram**: `ERD_diagram.png` - Visual representation of database structure
- **Data Dictionary**: `data/README.md` - Detailed description of all fields

## Author

Rodrigue Z. Deguenon

## Date

June 2025

## Links

- 📄 [Full Report](./reports/Wittig_School_Project_Report.pdf)
- 📋 [Database Documentation](./reports/wittig_sms_doc.pdf)
