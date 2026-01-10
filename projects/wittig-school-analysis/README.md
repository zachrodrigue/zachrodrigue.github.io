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
├── database_files/
│   ├── wittig_school_db_script.sql    # Database creation & schema
│   ├── wittig_insight_queries.sql     # Analysis queries
│   └── ERD_diagram.png                 # Entity-Relationship Diagram
├── data/                               # Sample data & schema info
│   ├── schema_documentation.md
│   ├── sample_data.csv
│   └── README.md                      # Data dictionary
├── plots/                              # Query results & insights
│   ├── enrollment_by_department.csv
│   ├── course_popularity.csv
│   ├── gender_distribution.csv
│   └── student_performance.csv
└── README.md                          # This file
```

## Database Schema

### Core Tables

- **Students**: Student information, enrollment status, demographics
- **Departments**: Academic departments with chair information
- **Courses**: Course offerings, descriptions, credits
- **Enrollments**: Student-Course relationships with grades
- **Instructors**: Faculty information and department assignments
- **Classrooms**: Physical spaces and capacity information

### Key Relationships

- Students → Enrollments → Courses (many-to-many)
- Courses → Departments (one-to-many)
- Students → Departments (through Enrollments, for major tracking)
- Instructors → Courses (one-to-many)
- Courses → Classrooms (one-to-many, scheduled classes)

## Key Findings Summary

### Enrollment Trends

- Total enrolled students: [X] across [Y] departments
- Growth rate: [X]% year-over-year
- Peak enrollment periods: [Semesters/Terms]
- Declining programs: [Departments] requiring attention

### Course Analysis

- Most popular courses: [Specific courses] with [capacity] students
- Underutilized courses: [Courses] with [%] enrollment rates
- Course distribution across departments: [Details]
- Average class size: [X] students

### Demographic Insights

- Gender distribution: [X]% male, [Y]% female, [Z]% other
- Diversity by department: [Analysis]
- International student enrollment: [%]
- Age demographics: [Distribution]

### Academic Performance

- Average GPA by department: [Data]
- Course success rates: [Completion and pass rates]
- Student retention: [Year-to-year persistence]
- At-risk student identification: [Criteria]

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

Open `ERD_diagram.png` to see the database structure visually, or:

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

1. **Enrollment Management**: Address declining programs or plan growth for expanding ones
2. **Course Planning**: Adjust course offerings based on demand and utilization data
3. **Resource Allocation**: Optimize classroom and faculty resources based on analysis
4. **Diversity Initiatives**: Use demographic data to support inclusion goals
5. **Academic Support**: Identify at-risk students for early intervention

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

- 📄 [Full Report](../../documents/reports/Wittig_School_Project_Report.pdf)
- 📋 [Database Documentation](../../documents/reports/wittig_sms_doc.pdf)
