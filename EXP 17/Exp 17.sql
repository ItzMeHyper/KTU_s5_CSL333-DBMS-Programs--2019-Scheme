SET SERVEROUTPUT ON;
SHOW SERVEROUTPUT;

-- 1
CREATE OR REPLACE PACKAGE Pk1 AS
    PROCEDURE proc1(a INT, b INT);
END Pk1;
/

-- 2
CREATE OR REPLACE PACKAGE BODY Pk1 AS
    PROCEDURE proc1(a INT, b INT) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Sum: ' || (a + b));
    END proc1;
END Pk1;
/

-- 3

DECLARE
    p INT;
    q INT;
BEGIN
    p := :p;
    q := :q;
    Pk1.proc1(p, q);
END;
/

-- PACKAGE SPECIFICATION

CREATE OR REPLACE PACKAGE Pk1 AS
    PROCEDURE proc1(a INT, b INT);
    PROCEDURE proc2(a INT);
    FUNCTION fn11(a INT) RETURN VARCHAR2;
    FUNCTION fn22(a INT, b INT, c INT) RETURN INT;
END Pk1;
/


-- PACKAGE BODY
CREATE OR REPLACE PACKAGE BODY Pk1 AS

    PROCEDURE proc1(a INT, b INT) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Sum: ' || (a + b));
        DBMS_OUTPUT.PUT_LINE('AVG: ' || ((a + b) / 2));
        DBMS_OUTPUT.PUT_LINE('Product: ' || (a * b));
    END proc1;

    PROCEDURE proc2(a INT) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Square root of ' || a || ' is ' || SQRT(a));
    END proc2;

    FUNCTION fn11(a INT) RETURN VARCHAR2 IS
        b VARCHAR2(4);
    BEGIN
        IF (MOD(a, 2) = 0) THEN
            RETURN 'even';
        ELSE
            RETURN 'odd';
        END IF;
    END fn11;

    FUNCTION fn22(a INT, b INT, c INT) RETURN INT IS
        d INT;
    BEGIN
        d := a + b + c;
        RETURN d;
    END fn22;

END Pk1;
/


-- RESULT
DECLARE
    p INT;
    q INT;
    r INT;
    s INT;
    result VARCHAR2(4);
    sum1 INT;
BEGIN
    p := :p;
    q := :q;
    r := :r;
    s := :s;

    Pk1.proc1(p, q);
    Pk1.proc2(r);

    result := Pk1.fn11(s);
    sum1 := Pk1.fn22(p, q, s);

    DBMS_OUTPUT.PUT_LINE(s || ' is ' || result);
    DBMS_OUTPUT.PUT_LINE('Sum of ' || p || ', ' || q || ' and ' || s || ' is ' || sum1);
END;
/