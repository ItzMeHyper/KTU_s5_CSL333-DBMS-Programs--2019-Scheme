SET SERVEROUTPUT ON;
SHOW SERVEROUTPUT; 

--1

DECLARE
    num INT;
    i   INT;
BEGIN
    -- Assign value to num from a bind variable
    num := :num;  
    i := num - 1;

    IF num = 0 THEN
        dbms_output.put_line('Factorial is: 1');
    ELSE
        WHILE i > 0 LOOP
            num := num * i;
            i := i - 1;
        END LOOP;
        dbms_output.put_line('Factorial is: ' || num);
    END IF;
END;
/

---2

SET SERVEROUTPUT ON;
SHOW SERVEROUTPUT; 

DECLARE
    numa INT;
    numb INT;
    numc INT;
BEGIN
    numa := :numa;
    numb := :numb;
    numc := :numc;

    IF (numa > numb AND numa > numc) THEN
        dbms_output.put_line(numa || ' is the greatest');
    ELSIF (numb > numa AND numb > numc) THEN
        dbms_output.put_line(numb || ' is the greatest');
    ELSE
        dbms_output.put_line(numc || ' is the greatest');
    END IF;
END;
/

--3

SET SERVEROUTPUT ON;
SHOW SERVEROUTPUT;

DECLARE
    numa        INT;
    numb        INT;
    operatorof  INT;
    sumof       INT;
    mul         INT;
    sub         INT;
    div         NUMBER;
BEGIN
    numa := :numa;
    numb := :numb;
    operatorof := :operatorof;

    sumof := numa + numb;
    sub   := numa - numb;
    mul   := numa * numb;

    IF numb != 0 THEN
        div := numa / numb;
    END IF;

    CASE operatorof
        WHEN 1 THEN
            dbms_output.put_line('Sum is ' || sumof);
        WHEN 2 THEN
            dbms_output.put_line('Difference is ' || sub);
        WHEN 3 THEN
            dbms_output.put_line('Product is ' || mul);
        WHEN 4 THEN
            dbms_output.put_line('Quotient is ' || div);
        ELSE
            dbms_output.put_line('Enter correct choice');
    END CASE;
END;
/

--4

SET SERVEROUTPUT ON;
SHOW SERVEROUTPUT;

DECLARE
    a   INT;
    b   INT;
    c   INT;
    num INT;
BEGIN
    a := 0;
    b := 1;
    c := 0;
    num := &num;  -- input from user

    num := num - 2;
    dbms_output.put_line('The Fibonacci series is:');
    dbms_output.put_line(a);
    dbms_output.put_line(b);

    WHILE (num > 0)
    LOOP
        c := a + b;
        a := b;
        b := c;
        dbms_output.put_line(c);
        num := num - 1;
    END LOOP;
END;
/

