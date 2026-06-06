# 🎓 DBMS Practical - Complete SQL Learning Repository

A comprehensive collection of SQL practical exercises covering fundamental to advanced Database Management System concepts. This repository contains hands-on examples with the `college_db` database featuring students, instructors, departments, and more.

---

## 📚 Repository Contents

### 1️⃣ **Creating tables ARD.sql**
**Foundation - Database & Table Creation**
- Creating `college_db` database
- Creating tables: `students`, `instructor`, `alumni`
- Inserting sample data for 14+ students and 15 instructors
- Using `DESCRIBE` to view table structure
- Tables include PRIMARY KEY and AUTO_INCREMENT constraints

**Key Concepts:**
- `CREATE DATABASE` and `USE`
- `CREATE TABLE` with various data types (INT, VARCHAR)
- `INSERT INTO` with multiple records
- `SELECT *` to retrieve data

---

### 2️⃣ **Data constraints ARD.sql**
**Referential Integrity & Constraints**
- Creating relational database schema with 4 interconnected tables
- Implementing PRIMARY KEY and FOREIGN KEY constraints
- NOT NULL constraints

**Database Schema:**
- **Department** → dept_id (PK), dept_name
- **Faculty** → faculty_id (PK), faculty_name, dept_id (FK)
- **Student** → student_id (PK), student_name, dept_id (FK)
- **Subject** → subject_id (PK), subject_name, faculty_id (FK), dept_id (FK)

**Key Concepts:**
- Foreign Key relationships
- Referential integrity
- Multi-table database design

---

### 3️⃣ **Aggregates Function and Group By ARD.sql**
**Statistical Analysis & Grouping**

**Aggregate Functions Covered:**
- `COUNT(*)` - Total rows count
- `COUNT(column)` - Count non-NULL values
- `AVG(salary)` - Calculate average
- `SUM(salary)` - Calculate total sum
- `GROUP BY` - Department-wise salary analysis

**Example Queries:**
```sql
-- Average salary by department
SELECT department, AVG(salary)
FROM instructor
GROUP BY department;
```

---

### 4️⃣ **String and Set Operation, Order By ARD.sql**
**Pattern Matching, Sorting & Set Theory**

**String Operations:**
- `LIKE 'R%'` - Names starting with 'R'
- `LIKE '%h'` - Names ending with 'h'
- `LIKE '%var%'` - Names containing 'var'

**Sorting:**
- `ORDER BY marks ASC` - Ascending order
- `ORDER BY age DESC` - Descending order

**Range Queries:**
- `BETWEEN 70 AND 90` - Marks range filtering

**Set Operations:**
- `UNION` - Combine results from multiple queries
- `INTERSECT` (using AND) - Common elements
- `EXCEPT` (using NOT IN) - Difference between sets

---

### 5️⃣ **Type of Joints ARD.sql**
**Complete JOIN Operations Guide**

**All JOIN Types Demonstrated:**
1. **INNER JOIN** - Matching records from both tables
2. **LEFT JOIN** - All records from left + matching from right
3. **RIGHT JOIN** - All records from right + matching from left
4. **FULL OUTER JOIN** - All records from both (via UNION)
5. **CROSS JOIN** - Cartesian product of tables

**Example:**
```sql
SELECT s.id, s.name, s.course, d.dept_name
FROM students s
INNER JOIN department d
ON s.dept_id = d.dept_id;
```

**Includes:** UPDATE operation to demonstrate NULL handling in joins

---

### 6️⃣ **Subqueries in Form and With Clause ARD.sql**
**Nested Queries & Common Table Expressions**

**Two Major Approaches:**

**1. Subqueries in FROM Clause:**
```sql
SELECT dept_name, avg_salary
FROM (SELECT dept_name, AVG(salary) as avg_salary
      FROM instructor
      GROUP BY dept_name)
WHERE avg_salary > 42000;
```

**2. WITH Clause (CTE):**
```sql
WITH max_budget (value) AS 
(SELECT MAX(budget) FROM department)
SELECT department.name
FROM department, max_budget
WHERE department.budget = max_budget.value;
```

**Key Concepts:**
- Inline views
- Common Table Expressions (CTE)
- Derived tables with aliases

---

### 7️⃣ **Null Values and Null Values (Cont.) ARD.sql**
**NULL Handling & Three-Valued Logic**

**NULL Checks:**
- `IS NULL` - Find NULL values
- `IS NOT NULL` - Find non-NULL values

**Three-Valued Logic (TRUE/FALSE/UNKNOWN):**
- `AND` with UNKNOWN behavior
- `OR` with UNKNOWN behavior
- `NOT` with UNKNOWN behavior

**Complex NULL Scenarios:**
```sql
-- AND with mixed conditions
SELECT name FROM instructor
WHERE salary > 50000 AND department = 'IT';

-- OR with UNKNOWN
SELECT name FROM instructor
WHERE salary > 60000 OR department = 'IT';
```

---

### 8️⃣ **Exists and Not Exists ARD.sql**
**Correlated Subqueries & Existence Testing**

**EXISTS Clause:**
- Find courses offered in both Fall 2017 and Spring 2018
- Correlated subquery checking existence

**NOT EXISTS Clause:**
- Find students who completed ALL Computer department courses
- Uses EXCEPT (difference) operation
- Complex multi-level subquery

**Example:**
```sql
SELECT course_id FROM section AS S
WHERE semester = 'Fall' AND year = 2017 
AND EXISTS (SELECT * FROM section AS T
            WHERE semester = 'Spring' AND year = 2018 
            AND S.course_id = T.course_id);
```

---

### 9️⃣ **SOME and ALL clause ARD.sql**
**Comparison with Multiple Values**

**SOME (ANY) Operator:**
- Salary greater than SOME (at least one) Computer dept instructor
- Returns true if condition is true for at least one value

**ALL Operator:**
- Salary greater than ALL Computer dept instructors
- Returns true only if condition is true for all values

**Syntax:**
```sql
-- SOME: Greater than at least one
SELECT name FROM instructor
WHERE salary > SOME (SELECT salary FROM instructor 
                     WHERE dept_name = 'Computer');

-- ALL: Greater than all
SELECT name FROM instructor
WHERE salary > ALL (SELECT salary FROM instructor 
                    WHERE dept_name = 'Computer');
```

---

### 🔟 **Views in SQL ARD.sql**
**Virtual Tables & Data Abstraction**

**Creating Views:**
1. **JOIN-based View** - Combining students with departments
2. **Filtered View** - High-performing students (marks > 80)

**Using Views:**
- Query views like regular tables
- Apply additional filters on views
- Simplify complex queries

**Examples:**
```sql
-- Create view
CREATE VIEW student_department_view AS
SELECT s.id, s.name, s.course, d.dept_name
FROM students s JOIN department d
ON s.dept_id = d.dept_id;

-- Use view with filter
SELECT * FROM student_department_view
WHERE course = 'BCA';
```

---

### 1️⃣1️⃣ **SQL Triggers ARD.sql**
**Automated Database Actions**

**Two Types of Triggers Demonstrated:**

**1. AFTER INSERT Trigger:**
- **Teacher Table** - Logs new teacher records
- Automatically inserts log message after teacher insertion
- Uses `Teacher_Log` table for audit trail

**2. BEFORE INSERT Trigger:**
- **Student Table** - Auto-calculates Pass/Fail result
- Sets Result = 'Pass' if Marks > 40, else 'Fail'
- Modifies data before insertion using `NEW` keyword

**Syntax Structure:**
```sql
DELIMITER //
CREATE TRIGGER trigger_name
{BEFORE|AFTER} {INSERT|UPDATE|DELETE}
ON table_name
FOR EACH ROW
BEGIN
    -- Trigger logic
END //
DELIMITER ;
```

---

## 🗃️ Database Schema Overview

### Main Tables Used:

| Table | Columns | Description |
|-------|---------|-------------|
| **students** | id, name, age, course, city, marks, dept_id | Student records with 14 entries |
| **instructor** | id, name, department, salary | Faculty data with 15 entries (includes NULLs) |
| **alumni** | PRN, Name | Alumni records with UNIQUE constraint |
| **department** | dept_id, dept_name | Department master data |
| **faculty** | faculty_id, faculty_name, dept_id | Faculty with FK to department |
| **subject** | subject_id, subject_name, faculty_id, dept_id | Subjects with multiple FKs |
| **teacher** | TeacherID, TeacherName, Subject, Salary | For trigger demonstrations |

---

## 🚀 Getting Started

### Prerequisites
- **MySQL Server 8.0+** or **MariaDB 10.0+**
- **MySQL Workbench** (recommended) or any SQL client
- Basic understanding of SQL syntax

### Installation & Setup

1. **Clone the repository:**
```bash
git clone https://github.com/Arjunyaa/DBMS-Practical.git
cd DBMS-Practical
```

2. **Start MySQL Server:**
```bash
# Windows
net start MySQL80

# Linux/Mac
sudo systemctl start mysql
```

3. **Login to MySQL:**
```bash
mysql -u root -p
```

4. **Execute SQL files in order:**
```sql
SOURCE 'path/to/Creating tables ARD.sql';
SOURCE 'path/to/Data constraints ARD.sql';
-- Continue with other files
```

### Recommended Learning Order:

1. **Beginner Level:**
   - Creating tables ARD.sql
   - Aggregates Function and Group By ARD.sql
   - String and Set Operation, Order By ARD.sql

2. **Intermediate Level:**
   - Data constraints ARD.sql
   - Type of Joints ARD.sql
   - Null Values and Null Values (Cont.) ARD.sql

3. **Advanced Level:**
   - Subqueries in Form and With Clause ARD.sql
   - Exists and Not Exists ARD.sql
   - SOME and ALL clause ARD.sql
   - Views in SQL ARD.sql
   - SQL Triggers ARD.sql

---

## 📖 Concepts Covered

### SQL Language Categories:
- ✅ **DDL** - Data Definition Language (CREATE, ALTER, DROP, DESCRIBE)
- ✅ **DML** - Data Manipulation Language (INSERT, UPDATE, DELETE)
- ✅ **DQL** - Data Query Language (SELECT with various clauses)
- ✅ **DCL** - Data Control Language (Constraints, Foreign Keys)
- ✅ **TCL** - Transaction Control Language (Triggers)

### Core Topics:
- ✅ Database & Table Creation
- ✅ Primary & Foreign Key Constraints
- ✅ Aggregate Functions (COUNT, SUM, AVG, MIN, MAX)
- ✅ GROUP BY & HAVING clauses
- ✅ String Operations & Pattern Matching (LIKE)
- ✅ Sorting (ORDER BY ASC/DESC)
- ✅ Range Queries (BETWEEN)
- ✅ Set Operations (UNION, INTERSECT, EXCEPT)
- ✅ All JOIN types (INNER, LEFT, RIGHT, FULL OUTER, CROSS)
- ✅ Subqueries (FROM clause, WHERE clause)
- ✅ Common Table Expressions (WITH clause)
- ✅ NULL Value Handling & Three-Valued Logic
- ✅ EXISTS & NOT EXISTS
- ✅ SOME & ALL Operators
- ✅ Views (Virtual Tables)
- ✅ Triggers (BEFORE/AFTER INSERT)

---

## 💡 Sample Queries by Use Case

### Find High-Performing Students:
```sql
SELECT * FROM students WHERE marks > 85 ORDER BY marks DESC;
```

### Department-wise Average Salary:
```sql
SELECT department, AVG(salary) as avg_salary
FROM instructor
GROUP BY department;
```

### Students Without Department:
```sql
SELECT * FROM students WHERE dept_id IS NULL;
```

### Course Completion Check:
```sql
SELECT * FROM student_department_view WHERE course = 'BCA';
```

---

## 🛠️ Tips for Practice

1. **Modify Data:** Try inserting your own records
2. **Experiment:** Change WHERE conditions and observe results
3. **Combine Concepts:** Mix JOINs with GROUP BY and HAVING
4. **Break Queries:** Understand error messages
5. **Use EXPLAIN:** Analyze query execution plans
6. **Practice Triggers:** Create triggers for UPDATE and DELETE operations

---

## 📊 Sample Dataset Statistics

- **14 Students** across BCA, BBA, BTech courses
- **15 Instructors** from 5 departments (Computer, IT, Mechanical, Electrical, Civil)
- **10 Alumni** records
- **Multiple departments** with faculty and subject mappings
- **Marks Range:** 67-95 (students)
- **Salary Range:** 45,000-70,000 (instructors, excluding NULLs)

---

## 🤝 Contributing

Contributions are welcome! Here's how:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/NewConcept`)
3. Add your SQL examples with comments
4. Commit changes (`git commit -m 'Add new SQL concept'`)
5. Push to branch (`git push origin feature/NewConcept`)
6. Open a Pull Request

**What to contribute:**
- Additional SQL concepts (Stored Procedures, Functions, Indexes)
- Real-world use cases
- Performance optimization examples
- Error handling scenarios

---

## 📝 Notes

- All queries are tested on **MySQL 8.0**
- Some syntax may vary for PostgreSQL, Oracle, or SQL Server
- Comments are included in SQL files for clarity
- Sample data includes intentional NULL values for practice

---

## 🐛 Common Issues & Solutions

**Issue:** Foreign key constraint fails  
**Solution:** Ensure parent table data exists before inserting child records

**Issue:** Trigger doesn't execute  
**Solution:** Check delimiter syntax and use `SHOW TRIGGERS` to verify

**Issue:** View not updating  
**Solution:** Views are virtual; base table changes reflect automatically

---

## 📧 Contact & Support

- **Repository Owner:** Arjunyaa
- **GitHub:** [@Arjunyaa](https://github.com/Arjunyaa)
- **Issues:** Report bugs or request features via [GitHub Issues](https://github.com/Arjunyaa/DBMS-Practical/issues)

---

## 📄 License

This project is open-source and available under the **MIT License** for educational purposes.

Feel free to use, modify, and distribute with attribution.

---

## ⭐ Acknowledgments

Special thanks to all contributors and the SQL community for making database learning accessible!

---

<div align="center">

### 🎯 **Master SQL with Hands-On Practice!**

**Star ⭐ this repository if you find it helpful!**

[![GitHub Stars](https://img.shields.io/github/stars/Arjunyaa/DBMS-Practical?style=social)](https://github.com/Arjunyaa/DBMS-Practical)
[![GitHub Forks](https://img.shields.io/github/forks/Arjunyaa/DBMS-Practical?style=social)](https://github.com/Arjunyaa/DBMS-Practical/fork)

**Happy Learning! 🎓💻**

</div>
