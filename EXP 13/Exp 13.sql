SET SERVEROUTPUT ON;
SHOW SERVEROUTPUT;

--Factorial
DECLARE
  num INT;
  i INT;
BEGIN
  num := :num;
  i := num - 1;
  
  WHILE i > 0 LOOP
    num := num * i;
    i := i - 1;
  END LOOP;
  
  dbms_output.put_line('Factorial is ' || num);
END;
/
--Greatest Of Three Numbers
SET SERVEROUTPUT ON;
SHOW SERVEROUTPUT;

DECLARE
    numA INT;
    numB INT;
    numC INT;
BEGIN
    numA := :numA;
    numB := :numB;
    numC := :numC;

    IF (numA > numB AND numA > numC) THEN
        dbms_output.put_line(numA || ' is greatest');
    ELSIF (numB > numA AND numB > numC) THEN
        dbms_output.put_line(numB || ' is greatest');
    ELSE
        dbms_output.put_line(numC || ' is greatest');
    END IF;
END;
/
--Calculator
SET SERVEROUTPUT ON;
SHOW SERVEROUTPUT;

DECLARE
    numa INT;
    numb INT;
    operatorof INT;
    sumOf INT;
    mul INT;
    sub INT;
    div INT;
BEGIN
    numa := numa;
    numb := numb;
    sumOf := numa + numb;
    sub := numa - numb;
    mul := numa * numb;
    
    IF (numb != 0) THEN
        div := numa / numb;
    END IF;
    
    operatorof := operatorof;
    
    CASE operatorof
        WHEN 1 THEN 
            dbms_output.put_line('Sum is ' || sumOf);
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