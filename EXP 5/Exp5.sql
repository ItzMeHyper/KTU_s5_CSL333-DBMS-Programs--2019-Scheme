CREATE TABLE Employee(
  Emp_Id INT PRIMARY KEY,
  Emp_Name VARCHAR(20),
  Dept VARCHAR(20),
  Salary DECIMAL(10, 2)
);

INSERT INTO Employee VALUES (1, 'David Smith', 'Marketing', 7500.00);
INSERT INTO Employee VALUES (2, 'Olivia Jones', 'HR', 6800.00);
INSERT INTO Employee VALUES (3, 'Charles Brown', 'Sales', 6900.00);
INSERT INTO Employee VALUES (4, 'Alice Green', 'Production', 7900.00);
INSERT INTO Employee VALUES (5, 'Diana Prince', 'Marketing', 8300.00);

--1
SELECT * FROM Employee WHERE Salary > 7000;

--2
UPDATE Employee SET Salary = 8200.00 WHERE Emp_name = 'David Smith';

--3
INSERT INTO Employee (Emp_id, Emp_name, Dept, Salary)
VALUES (6, 'Daniel Harris', 'Production', 6700.00);

--4
DELETE FROM Employee WHERE Emp_ID = '3';

--5
SELECT * FROM Employee
WHERE Emp_name NOT LIKE 'D%' AND Emp_name NOT LIKE 'O%';

--6
SELECT Dept, SUM(Salary) AS Total_Salary
FROM Employee
GROUP BY Dept;

--7
UPDATE Employee
SET Salary = Salary * 1.05
WHERE Dept = 'Production';

--8
DELETE FROM Employee WHERE Salary < 7000;

--9
SELECT Emp_name, Salary
FROM Employee
WHERE Salary = (SELECT MIN(Salary) FROM Employee);

--10
UPDATE Employee
SET Salary = 8200.00
WHERE Dept = 'Marketing';

--11
SELECT Emp_name FROM Employee
WHERE Emp_name LIKE 'A%';

--12
SELECT Emp_name FROM Employee
WHERE Emp_name LIKE '%it%';

--13
SELECT DISTINCT UPPER(Dept) AS Department FROM Employee;

--14
SELECT * FROM Employee
WHERE Dept LIKE 'M_r%' AND Dept LIKE '%ket%';

--15
SELECT DISTINCT UPPER(REVERSE(Dept)) AS Reversed_Department
FROM Employee;



DROP TABLE Employee;