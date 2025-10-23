CREATE TABLE bankdetails (
    accno INT,
    name VARCHAR2(15),
    balance INT,
    adate DATE
);

INSERT INTO bankdetails VALUES (1001, 'aby', 3005, '10-oct-15');
INSERT INTO bankdetails VALUES (1002, 'alan', 4000, '05-may-95');
INSERT INTO bankdetails VALUES (1003, 'amal', 5000, '16-mar-92');
INSERT INTO bankdetails VALUES (1004, 'jeffin', 3500, '01-apr-50');

SELECT * FROM bankdetails;

CREATE TABLE banknew (
    accno INT,
    intr INT
);

DECLARE
    CURSOR temp IS
        SELECT accno, name, balance, adate FROM bankdetails;
    tempvar temp%ROWTYPE;
    intr INT;
BEGIN
    OPEN temp;
    LOOP
        FETCH temp INTO tempvar;
        EXIT WHEN temp%NOTFOUND;
        intr := 0.08 * tempvar.balance;
        INSERT INTO banknew VALUES (tempvar.accno, intr);
    END LOOP;
    CLOSE temp;
END;
/

SELECT * FROM banknew;
