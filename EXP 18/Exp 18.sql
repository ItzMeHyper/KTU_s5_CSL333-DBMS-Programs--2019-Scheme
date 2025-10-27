SET SERVEROUTPUT ON;

DECLARE
    i INT := &i;
BEGIN
    i := (i + 1) / 0;
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Division by zero : logical error');
END;
/
