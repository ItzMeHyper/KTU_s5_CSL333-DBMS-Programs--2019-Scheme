CREATE TABLE Bank (
    BankCode VARCHAR(3) PRIMARY KEY,
    BankName VARCHAR(100) NOT NULL,
    HeadOffice VARCHAR(100),
    Branches INT CHECK (Branches > 0)
);

INSERT INTO Bank VALUES('SBT', 'State Bank of Travancore', 'Ernakulam', 50);
INSERT INTO Bank VALUES('SBI', 'State Bank of Inda', 'Mumbai', 50);
INSERT INTO Bank VALUES('FB', 'Federal Bank', 'Ernakulam', 20);
INSERT INTO Bank VALUES('HDF', 'HDFC Bank', 'Munnar', 40);
SELECT * FROM Bank;

CREATE TABLE Branch (
    BranchId INT PRIMARY KEY,
    BranchName VARCHAR(100) DEFAULT 'New Delhi',
    BankId VARCHAR(3),
    CONSTRAINT fk_bank FOREIGN KEY (BankId) REFERENCES Bank(BankCode)
);

INSERT INTO Branch VALUES(1, 'Kottayam', 'SBT');
INSERT INTO Branch VALUES(2, 'Ernakulam', 'SBI');
INSERT INTO Branch VALUES(3, 'New Delhi', 'SBI');
INSERT INTO Branch VALUES(4, 'Kottayam', 'HDF');
SELECT * FROM Branch;

--5
CREATE VIEW Bank_HeadOffice AS
SELECT * FROM Bank
WHERE HeadOffice = 'Ernakulam';

SELECT * FROM Bank_HeadOffice;

--6
CREATE VIEW Bank_Branch AS
SELECT b.*
FROM Bank b
JOIN Branch br ON b.BankCode = br.BankId
WHERE br.BranchName = 'Kottayam';

SELECT * FROM Bank_Branch;



