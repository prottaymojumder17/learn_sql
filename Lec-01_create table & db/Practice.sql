/*
    create table
    make a table named Students with the following columns:
    1.student_id -> int,primary key,auto increment
    2. name -> varchar(50), not null
    3. email -> varchar(100), unique
    4. age -> intt , must greater than or equal to 18
    5. course -> varchar(50), default = "BCA"
*/

CREATE DATABASE SchoolDB;

USE SchoolDB;

CREATE TABLE Students(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT check(age>=18),
    course VARCHAR(50)
);

-- Insert Data

INSERT INTO Students (
    name,email,age,course
)
VALUES
("prottay","prottay@yahoo.com",21,"DBMS"),
("Mojumder","mojumder@gmail.com",22,"AOL"),
("P Mojumder","pmojumder@gmail.com",23,"Computer A."),
("Prottay Mojumder","pmojumder@yahoo.com",20,"DBMS Lab");


/*
4. update record as
    update the course of one student to "MCA".
    Change the age of a student with student_id = 2 to 25
*/

UPDATE Students
SET course = "MCA"
WHERE student_id = 3;

UPDATE Students
SET age = 25
WHERE student_id = 2;



/*
5. Delete record
    delete the student whose student_id = 3.
*/

DELETE FROM Students
WHERE student_id = 3;


SELECT * FROM Students;
