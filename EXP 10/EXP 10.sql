CREATE TABLE Bank (
    BankId INT PRIMARY KEY,
    BankName VARCHAR(50),
    HeadOffice VARCHAR(100),
    Branch VARCHAR(50),
    BranchCode VARCHAR(10)
);

INSERT INTO Bank VALUES (1, 'SBI', 'Mumbai', 'Pune', 'SBI001');
INSERT INTO Bank VALUES (2, 'HDFC', 'Mumbai', 'Delhi', 'HDFC002');
INSERT INTO Bank VALUES (3, 'ICICI', 'Chennai', 'Hyderabad', 'ICICI003');
INSERT INTO Bank VALUES (4, 'Axis Bank', 'Bangalore', 'Kolkata', 'AXIS004');

SELECT * FROM Bank;

SAVEPOINT sp1;

INSERT INTO Bank VALUES (5, 'Canara Bank', 'Bangalore', 'Chennai', 'CAN005');

SELECT * FROM Bank;

ROLLBACK TO sp1;

SELECT * FROM Bank;

COMMIT;

SELECT * FROM Bank;