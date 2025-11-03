SET SERVEROUTPUT ON;
SHOW SERVEROUTPUT;

-- PROCEDURES AND FUNCTIONS

-- 1. Factorial Function
CREATE OR REPLACE FUNCTION factorial(n INT)
RETURN INT AS
    fact INT := 1;
BEGIN
    FOR i IN 1..n LOOP
        fact := fact * i;
    END LOOP;
    RETURN fact;
END;
/

DECLARE
    c INT;
    num INT;
BEGIN
    num :=  &num;
    c := factorial(num);
    DBMS_OUTPUT.PUT_LINE('Factorial of  ' || num ||'  is ' || c);
END;
/

-- 2. Student Details Table and Procedure
CREATE TABLE student_details (
    roll INT,
    marks INT,
    phone INT
);

INSERT INTO student_details VALUES (1, 70, 9496947423);
INSERT INTO student_details VALUES (1, 47, 987654321);
INSERT INTO student_details VALUES (2, 48, 912365478);
INSERT INTO student_details VALUES (3, 48, 6258741138);

SELECT * FROM student_details;

CREATE OR REPLACE PROCEDURE pr1 AS
BEGIN
    UPDATE student_details
    SET marks = marks + (marks * 0.05);
    COMMIT;
END;
/

BEGIN
    pr1;
END;
/

SELECT * FROM student_details ORDER BY roll;

-- 3. Students Table, Function, and Procedure
CREATE TABLE students (
    id INT,
    name VARCHAR(30),
    m1 INT,
    m2 INT,
    m3 INT,
    total INT,
    grade VARCHAR(1)
);

DECLARE
    id INT;
    name VARCHAR(30);
    m1 INT;
    m2 INT;
    m3 INT;
    t INT;
BEGIN
    id := :id;
    name := :name;
    m1 := :m1;
    m2 := :m2;
    m3 := :m3;
    t := m1 + m2 + m3;
    INSERT INTO students(id, name, m1, m2, m3, total)
    VALUES(id, name, m1, m2, m3, t);
END;
/

SELECT * FROM students;

DELETE FROM students WHERE id = 1;

CREATE OR REPLACE FUNCTION f1(t IN INT)
RETURN VARCHAR
AS
    a INT;
    g VARCHAR(2);
BEGIN
    a := t / 3;
    IF (a >= 90) THEN
        g := 'A+';
    ELSIF (a >= 80) THEN
        g := 'A';
    ELSIF (a >= 70) THEN
        g := 'B';
    ELSIF (a >= 60) THEN
        g := 'C';
    ELSE
        g := 'D';
    END IF;
    RETURN g;
END;
/

CREATE OR REPLACE PROCEDURE p1
AS
    c VARCHAR(30);
BEGIN
    UPDATE students
    SET grade = f1(total);
    DBMS_OUTPUT.PUT_LINE('Grades updated successfully!');
END;
/

BEGIN
    p1;
END;
/

SELECT * FROM students;

-- TRIGGERS

-- 1. Customer Insert Trigger
CREATE TABLE customer_details (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    address VARCHAR(255)
);

CREATE OR REPLACE TRIGGER tri
AFTER INSERT ON customer_details
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('A row is inserted');
END;
/

INSERT INTO customer_details VALUES (1, 'abc', 'Some Address');
-- 2. Employee Salary Trigger
CREATE TABLE emp_details (
    empid INT PRIMARY KEY,
    empname VARCHAR(50),
    salary INT
);

CREATE OR REPLACE TRIGGER trig
AFTER INSERT ON emp_details
FOR EACH ROW
WHEN (NEW.salary > 20000)
BEGIN
    DBMS_OUTPUT.PUT_LINE('Salary is greater than 20000');
END;
/

INSERT INTO emp_details VALUES (1, 'John Doe', 30000);
INSERT INTO emp_details VALUES (2, 'Alen', 25000);

-- 3. Customer Count Trigger
CREATE TABLE cust_count (
    count_row INT
);

INSERT INTO cust_count (count_row) VALUES (0);

CREATE TABLE customer_detail (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    address VARCHAR(255)
);

CREATE OR REPLACE TRIGGER trigg
BEFORE INSERT OR DELETE ON customer_detail
FOR EACH ROW
BEGIN
    IF DELETING THEN
        UPDATE cust_count SET count_row = count_row - 1;
    ELSE
        UPDATE cust_count SET count_row = count_row + 1;
    END IF;
END;
/

INSERT INTO customer_detail VALUES (2, 'Bid', 'XYC');
INSERT INTO customer_detail VALUES (3, 'Bif', 'XYV');
INSERT INTO customer_detail VALUES (4, 'Big', 'XYE');
INSERT INTO customer_detail VALUES (1, 'Bic', 'XYZ');

SELECT * FROM cust_count;

DELETE FROM customer_detail WHERE cust_id = 4;

SELECT * FROM cust_count;


-- 4. Employee Backup Trigger
CREATE TABLE emp_details (
    empid INT PRIMARY KEY,
    empname VARCHAR2(30),
    salary INT
);

INSERT INTO emp_details VALUES (1, 'Alice', 5000);
INSERT INTO emp_details VALUES (2, 'Bob', 6000);
INSERT INTO emp_details VALUES (3, 'Charlie', 7000);

CREATE TABLE deleted (
    empid INT,
    empname VARCHAR2(30),
    salary INT
);

CREATE TABLE updatd (
    empid INT,
    empname VARCHAR2(30),
    salary INT
);

CREATE OR REPLACE TRIGGER trigge
BEFORE DELETE OR UPDATE ON emp_details
FOR EACH ROW
BEGIN
    IF DELETING THEN
        INSERT INTO deleted VALUES (:OLD.empid, :OLD.empname, :OLD.salary);
    ELSE
        INSERT INTO updatd VALUES (:NEW.empid, :NEW.empname, :NEW.salary);
    END IF;
END;
/

DELETE FROM emp_details WHERE empid = 2;
SELECT * FROM deleted;

UPDATE emp_details SET salary = 10000 WHERE empid = 1;
SELECT * FROM updatd;


