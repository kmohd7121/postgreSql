/* Data Definition (DDL) Commands – PostgreSQL Tutorial
This section of the article consists of those commands, which you can de ne your database. The commands are:
CREATE
ALTER
DROP
TRUNCATE
RENAME
*/
-- The CREATE SCHEMA statement is used to create a database or most commonly known as a schema.
CREATE SCHEMA teachers;

CREATE DATABASE demo;

-- The CREATE TABLE statement is used to create a new table in a database.
CREATE TABLE TeachersInfo
(
TeacherID int,
TeacherName varchar(255),
Address varchar(255),
City varchar(255),
PostalCode int,
Country varchar(255),
Salary int
);

-- The ALTER TABLE statement is used to either add, modify or delete constraints and columns from a table.
ALTER TABLE TeachersInfo
ADD DateOfBirth date;

-- The DROP SCHEMA statement is used to drop the complete schema.
DROP SCHEMA teachers;

-- The DROP TABLE statement is used to drop the entire table with all its values.
DROP TABLE TeachersInfo;

-- The TRUNCATE statement is used to delete the data which is present inside a table, but the table doesn’t get deleted.
TRUNCATE TABLE TeachersInfo;

-- The RENAME statement is used to rename one or more tables or columns.
ALTER TABLE TeachersInfo RENAME TO InfoTeachers;
ALTER TABLE InfoTeachers RENAME COLUMN dateofbirth TO dob;

/* Different Types Of Keys In Database – PostgreSQL Tutorial
Candidate Key – A Candidate Key is a combination of a minimal set of attributes which can uniquely identify a tuple. Any relation can have more than a 
single Candidate Key, with the key being a simple or a composite key.
Super Key – A Super Key is the set of attributes which can uniquely identify a tuple. So, a Candidate Key is a Super Key, but vice-versa isn’t true.
Primary Key – A Primary Key is a set of attributes that can be used to uniquely identify every tuple. So, if there are 3-4 candidate keys present in a
relationship, then out those, one can be chosen as a Primary Key.
Alternate Key – All the Candidate Keys other than the Primary Key is called as an Alternate Key.
Foreign Key – An attribute that can only take the values present as the values of some other attribute, is the foreign key to the attribute to which it refers.
Constraints Used In Database – PostgreSQL Tutorial:
NOT NULL – The NOT NULL constraint ensures that a NULL value cannot be stored in a column
UNIQUE – The UNIQUE constraint makes sure that all the values in a column are di erent
CHECK -The CHECK constraint ensures that all the values in a column satisfy a speci c condition.
DEFAULT -The DEFAULT constraint consists of a set of default values for a column when no value is speci ed.
INDEX – The INDEX constraint is used to create and retrieve data from the database very quickly
*/

/* Data Manipulation (DML) Commands – PostgreSQL Tutorial
This section of the article consists of the commands, by which you can manipulate your database. The commands are:
SET SEARCH_PATH
INSERT
UPDATE
DELETE
SELECT
Apart from these commands, there are also other manipulative operators/functions such as:
Arithmetic, Bitwise, Compound and Comparison Operators:
Logical Operators
Aggregate Functions
Special Operators
Set Operations
Limit, O set and Fetch
*/

-- SET SEARCH_PATH
-- This statement is used to mention which schema has to be used to perform all the operations.
SET search_path TO teachers;

-- INSERT
-- The INSERT statement is used to insert new records in a table.
INSERT INTO TeachersInfo
(TeacherID, TeacherName, Address, City, PostalCode, Country, Salary) 
VALUES 
('01', 'Saurav','Gangnam Street', 'Seoul', '06499', 'South Korea', '42000'); 


INSERT INTO TeachersInfo 
VALUES ('02', 'Preeti','Queens Quay', 'Rio Claro', '13500', 'Brazil', '45900');

INSERT INTO TeachersInfo 
VALUES ('05', 'Vinod','Queens Quay', 'Rio Claro', '1350', 'Brazil', '5900');

-- UPDATE
-- The UPDATE statement is used to modify the existing records in a table.
UPDATE TeachersInfo
SET TeacherName = 'Alfred', City= 'Frankfurt'
WHERE TeacherID = '01';

-- DELETE
-- The DELETE statement is used to delete existing records in a table.
DELETE FROM TeachersInfo WHERE TeacherName='Vinod';

-- SELECT 
-- The SELECT statement is used to select data from a database and the data returned is stored in a result table, called the result-set.
SELECT Teachername, City FROM TeachersInfo;
SELECT * FROM TeachersInfo;

/* Apart from the individual SELECT keyword, you can use the SELECT keyword with the following statements:
DISTINCT
ORDER BY
GROUP BY
HAVING Clause
*/

-- The ‘SELECT DISTINCT’ Statement
-- The SELECT DISTINCT statement is used to return only distinct or different values. So, 
-- if you have a table with duplicate values, then you can use this statement to list distinct values.
SELECT DISTINCT Country FROM TeachersInfo;

-- The ‘ORDER BY’ Statement
-- The ORDER BY statement is used to sort the desired results in ascending or descending order. 
-- By default, the results would be sorted in ascending order. If you want to sort the records 
-- in descending order, then you have to use the DESC keyword.
SELECT * FROM TeachersInfo
ORDER BY Country; 
 
SELECT * FROM TeachersInfo
ORDER BY Country DESC;
 
SELECT * FROM TeachersInfo
ORDER BY Country, TeacherName;
 
SELECT * FROM TeachersInfo
ORDER BY Country ASC, TeacherName DESC;

-- The ‘GROUP BY’ Statement
-- This statement is used with the aggregate functions to group the result-set by one or more columns.
SELECT COUNT(TeacherID), Country
FROM TeachersInfo
GROUP BY Country
ORDER BY COUNT(TeacherID) DESC;

-- The ‘HAVING’ Clause Statement
-- Since the WHERE keyword cannot be used with aggregate functions, the HAVING clause was introduced.
SELECT COUNT(TeacherID), Country
FROM TeachersInfo
GROUP BY Country
HAVING COUNT(Salary) >=2;

-- Arithmetic, Bitwise, Compound and Comparison Operators – PostgreSQL Tutorial
--LOGICAL OPERATORS
--This set of operators consists of logical operators such as AND/OR/NOT.

-- AND OPERATOR
-- This operator displays the records, which satisfy all the conditions separated by AND.
SELECT * FROM TeachersInfo
WHERE Country='Brazil' AND City='Rio Claro';

-- OR OPERATOR
-- This operator displays those records which satisfy any of the conditions separated by OR.
SELECT * FROM TeachersInfo
WHERE Country='Brazil' OR City='South Korea';

-- NOT OPERATOR
-- The NOT operator displays a record when the condition (s) is NOT TRUE.
SELECT * FROM TeachersInfo
WHERE NOT Country='India'; 
--You can also combine all the above three operators and write a query like this:
SELECT * FROM TeachersInfo
WHERE NOT Country='India' AND (City='Bengaluru' OR City='Rio Claro');

/*Aggregate Functions – PostgreSQL Tutorial
The following section of the article will include functions such as:
MIN()
MAX()
COUNT()
AVG()
SUM()
*/
-- MIN() Function
-- The MIN function returns the smallest value of the selected column in a table.
SELECT MIN(Salary) AS SmallestSalary
FROM TeachersInfo;

-- MAX() Function
-- The MAX function returns the largest value of the selected column in a table.
SELECT MAX(Salary) AS LargestSalary
FROM TeachersInfo;

-- COUNT() Function
-- The COUNT function returns the number of rows that match the specified criteria.
SELECT COUNT(TeacherID)
FROM TeachersInfo;

-- AVG() Function
-- The AVG function returns the average value of a numeric column that you choose.
SELECT AVG(Salary)
FROM TeachersInfo;

-- SUM() Function
-- The SUM function returns the total sum of a numeric column that you choose.
SELECT SUM(Salary)
FROM TeachersInfo;

/*Special Operators – PostgreSQL Tutorial
This section of the article will include the following operators:
BETWEEN
IS NULL
LIKE
IN
EXISTS
ALL
ANY
*/

-- BETWEEN Operator
-- The BETWEEN operator is an inclusive operator which selects values(numbers, texts or dates) within a given range.
SELECT * FROM TeachersInfo
WHERE salary BETWEEN 30000 AND 45000;

-- IS NULL Operator
-- Since, it is not possible to test for NULL values with the comparison operators(=, <, >), 
-- we can use IS NULL and IS NOT NULL operators instead.
SELECT TeacherName FROM TeachersInfo
WHERE Address IS NULL;
SELECT TeacherName FROM TeachersInfo
WHERE Address IS NOT NULL;

/*LIKE Operator
The LIKE operator is used in a WHERE clause to search for a specified pattern in a column of a table.
The mentioned below are the two wildcards that are used in conjunction with the LIKE operator:
% – The percent sign represents zero, one, or multiple characters
_ – The underscore represents a single character
*/
SELECT * FROM TeachersInfo
WHERE TeacherName LIKE 'P%';

SELECT * FROM TeachersInfo
WHERE TeacherName LIKE '_r%';

-- IN Operator
-- The IN operator is a shorthand operator and is used for multiple OR conditions.
SELECT * FROM TeachersInfo
WHERE Country IN ('South Korea', 'India', 'Brazil');
-- NOTE: You can also use IN while writing Nested Queries.

-- EXISTS Operator
-- The EXISTS operator is used to test if a record exists or not.
SELECT TeacherName
FROM TeachersInfo
WHERE EXISTS 
(SELECT * FROM TeachersInfo WHERE 
	TeacherID = 05 AND Salary>= 5000);

-- ALL Operator
-- The ALL operator is used with a WHERE or HAVING clause and returns true if all of the sub-query values 
-- meet the condition.
SELECT TeacherName
FROM TeachersInfo
WHERE TeacherID = ALL (SELECT TeacherID FROM TeachersInfo WHERE Salary >=5000);

-- ANY Operator
-- Similar to the ALL operator, the ANY operator is also used with a WHERE or HAVING clause and 
-- returns true if any of the sub-query values meet the condition.
SELECT TeacherName
FROM TeachersInfo
WHERE TeacherID = ANY (SELECT TeacherID FROM TeachersInfo WHERE Salary BETWEEN 32000 AND 45000);

-- Set Operations – PostgreSQL Tutorial
-- There are mainly three set operations: UNION, INTERSECT, MINUS.
-- UNION
-- The UNION operator is used to combine the result-set of two or more SELECT statements.
SELECT  column_name(s) FROM table1
UNION
SELECT  column_name(s )FROM table2;

-- INTERSECT
-- The INTERSECT clause is used to combine two SELECT statements and return the intersection of the data-sets of both the SELECT statements.
SELECT Column1 , Column2 ....
FROM  table_name;
WHERE condition
INTERSECT
SELECT Column1 , Column2 ....
FROM  table_name;
WHERE condition

-- EXCEPT
-- The EXCEPT operator returns those tuples that are returned by the first SELECT operation, and are not returned by the second SELECT operation.
SELECT  column_name
FROM  table_name;
EXCEPT
SELECT column_name
FROM table_name;

-- Limit, Offset and Fetch – PostgreSQL Tutorial
-- LIMIT
-- The LIMIT statement is used to retrieve a portion of the rows out of the complete rows present in the table.
SELECT * FROM TeachersInfo LIMIT 3;

-- OFFSET
-- The OFFSET statement omits the number of rows you mention and then retrieves the rest portion of the rows.
--Select 3 rows from TeachersInfo after the 5th row
SELECT * FROM TeachersInfo OFFSET 2 LIMIT 3; 
--Select all rows from TeachersInfo
SELECT * FROM TeachersInfo OFFSET 2;

/*FETCH
The FETCH keyword is used to fetch records from a table using a cursor. Here the cursors will be the following:
NEXT
PRIOR
FIRST
LAST
RELATIVE Count
ABSOLUTE Count
Count
ALL
BACKWARD
BACKWARD Count
BACKWARD ALL
FORWARD
FORWARD Count
FORWARD ALL
*/
SELECT * FROM TeachersInfo OFFSET 2 FETCH FIRST 5 ROWS ONLY;

-- Nested Queries – PostgreSQL Tutorial
-- Nested queries are those queries which have an outer query and inner subquery. So, basically,the subquery is a query which is nested within another
-- query such as SELECT, INSERT, UPDATE or DELETE.

/* Joins – PostgreSQL Tutorial
JOINS in PostgreSQL are used to combine rows from two or more tables, based on a related column between those tables. 
The following are the types of joins: 
INNER JOIN: The INNER JOIN returns those records which have matching values in both the tables.
LEFT JOIN: The LEFT JOIN returns records from the left table, and also those records which satisfy the condition from the right table.
RIGHT JOIN: The RIGHT JOIN returns records from the right table, and also those records which satisfy the condition from the left table.
FULL JOIN: The FULL JOIN returns all those records which either have a match in the left or the right table.
*/

SELECT Subjects.SubjectID, TeachersInfo.TeacherName
FROM Subjects
INNER JOIN TeachersInfo ON Subjects.TeacherID = TeachersInfo.TeacherID;

-- LEFT JOIN
SELECT TeachersInfo.TeacherName, Subjects.SubjectID
FROM TeachersInfo
LEFT JOIN Subjects ON TeachersInfo.TeacherID = Subjects.TeacherID
ORDER BY TeachersInfo.TeacherName;

-- RIGHT JOIN
SELECT Subjects.SubjectID
FROM Subjects
RIGHT JOIN TeachersInfo ON Subjects.SubjectID = TeachersInfo.TeacherID
ORDER BY Subjects.SubjectID;

-- FULL JOIN
SELECT TeachersInfo.TeacherName, Subjects.SubjectID
FROM TeachersInfo
FULL OUTER JOIN Subjects ON TeachersInfo.TeacherID = Subjects.SubjectID
ORDER BY TeachersInfo.TeacherName;

-- Views – PostgreSQL Tutorial
--A view is a single table, which is derived from other tables. So, a view contains rows and columns similar to a real table and has fields from one or more table.

-- The ‘CREATE VIEW’ statement
-- The CREATE VIEW statement is used to create a view from an existing table.
CREATE VIEW teachers_view AS
SELECT TeacherName, TeacherID
FROM TeachersInfo
WHERE City = 'Rio Claro';

-- The ‘DROP VIEW’ statement
-- The DROP VIEW statement is used to delete a view.
DROP VIEW teachers_view;

-- PostgreSQL Tutorial For Beginners: Stored Procedures 
-- Stored Procedures are snippets of codes which can be saved and re-used.

--Create two tables 
CREATE TABLE tbl1(tb1id int);
CREATE TABLE tbl2(tb2id int);
 
--Create Procedure
CREATE PROCEDURE insert_data (a1 integer, b1 integer)
LANGUAGE SQL
AS $$
INSERT INTO tbl1 VALUES (a1);
INSERT INTO tbl2 VALUES (b1);
$$;
 
CALL insert_data(4, 5);

-- Triggers – PostgreSQL Tutorial
--Triggers are a set of  SQL statements which are stored in the database catalog. These statements are executed whenever an event associated with a table occurs.
--So, a trigger can be invoked either BEFORE or AFTER the data is changed by INSERT, UPDATE or DELETE statement. 

--CREATE TRIGGER
CREATE TRIGGER example_trigger AFTER INSERT ON TeachersInfo;

/* Data Control (DCL) Commands – PostgreSQL Tutorial
This section consists of those commands which are used to control privileges in the database. The commands are:
GRANT
REVOKE
*/

-- GRANT
-- The GRANT command is used to provide user access privileges or other privileges for the schema.
GRANT INSERT ON TeachersInfo TO PUBLIC;

-- REVOKE
-- The REVOKE command is used to withdraw user’s access privileges given by using the GRANT command.
REVOKE INSERT ON TeachersInfo FROM PUBLIC;

/* Transaction Control (TCL) Commands – PostgreSQL Tutorial
BEGIN
COMMIT
ROLLBACK
SAVEPOINT
RELEASE SAVEPOINT
SET TRANSACTION
*/

-- BEGIN
-- The BEGIN TRANSACTION command is used to start the transaction.
BEGIN;
DELETE * FROM TeachersInfo WHERE Salary = 65000;

-- COMMIT
-- The COMMIT command saves all the transactions to the database since the last COMMIT or ROLLBACK command.
DELETE * FROM TeachersInfo WHERE Salary = 65000;
COMMIT;

-- ROLLBACK
-- The ROLLBACK command is used to undo transactions since the last COMMIT or ROLLBACK command was issued.
DELETE * FROM TeachersInfo WHERE Salary = 65000;
ROLLBACK;

-- SAVEPOINT
-- The SAVEPOINT command defines a new savepoint within the current transaction.
SAVEPOINT SP1;
DELETE FROM TeachersInfo WHERE Fees = 65000;
SAVEPOINT SP2;

-- RELEASE SAVEPOINT
-- The RELEASE SAVEPOINT command is used to remove a SAVEPOINT that you have created.
RELEASE SAVEPOINT SP2;

-- SET TRANSACTION
-- The SET TRANSACTION command sets the characteristics of the current transaction.
SET TRANSACTION transaction_mode;

-- UUID Data Type – PostgreSQL Tutorial:
-- UUID data type stores Universally Unique Identifiers (UUID) with a 128 byte length. 
-- It is written as a sequence of lower-case hexadecimal digits and is generated by an algorithm. 
-- This algorithm is designed to make sure that the same UUID is not generated by any other person in the universe.
--Generate a a unique UUID
SELECT uuid_generate_v4();
