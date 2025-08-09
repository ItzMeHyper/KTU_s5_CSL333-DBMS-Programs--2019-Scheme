CREATE TABLE LANGUAGE (
    Language_Id INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE PUBLISHER (
    Publisher_Id INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255)
);

CREATE TABLE BOOK (
    Book_Id INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Language_Id INT,
    MRP DECIMAL(10, 2),
    Publisher_Id INT,
    Publisher_Date DATE,
    Volume INT,
    Status VARCHAR(50),
    FOREIGN KEY (Language_Id) references LANGUAGE(Language_Id),
    FOREIGN KEY (Publisher_Id) references PUBLISHER(Publisher_Id)
);

CREATE TABLE AUTHOR (
    Author_Id INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone_Number VARCHAR(20),
    Status VARCHAR(50)
);

CREATE TABLE BOOK_AUTHOR (
    Book_Id INT,
    Author_Id INT,
    PRIMARY KEY (Book_Id, Author_Id),
    FOREIGN KEY (Book_Id) references BOOK(Book_Id),
    FOREIGN KEY (Author_Id) references AUTHOR(Author_Id)
);

CREATE TABLE MEMBER (
    Member_Id INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Branch_Code VARCHAR(10),
    Roll_Number VARCHAR(20),
    Phone_Number VARCHAR(20),
    Email_Id VARCHAR(100),
    Date_Of_Join DATE,
    Status VARCHAR(50)
);

CREATE TABLE BOOK_ISSUE (
    Issue_ID INT PRIMARY KEY,
    Date_Of_Issue DATE NOT NULL,
    Book_Id INT,
    Member_Id INT,
    Expected_Date_Of_Return DATE,
    Status VARCHAR(50),
    FOREIGN KEY (Book_Id) references BOOK(Book_Id),
    FOREIGN KEY (Member_Id) references MEMBER(Member_Id)
);

CREATE TABLE BOOK_RETURN (
    Issue_ID INT PRIMARY KEY,
    Actual_Date_Of_Relationship DATE,
    LateDays INT,
    LateFee DECIMAL(10, 2),
    FOREIGN KEY (Issue_ID) references BOOK_ISSUE(Issue_ID)
);

CREATE TABLE LATE_FEE_RULE (
    FromDays INT,
    Todays INT,
    Amount DECIMAL(10, 2),
    PRIMARY KEY (FromDays, Todays)
);

INSERT INTO MEMBER (Member_Id, Name, Branch_Code, Roll_Number, Phone_Number, Email_Id, Date_Of_Join, Status)
VALUES (1, 'Amit Sharma', 'CSE', 'CS2025001', '9876543210', 'amit.sharma@example.com', DATE '2025-07-14', 'Active');

INSERT INTO PUBLISHER (Publisher_Id, Name, Address)
VALUES (007, 'Tony Stark', 'Avengers Street Sea view villa');

INSERT INTO PUBLISHER (Publisher_Id, Name, Address)
VALUES (9, 'Peter Parker', 'Avengers Towers Cell no 9');

INSERT INTO PUBLISHER (Publisher_Id, Name, Address)
VALUES (371, 'McGraw Hill', '11 West 19th Street, New York');

INSERT INTO PUBLISHER (Publisher_Id, Name, Address)
VALUES (370, 'Pearson Education', '221B Baker Street, London');

--1
ALTER TABLE BOOK
ADD Ratings int;

--2
ALTER TABLE MEMBER
MODIFY Phone_Number int;


-----
SELECT constraint_name, constraint_type, table_name
FROM user_constraints
WHERE table_name = 'BOOK';

ALTER TABLE BOOK DISABLE CONSTRAINT SYS_C0081846;
ALTER TABLE BOOK DISABLE CONSTRAINT SYS_C0081845;
-----

--3
TRUNCATE TABLE PUBLISHER;

--4
DROP TABLE AUTHOR CASCADE CONSTRAINTS;

--5
RENAME LATE_FEE_RULE  TO FINE;




