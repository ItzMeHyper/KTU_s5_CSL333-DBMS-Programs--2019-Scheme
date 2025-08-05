-- 1
SELECT CEIL(8.29) AS Ceil_Value FROM DUAL;

-- 2
SELECT CEIL(-3.9) AS Ceil_Negative FROM DUAL;

-- 3
SELECT CEIL(17 / 3.0) AS Ceil_Division FROM DUAL;

-- 4
SELECT FLOOR(9.76) AS Floor_Value FROM DUAL;

-- 5
SELECT FLOOR(-5.3) AS Floor_Negative FROM DUAL;

-- 6
SELECT FLOOR(15 / 4.0) AS Floor_Division FROM DUAL;

-- 7
SELECT SQRT(625) AS Sqrt_Result FROM DUAL;

-- 8
SELECT SQRT(2) AS Sqrt_Result FROM DUAL;

-- 9
SELECT ABS(8.29) AS Abs_Positive FROM DUAL;

-- 10
SELECT ABS(-3.14) AS Abs_Negative FROM DUAL;

-- 11
SELECT ABS(-42) AS Abs_Column FROM DUAL;

-- 12
SELECT SYSDATE AS Current_Date FROM DUAL;

-- 13
SELECT TO_CHAR(SYSDATE, 'DD-MM-YYYY') AS "Date", TO_CHAR(SYSDATE, 'HH:MI:SS AM') AS "Time" FROM DUAL;

-- 14
SELECT SYSTIMESTAMP AS System_Timestamp FROM DUAL;

-- 15
SELECT LEAST('Hi', 'Hello', 'World') AS Least_String FROM DUAL;

-- 16
SELECT GREATEST('Hi', 'Hello', 'World') AS Greatest_String FROM DUAL;\

-- 17
SELECT LTRIM(' Trim me') AS No_Leading_Spaces FROM DUAL;

-- 18
SELECT RTRIM('I love India                ') AS No_Leading_Spaces FROM DUAL;

-- 19
SELECT RPAD('ItzMeHyper', 15, 'X') AS Padded_Name FROM DUAL;

-- 20
SELECT RPAD(123, 6, '0') AS Padded_Number FROM DUAL;

-- 21
SELECT REVERSE('uoyevol I') AS Reversed_String FROM DUAL;

-- 22
SELECT CASE WHEN 'racecar' = REVERSE('racecar') THEN 'Palindrome' ELSE 'Not Palindrome' END AS Palindrome_Result FROM DUAL;

-- 23
SELECT LENGTH('Oracle Database') AS String_Length FROM DUAL;

-- 24
SELECT CONCAT(CONCAT(CONCAT(CONCAT('Oracle ', 'SQL '), 'is '), 'powerful '), 'and flexible') AS Concatenated_Text FROM DUAL;

-- 25
SELECT CONCAT('ItzMe', 'Hyper') AS Concatenated_Name FROM DUAL;

-- 26
SELECT SUBSTR('India is my country', 7, 2) AS Substring FROM DUAL;

-- 27
SELECT SUBSTR('ItzMehyper', 4, 2) AS Middle_Chars FROM DUAL;

-- 28

SELECT SUBSTR('Substring', 1, 3) AS First_Three FROM DUAL;
