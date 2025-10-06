CREATE TABLE Items (
    itemid      INT PRIMARY KEY,
    itemname    VARCHAR(50),
    category    VARCHAR(30),
    price       DECIMAL(10,2),
    instock    INT CHECK (instock >= 0)
);

CREATE TABLE Customers (
    custid      INT PRIMARY KEY,
    custname    VARCHAR(50),
    address     VARCHAR(100),
    state       VARCHAR(30)
);

CREATE TABLE Orders (
    orderid     INT PRIMARY KEY,
    itemid      INT,
    custid      INT,
    quantity    INT,
    orderdate   DATE,
    FOREIGN KEY (itemid) REFERENCES Items(itemid),
    FOREIGN KEY (custid) REFERENCES Customers(custid)
);

CREATE TABLE Delivery (
    deliveryid  INT PRIMARY KEY,
    custid      INT,
    orderid     INT,
    FOREIGN KEY (custid) REFERENCES Customers(custid),
    FOREIGN KEY (orderid) REFERENCES Orders(orderid)
);

INSERT INTO Items VALUES (1, 'iPhone 14', 'Mobile', 80000, 20);
INSERT INTO Items VALUES (2, 'Samsung Galaxy S4', 'Mobile', 15000, 50);
INSERT INTO Items VALUES (3, 'Dell Laptop', 'Laptop', 55000, 15);
INSERT INTO Items VALUES (4, 'Sony Headphones', 'Accessories', 5000, 100);
INSERT INTO Items VALUES (5, 'MacBook Pro', 'Laptop', 120000, 10);

INSERT INTO Customers VALUES (101, 'John', '123 Main St', 'Texas');
INSERT INTO Customers VALUES (102, 'Mickey', '456 Park Ave', 'California');
INSERT INTO Customers VALUES (103, 'Alice', '789 Hill Rd', 'Nevada');
INSERT INTO Customers VALUES (104, 'Jack', '321 Oak St', 'Texas');
INSERT INTO Customers VALUES (105, 'Robert', '654 Pine Rd', 'Florida');

INSERT INTO Orders VALUES (201, 1, 101, 1, DATE '2013-02-10');
INSERT INTO Orders VALUES (202, 2, 102, 2, DATE '2013-05-15');
INSERT INTO Orders VALUES (203, 3, 103, 1, DATE '2014-01-20');
INSERT INTO Orders VALUES (204, 4, 104, 3, DATE '2015-03-12');
INSERT INTO Orders VALUES (205, 5, 102, 1, DATE '2014-07-07');

INSERT INTO Delivery VALUES (301, 101, 201);
INSERT INTO Delivery VALUES (302, 102, 202);
INSERT INTO Delivery VALUES (303, 103, 203);
--1
SELECT DISTINCT c.* 
FROM Customers c 
JOIN Orders o ON c.custid = o.custid;

--2
SELECT DISTINCT c.* 
FROM Customers c 
JOIN Delivery d ON c.custid = d.custid;

--3
SELECT c.custname, o.orderdate 
FROM Customers c 
JOIN Orders o ON c.custid = o.custid
WHERE c.custname LIKE 'J%';

--4
SELECT i.itemname, i.price 
FROM Items i 
JOIN Orders o ON i.itemid = o.itemid
JOIN Customers c ON o.custid = c.custid
WHERE c.custname = 'Mickey';

--5
SELECT DISTINCT c.* 
FROM Customers c 
JOIN Orders o ON c.custid = o.custid
WHERE o.orderdate > DATE '2013-01-01'
AND o.orderid NOT IN (SELECT orderid FROM Delivery);

--6
(SELECT itemid FROM Orders)
UNION
(SELECT o.itemid FROM Orders o 
 WHERE o.orderid NOT IN (SELECT orderid FROM Delivery));

--7
(SELECT custid FROM Orders)
INTERSECT
(SELECT custid FROM Delivery);

--8
(SELECT custid FROM Orders)
MINUS
(SELECT custid FROM Delivery);

--9
SELECT c.custname, COUNT(o.orderid) AS total_orders
FROM Customers c 
JOIN Orders o ON c.custid = o.custid
GROUP BY c.custname
HAVING COUNT(o.orderid) = (
    SELECT MAX(COUNT(*)) 
    FROM Orders 
    GROUP BY custid
);

--10
SELECT DISTINCT c.* 
FROM Customers c 
JOIN Orders o ON c.custid = o.custid
JOIN Items i ON o.itemid = i.itemid
WHERE i.price > 5000;

--11
SELECT c.custname, c.address 
FROM Customers c
WHERE c.custid NOT IN (
    SELECT o.custid 
    FROM Orders o 
    JOIN Items i ON o.itemid = i.itemid
    WHERE i.itemname = 'Samsung Galaxy S4'
);

--12
SELECT c.custid, c.custname, o.orderid 
FROM Customers c 
LEFT OUTER JOIN Orders o ON c.custid = o.custid;

SELECT c.custid, c.custname, o.orderid 
FROM Customers c 
RIGHT OUTER JOIN Orders o ON c.custid = o.custid;

--13
SELECT state, COUNT(*) AS total_customers
FROM Customers
GROUP BY state;

--14
SELECT category, itemname, price 
FROM Items 
WHERE price > (SELECT AVG(price) FROM Items)
GROUP BY category, itemname, price;
