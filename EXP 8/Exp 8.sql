CREATE TABLE Customer(
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(50),
  ContactNo VARCHAR(15),
  Address VARCHAR(100),
  City VARCHAR(20),
  PostalCode VARCHAR(10),
  Country VARCHAR(20)
);

CREATE TABLE Employees(
  EmployeeID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  BirthDate DATE 
);

CREATE TABLE Orders(
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  EmployeeID INT,
  OrderDate DATE,
  ShipperID INT,
  FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID)
);


INSERT INTO Customer VALUES (1, 'Alice Smith', '1234567890', '123 Apple St', 'New York', '10001', 'USA');
INSERT INTO Customer VALUES (2, 'Bob Johnson', '2345678901', '456 Banana Ave', 'Los Angeles', '90001', 'USA');
INSERT INTO Customer VALUES (3, 'Charlie Lee', '3456789012', '789 Cherry Blvd', 'Chicago', '60007', 'USA');
INSERT INTO Customer VALUES (4, 'David Kumar', '4567890123', '321 Orange Rd', 'Delhi', '110001', 'India');
INSERT INTO Customer VALUES (5, 'Eve Wang', '5678901234', '654 Mango Ln', 'Shanghai', '200000', 'China');
INSERT INTO Customer VALUES (6, 'Ravi Singh', '9999999999', '123 New Rd', 'Delhi', '110001', 'India');
INSERT INTO Customer VALUES (7, 'Anita Mehra', '8888888888', '456 New Rd', 'Delhi', '110001', 'India');
INSERT INTO Customer VALUES (8, 'Sunil Rao', '7777777777', '789 New Rd', 'Delhi', '110001', 'India');
SELECT * FROM Customer;

INSERT INTO Employees VALUES (101, 'John', 'Brown', TO_DATE('15-06-1975', 'DD-MM-YYYY'));
INSERT INTO Employees VALUES (102, 'Linda', 'Davis', TO_DATE('22-08-1982', 'DD-MM-YYYY'));
INSERT INTO Employees VALUES (103, 'James', 'Miller', TO_DATE('03-12-1985', 'DD-MM-YYYY'));
INSERT INTO Employees VALUES (104, 'Emily', 'Wilson', TO_DATE('10-03-1990', 'DD-MM-YYYY'));
INSERT INTO Employees VALUES (105, 'Robert', 'Taylor', TO_DATE('25-11-1978', 'DD-MM-YYYY'));
SELECT * FROM Employees;

INSERT INTO Orders VALUES (1001, 1, 101, TO_DATE('01-01-2021', 'DD-MM-YYYY'), 1);
INSERT INTO Orders VALUES (1002, 1, 102, TO_DATE('15-02-2021', 'DD-MM-YYYY'), 2);
INSERT INTO Orders VALUES (1003, 2, 103, TO_DATE('10-03-2021', 'DD-MM-YYYY'), 1);
INSERT INTO Orders VALUES (1004, 3, 104, TO_DATE('25-04-2021', 'DD-MM-YYYY'), 3);
INSERT INTO Orders VALUES (1005, 3, 105, TO_DATE('30-05-2021', 'DD-MM-YYYY'), 2);
INSERT INTO Orders VALUES (1006, 1, 101, TO_DATE('01-06-2021', 'DD-MM-YYYY'), 1);
INSERT INTO Orders VALUES (1007, 1, 102, TO_DATE('01-07-2021', 'DD-MM-YYYY'), 2);
SELECT * FROM Orders;


--1
SELECT * FROM Customer
ORDER BY CustomerName ASC;

--2   
SELECT * FROM Orders
ORDER BY OrderDate ASC;

--3
SELECT * FROM Employees
WHERE BirthDate > TO_DATE('01-01-1980', 'DD-MM-YYYY')
ORDER BY BirthDate DESC;

--4
SELECT * FROM Orders 
WHERE CustomerID IN(SELECT CustomerID FROM Customer WHERE Country = 'USA') 
ORDER BY OrderDate DESC;

--5
SELECT C.CustomerID, C.CustomerName, COUNT(o.OrderID) AS TotalOrders
FROM Customer C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.CustomerName;

-- or 

SELECT C.CustomerID, C.CustomerName,
(SELECT COUNT(*) FROM ORDERS O
WHERE O.CustomerID = C.CustomerID) AS TotalOrders
FROM Customer C;

--6
SELECT City, COUNT(CustomerID) AS TotalCustomers
FROM Customer
GROUP BY City;

--7
SELECT C.CustomerName, COUNT(O.OrderID) AS TotalOrders
FROM Customer C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerName
HAVING COUNT(O.OrderID) > 2;

--8
SELECT City, COUNT(CustomerID) AS TotalCustomers
FROM Customer
GROUP BY City
HAVING COUNT(CustomerID) > 3;
