CREATE TABLE Student (
Roll_No INT PRIMARY KEY,
Name VARCHAR(50),
Physics INT,
Chemistry INT,
Mathematics INT
);

INSERT INTO Student VALUES (1, 'Alice', 20, 18, 45);
INSERT INTO Student VALUES (2, 'Bob', 10, 15, 35);
INSERT INTO Student VALUES (3, 'Charlie', 12, 10, 40);
INSERT INTO Student VALUES (4, 'David', 22, 20, 48);
INSERT INTO Student VALUES (5, 'Eva', 14, 13, 26);
INSERT INTO Student VALUES (6, 'Frank', 18, 14, 20);
INSERT INTO Student VALUES (7, 'Anu', 10, 12, 25);
INSERT INTO Student VALUES (8, 'Arjun', 23, 22, 49);
INSERT INTO Student VALUES (9, 'Ian', 8, 11, 33);
INSERT INTO Student VALUES (10, 'Jack', 25, 25, 50);

SELECT * FROM Student;

--1
SELECT AVG(Physics) AS Avg_Physics FROM Student;

--2
SELECT MAX(Mathematics) AS Highest_Mark_Maths FROM Student;

--3
SELECT MIN(Chemistry) AS Lowest_Mark_Chemistry FROM Student;

--4
SELECT COUNT(*) AS Physics_Passed FROM Student
WHERE Physics >= 12;

--5
SELECT Roll_No, Name
FROM Student
WHERE Physics >= 12 AND Chemistry >= 12 AND Mathematics >= 25;

--6
SELECT Roll_No, Name,
       (Physics + Chemistry + Mathematics) AS Total_Marks,
       CASE
           WHEN Physics >= 12 AND Chemistry >= 12 AND Mathematics >= 25 THEN 'Pass'
           ELSE 'Fail'
       END AS Result,
       RANK() OVER (ORDER BY (Physics + Chemistry + Mathematics) DESC) AS Rank
FROM Student;

--7
SELECT (COUNT(CASE WHEN Mathematics >= 25 THEN 1 END) * 100.0 / COUNT(*)) 
       AS pass_percentage_math
FROM Student;

--8
SELECT (COUNT(CASE WHEN Physics >= 12 AND Chemistry >= 12 AND Mathematics >= 25 THEN 1 END) * 100.0 / COUNT(*)) 
AS Overall_Pass_Percentage FROM Student;

--9
SELECT AVG(Physics + Chemistry + Mathematics) AS Class_Average
FROM Student;

--10
SELECT COUNT(*) AS Total_Pass_Students FROM Student
WHERE Physics >= 12 AND Chemistry >= 12 AND Mathematics >= 25;
