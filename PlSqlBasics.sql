DECLARE
ash_message varchar2(100) := 'Hello';
BEGIN
  dbms_output.put_line(ash_message);
END;
/

--Working with Strings
DECLARE
SUBTYPE firstName IS varchar2(20);
  SUBTYPE lastName IS varchar2(20);
  ashFirstName firstName;
  ashLastName lastName;
BEGIN
  ashFirstName:= 'Aashish Reddy';
  ashLastName:= 'Vundhyala';
  dbms_output.put_line(ashFirstName || ' ' || ashLastName);
END;
/

-- Working with integers and float
DECLARE
a integer := 20;
  b integer := 5;
  c integer := 3;
  result integer;
  resultFloat float;
BEGIN
  result := a/b;
  resultFloat := a/c;
  dbms_output.put_line(result);
  dbms_output.put_line(resultFloat);
END;
/

--Working with nested loops
DECLARE
   -- Global variables
globalNum1 number := 95;
   globalNum2 number := 85;
BEGIN
   dbms_output.put_line('Outer Variable num1: ' || globalNum1);
   dbms_output.put_line('Outer Variable num2: ' || globalNum2);
   DECLARE
      -- Local variables
innerNum1 number := 195;
      innerNum2 number := 185;
BEGIN
      dbms_output.put_line('Inner Variable num1: ' || innerNum1);
      dbms_output.put_line('Inner Variable num2: ' || innerNum2);
END;
END;
/

--Loops
--IF THEN ELSIF
DECLARE
age integer := 26;
BEGIN
  IF age >= 21 AND age < 25 THEN
    dbms_output.put_line('Above 21');
  ELSIF age >= 25 THEN
    dbms_output.put_line('Age above 25');
else
    dbms_output.put_line('Below 21');
END IF;
END;
/

--CASE
DECLARE
grade char(1) := 'A';
BEGIN
CASE
    WHEN grade = 'A' THEN
      DBMS_OUTPUT.PUT_LINE('Excellent');
WHEN grade = 'B' THEN
      DBMS_OUTPUT.PUT_LINE('Good');
WHEN grade = 'C' THEN
      DBMS_OUTPUT.PUT_LINE('Average');
ELSE
      DBMS_OUTPUT.PUT_LINE('Fail');
END CASE;
END;
/

-- FOR loop
--creating a varray
DECLARE
type friendsArray IS varray(5) OF varchar2(10);
  type ageArray IS varray(5) OF integer(2);
  friends friendsArray;
  ages ageArray;
  friendsSize integer;
BEGIN
  friends := friendsArray('Aashish', 'Abhishek', 'Shanthan', 'Chinnu', 'Bucks');
  ages := ageArray(26, 27, 28, 25, 27);
  friendsSize := friends.count;
for i IN 1 .. friendsSize loop
    DBMS_OUTPUT.PUT_LINE(friends(i) || ' ' || ages(i));
END loop;
END;
/

--Procedures
CREATE PROCEDURE Prod1
    IS
BEGIN
  DBMS_OUTPUT.PUT_LINE('Prod1 procedure created');
END;
/

BEGIN
  Prod1;
END;
/

--Write a procedure which takes in 2 integers and result the maximum of both.
CREATE PROCEDURE max(a IN integer, b IN integer, output OUT integer) IS
BEGIN
  IF a > b THEN
    DBMS_OUTPUT.PUT_LINE('Max of a and b is: ' || a);
ELSE
    DBMS_OUTPUT.PUT_LINE('Max of a and b is: ' || b);
END IF;
END;
/

DECLARE
a integer:= 15;
  b integer:= 5;
output integer;
BEGIN
max(a, b, output);
END;
/

-- create a function and return the maximum of 2 integers
DECLARE
a integer:= 40;
  b integer:= 60;
  c integer;
FUNCTION maxFunction(a integer, b integer)
RETURN integer
IS
  output integer;
BEGIN
  IF a > b THEN
    output:= a;
ELSE
    output:= b;
END IF;
  RETURN output;
END;
-- calling maxFunction
BEGIN
  c := maxFunction(a, b);
  DBMS_OUTPUT.PUT_LINE('Calling maxFunction: ' || c);
END;
/
  