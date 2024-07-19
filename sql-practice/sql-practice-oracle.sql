CREATE TABLE ancestors

ALTER TABLE ancestors
ADD (first_name);

<-- Select all the cars --!> 
SELECT title, director
FROM movies
WHERE title LIKE "Cars%";

Create table Numbers (
	id Number,
	value Number
);

Insert into Numbers (id, value) values (1, -56);
Insert into Numbers (id, value) values (2, 76);
Insert into Numbers (id, value) values (3, -84);
Insert into Numbers (id, value) values (4, 95);
Insert into Numbers (id, value) values (5, -47);

Select (value * (-1)) AS Opposite
from numbers;

/* CHALLENGE #2 - Return all the division ids where there is revenue in 2022.
*/

Create table Divisions (
	id number,
	Div_year DATE,
	revenue number
);

Insert into Divisions (id, div_year, revenue) values (1, sysdate, 100);
Insert into Divisions (id, div_year, revenue) values (2, '06-Apr-1830', 200);
Insert into Divisions (id, div_year, revenue) values (3, '12-Jun-1985', -20);
Insert into Divisions (id, div_year, revenue) values (4, '28-Jun-2022', 200);
Insert into Divisions (id, div_year, revenue) values (5, '07-Dec-2017', 100);
Insert into Divisions (id, div_year, revenue) values (6, '12-May-2022', -3);

/* Here's the select statement*/
Select Id 
from divisions
where div_year > '01-Jan-2022'
	and revenue > 0;

Select * from divisions
where div_year > '01-Jan-2022'
	and revenue > 0;
	
/* What did I learn from Challenge 2? 
	- the default date for the date type is 'DD-MON-YYYY'.
	- Newer dates are greater than older dates.
	- You can change the date format in your session with this command:
		SQL> Alter session set nls_Date_Format = 'YYYY';
*/

/* CHALLENGE 3 - Find the Century for the year
	this includes
		- Changing the date to 'yyyy'
		- Changing year to number using toNumber
		- dividing by 100 & adding 1
*/

Select to_number('1830') from dual;

select TO_CHAR(sysdate, 'RRRR') from dual;

select TO_NUMBER(div_year, 'YYYY') from divisions;

select (to_number(div_year))/100 + 1 as Century from divisions;


select SUBSTR(to_char(div_year), -4) as "4-digit Year" from divisions;

create table Ancestors (
	first_name varchar2(50),
	last_name varchar2(50),
	birth_date date
);

Insert into Ancestors (first_name, last_name, birth_date) values ('Albert', 'Bahr', '01-Jan-1915');
Insert into Ancestors (first_name, last_name, birth_date) values ('Henrietta', 'Cabot', '05-Jan-1950');

Select right(first_name, 3) from Ancestors;

/* Here's the Answer to Challenge 3, as long as the nls date format is changed in the session.
*/
select Substr(To_char(((to_number(div_year))/100 + 1)), 1, 2) as Century from divisions;

/* Challenge # 4 - Tell if a number is even or odd.
*/

Create table Evens_or_Odds (
	id number,
	Num_value Number
);

Insert into evens_or_odds (id, num_value) values (1, 4);
Insert into evens_or_odds (id, num_value) values (2, 11);
Insert into evens_or_odds (id, num_value) values (3, 57);
Insert into evens_or_odds (id, num_value) values (4, 24);
Insert into evens_or_odds (id, num_value) values (5, 47);

/* ANSWER to Challenge # 4! */
Select num_value,
CASE
	When (num_value / 2) like '%.%' then 'odd'
	else 'even'
	end
	from evens_or_odds;

/* 
I learned from Ch. 4 that using LIKE and % it is possilbe to find if a
string contains just one character. 
I tried to learn how to use the contains function, but the system told
me I needed to index the column. I indexed the column, and it still didn't 
work. So, I decided to use like instead, and it worked!
*/


/* Oracle SQL Multirow Insert
	Starts w/ insert all & each row must contain "into table_name" 
	and the values, and the rows don't end in a comma.
	Then you have to end it with select * from dual.
*/
Insert ALL
into Tests (Student_id, student_name, exam_1, exam_2) VALUES (4, 'Tedd Cruise', 29, 89)
into Tests (Student_id, student_name, exam_1, exam_2) VALUES (5, 'Bob Dill Pickle', 38, 78)
into Tests (Student_id, student_name, exam_1, exam_2) VALUES (6, 'Debora Hicks', 59, 77)
Select * from dual;

Create table ports
(port_id number,
port_name varchar2(20),
country varchar2(40),
capacity number,
constraint port_pk primary key (port_id));

create table ships
(ship_id number,
ship_name varchar2(20),
home_port_id number,
CONSTRAINT ships_ports_fk foreign key (home_port_id) References Ports (port_id));

create table work_schedule
(work_schedule_id Number,
start_date DATE,
end_date DATE);

CREATE TABLE cruises
(cruise_id NUMBER,
cruise_type_id NUMBER,
cruise_name varchar2(20),
captain_id NUMBER NOT NULL,
start_date date,
end_date date,
status varchar2(5) default 'DOCK',
constraint cruise_pk primary key (cruise_id));

CREATE TABLE Employees
(Employee_id varchar2(10),
Name varchar2(20),
Department varchar(10));

Number has parameters of precesion and scale
For example, if the column is declared as:
cruise_price NUMBER(7,2)

Then the precision will be 7 and the scale 2 (total # of digits to the right of the decimal point. 

Lets try an example

Insert into numbers (number_id, number_price)
VALUES
(1, 70.99);

Insert into numbers (number_id, number_price)
VALUES
(6, 25675.45);


SELECT promo_name, promo_begin_date
FROM promotions
WHERE promo_begin_date > ALL (
	SELECT MAX (promo_begin_date)
	FROM promotions)
	AND promo_category='INTERNET';
	
SELECT promo_name, promo_begin_date
FROM promotions
WHERE promo_begin_date > ALL (
	SELECT promo_begin_date	
	FROM promotions
	WHERE promo_category = 'INTERNET');
	
CREATE TABLE Promotions (
	Promo_id Number(6) PRIMARY Key,
	Promo_name varchar2(30) not null,
	promo_subcategory varchar2(30) not null,
	promo_subcategory_id number not null,
	promo_category varchar2(30) not null,
	promo_category_id number not null,
	promo_cost number(10,2) not null,
	promo_begin_date date not null,
	promo_end_date date not null
);
	
	
Insert into Promotions (
	Promo_id, promo_name, promo_subcategory, promo_subcategory_id, promo_category,
	promo_category_id, promo_cost, promo_begin_date, promo_end_date)
VALUES
	(1, 'TV Promotion', 'TV Sales', 1, 'Entertainment', 1, 20000, '28-Feb-23', '10-Apr-23'); 

Insert into Promotions (
	Promo_id, promo_name, promo_subcategory, promo_subcategory_id, promo_category,
	promo_category_id, promo_cost, promo_begin_date, promo_end_date)
VALUES
	(2, 'Camping Promotion', 'Campers', 2, 'Outdoors', 2, 5000, '8-Feb-23', '1-Apr-23');
	
	Insert into Promotions (
	Promo_id, promo_name, promo_subcategory, promo_subcategory_id, promo_category,
	promo_category_id, promo_cost, promo_begin_date, promo_end_date)
VALUES
	(3, 'Easter', 'Holidays', 3, 'Culture', 3, 40000, '15-Mar-23', '10-Apr-23');
	
	Insert into Promotions (
	Promo_id, promo_name, promo_subcategory, promo_subcategory_id, promo_category,
	promo_category_id, promo_cost, promo_begin_date, promo_end_date)
VALUES
	(4, 'Christmas', 'Holidays', 3, 'Culture', 3, 80000, '22-Nov-22', '28-Dec-22');
	
	Insert into Promotions (
	Promo_id, promo_name, promo_subcategory, promo_subcategory_id, promo_category,
	promo_category_id, promo_cost, promo_begin_date, promo_end_date)
VALUES
	(5, 'Amazon Books', 'Books', 4, 'INTERNET', 4, 15000, '7-Feb-23', '10-Apr-23');
	
Insert into Promotions (
	Promo_id, promo_name, promo_subcategory, promo_subcategory_id, promo_category,
	promo_category_id, promo_cost, promo_begin_date, promo_end_date)
VALUES
	(6, 'Tabernacle Choir', 'Music', 5, 'INTERNET', 4, 19000, '18-Oct-22', '1-Jan-23');
	
Insert into Promotions (
	Promo_id, promo_name, promo_subcategory, promo_subcategory_id, promo_category,
	promo_category_id, promo_cost, promo_begin_date, promo_end_date)
VALUES
	(7, 'Power Tools', 'Tools', 6, 'INTERNET', 4, 60000, '15-May-22', '10-Jul-22');
	

/*
	Here's an example of unconditional Multi-table insert using Oracle SQL
		(see pg 6 of notes and 13.1 in the sql-cert book)
	
*/

	INSERT ALL
		INTO Tools (product_name, product_price)
		VALUES (product_name, product_price)
		INTO Tools_2022 (product_name, product_price)
		VALUES (product_name, product_price)
		Select product_name, product_price
		from products
		where product_categoryID = 1;
		
/*
	In this example, all the tools in the products table that have
	a product_categoryID of 1 (tools) will be inserted into the 
	Tools table and the Tools_2022 table.


	Now let's work with conditional multi-table insert statements:
	
	What if we had an INVOICES and INVOICES_ARCHIVED tables, and we needed to integrate
	data from another company, from their WO_INV table into our tables?
	
	Here's the requirements. We need to create an INSERT statement that will:
		- Pull data from teh WO_INV TABLE
		- INsert WO_InV's invoice info from within the past year into our INVOICES TABLE
		- Insert WO_INV's invoice info that is more than a year old into our INVOICES_ARCHIVED table.

	First, we'll show the original create statements for the tables so that we know their columns.
	Then, we'll write a multi-table insert to do what we asked.
*/

CREATE TABLE Invoices(
	Invoice_ID		Number,
	Invoice_date	date,
	account_number	varchar2(80),
	Terms_of_discount 	varchar2(20),
	Vendor_Id		Number,
	Total_price		Number(8,2),
	Shipping_date	date
);
	
CREATE TABLE Invoices_Archived (
	Invoice_ID		Number,
	Invoice_date	date,
	account_number	varchar2(80),
	Terms_of_discount 	varchar2(20),
	Vendor_Id		Number,
	Total_price		Number(8,2),
	Shipping_date	date
);
	
CREATE TABLE WO_INV(
	Inv_no		Number(11),
	Date_entered date,
	Date_shipped date,
	cust_acct	varchar2(30)
);
	
INSERT FIRST
	WHEN (Date_shipped < (ADD_MONTHS(SYSDATE, -12)))
	Then 
		INTO Invoices_Archived (Invoice_ID, Invoice_date, shipping_date, account_number)
		VALUES (Inv_no, date_entered, date_shipped, cust_acct)
	ELSE
		INTO Invoices (Invoice_ID, Invoice_date, shipping_date, account_number)
		VALUES (Inv_no, date_entered, date_shipped, cust_acct)
	SELECT Inv_no, date_entered, date_shipped, cust_acct
	FROM Wo_INV;

/*	We include the FIRST keyword because we only want one statement to execute per 
	row of the new info. 
	
	Some Notes About MySQL
	
	- By the way, MySQL doesn't have a multi-table insert. You have to do it through
	stored procedures. 
	- MySQL 5.7 also doesn't have intersect, but you can simulate it using 
	the IN clause or EXISTS.
	- Also, MySQL eliminates the word 'table' in the update statement.
	- To concatenate in MySQL, you have to use concat() instead of ||
*/
	
	
CREATE TABLE Birthdays (
	Name varchar2(50),
	Birth_date date);
	
Insert into Birthdays (name, birth_date)
Values ('Joe ButtonMaker', '10-Apr-59');

/* Problem 3, 2nd Review Test (60 minute)*/

Create table Employees (
	employee_id Number(4) Primary Key,
	first_name VARCHAR2(20),
	last_name VARCHAR2(25) not null,
	email varchar2(25),
	hire_date date not null
);

Insert into Employees (employee_id, first_name, last_name, email, hire_date)
VALUES
(1, 'Mark', 'Champion', 'mc@gmail.com', '12-Apr-22');

Insert into Employees (employee_id, first_name, last_name, email, hire_date)
VALUES
(2, 'Sarah', 'Camper', 'sc@gmail.com', '10-Aug-21');

SELECT first_name, employee_id, ADD_MONTHS(hire_date, 3) "Review"
From employees;

SELECT first_name, employee_id, NEXT_DAY(ADD_MONTHS(hire_date, 3), 1) "Review"
From employees;

SELECT first_name, employee_id, NEXT_DAY(hire_date, 7) "Review"
From employees;

CREATE TABLE ord_details (
	ord_no Number(2),
	item_no Number(3),
	ord_date DATE DEFAULT '29-Apr-22' NOT NULL,
	CONSTRAINT ord_pk PRIMARY KEY (ord_no));
	
Insert into ord_details (ord_no, ord_date)
VALUES
(4, '10-Aug-21');
	
SQL> select to_char(order_date,'rr'), Sum(order_total)
  2  from orders
  3  group by to_char(order_date, 'rr')
  4  order by 1;
  
Select order_id
from orders
where cust_id IN (3, 4);
 
 CREATE TABLE employees (
	employee_id number primary key,
	first_name varchar2(20) not null,
	last_name varchar2(20) not null,
	email varchar2(20),
	hire_date Date 
 );
  
Insert into employees (employee_id, first_name, last_name, email, hire_date)
	VALUES (1, 'Lydia', 'BlueLasTic', 'blt@gmail.com', '12-Jun-23');
	
Insert into employees (employee_id, first_name, last_name, email, hire_date)
	VALUES (2, 'John', 'calvin', 'jc@gmail.com', '11-Jan-22');
	
Insert into employees (employee_id, first_name, last_name, email, hire_date)
	VALUES (3, 'Jefferson', 'Davis', 'jd@gmail.com', '12-Jun-23');
	
Insert into employees (employee_id, first_name, last_name, email, hire_date)
	VALUES (4, 'Jefferson', 'Hampton', 'jh@gmail.com', '23-Jan-20');
	
Insert into employees (employee_id, first_name, last_name, email, hire_date)
	VALUES (5, 'Thomas', 'Charleston', 'tc@gmail.com', '04-Mar-21');
	
Insert into employees (employee_id, first_name, last_name, email, hire_date)
	VALUES (6, 'Jacob', 'Worthington', 'jw@gmail.com', '28-Jun-19');
	
select upper(last_name) from employees;

select first_name || ' ' || Last_name || ' was hired on ' || hire_date || '.'
from employees
where hire_date = (select hire_date from employees where first_name = 'Lydia');

Select CONCAT('Hi ,',  ' my name is Derrell') from dual;

create table Book_Contents (
	chapter_title varchar2(40),
	page_number number
);

Insert into book_contents (chapter_title, page_number)
	VALUES ('Introduction', 1);
	
Insert into book_contents (chapter_title, page_number)
	VALUES ('Chapter 1', 5);
	
Insert into book_contents (chapter_title, page_number)
	VALUES ('Chapter 2', 23);
	
Insert into book_contents (chapter_title, page_number)
	VALUES ('Chapter 3', 57);
	
Insert into book_contents (chapter_title, page_number)
	VALUES ('Index', 79);
	
Select RPAD(chapter_title || ' ', 30, '.') 
	||
	LPAD(' ' || Page_number, 30, '.') "Table of Contents"
	From book_contents
	order by page_number;

select LPad (' ' || Page_number, 30, '.') "Page Number"
	from book_contents
	order by page_number;
	
Update Book_Contents
SET chapter_title = 'Chapter 1: The Evil man'
Where page_number = 5;

Update Book_Contents
SET chapter_title = 'Chapter 2: Rubber Bands'
Where page_number = 23;

Update Book_Contents
SET chapter_title = 'Chapter 3: Gluconate Kid'
Where page_number = 57;

Update Book_Contents
SET chapter_title = 'Chapter 4: The Bank Robbery'
Where page_number = 79;

select RPAD(Chapter_title || ' ' , 30, '.')
from book_contents
order by page_number;

SELECT RTRIM('Chapter 1............', '.') Chapters
FROM dual;

select INSTR(chapter_title, ':', 1, 1)
from book_contents;

select Substr(chapter_title, 
	(select INSTR(chapter_title, ':', 1, 1) 
	from book_contents
	where chapter_title like 'Chapter 1%') + 2,
	40) as "Chapter Title"
from book_contents;

select first_name, last_name, email
from employees
where soundex(last_name) = soundex('Worthen');

insert into numbers (id, value)
	VALUES
	(6, 28.987);
	
insert into numbers (id, value)
	VALUES
	(7, 55.123);
	
insert into numbers (id, value)
	VALUES
	(8, 20.465);
	
SELECT TO_CHAR(TO_DATE('01-AUG-16 12:00:00', 'DD-MON-YY HH24:MI:SS'), 'DD-MON-YY HH:MI:SS') AS DAY_AT_NOON,
	TO_CHAR(ROUND(TO_DATE('01-AUG-16 12:00:00', 'DD-MON-YY HH24:MI:SS')), 'DD-MON-YY HH:MI:SS') AS ROUNDED_TO_NEXT_DAY
FROM DUAL;
	
Select round(to_date('01-Jul-23', 'DD-MON-YY'), 'RR') julRoundYr
from dual;

Select 	to_char(sysdate, 'DD-MON-YY HH:MI:SS') AS RAW_DATE,
		TO_CHAR(ROUND(Sysdate), 'DD-MON-YY HH:MI:SS') AS ROUNDED_DATE
from DUAL;
	
SELECT 	SYSDATE TODAY, 
		Trunc(Sysdate, 'MM') Mo_Truncate,
		Trunc(sysdate, 'RR') Yr_Truncate,
		TRUNC(to_date('03-Dec-23', 'DD-MON-YY'), 'RR') D_Trun
from dual;

Select last_day('14-Feb-20') LEAP_2020, Last_day('20-Feb-21') Norm_2021
from dual;

SELECT 	Add_months('31-Jan-17', 1) As "Jan to Feb",
		Add_months('01-Nov-17', 4) as "Nov to Mar"
from DUAL;

SELECT MONTHS_BETWEEN('06-Jun-14', '03-Oct-13') Mos
from dual;

SELECT NUMTOYMINTERVAL(939, 'MONTH')
from dual;

Select Length(‘We run wearing our armor in the strength of the Lord’)
From dual;

SELECT NUMTODSINTERVAL(92, 'HOUR')
FROM DUAL;

SELECT TO_CHAR(SYSDATE,'DD-MON-YY HH:MI:SS') AS TODAY,
	TO_CHAR(SYSDATE+1,'DD-MON-YY HH:MI:SS') AS TOMORROW,
	TO_CHAR(SYSDATE+1/24,'DD-MON-YY HH:MI:SS') AS ONE_HOUR_FROM_NOW,
	TO_CHAR(SYSDATE+1/1440,'DD-MON-YY HH:MI:SS') AS ONE_MIN_FROM_NOW
FROM DUAL;

CREATE TABLE Ship_Cabins (
	Ship_Cabin_id number Primary Key,
	room number,
	window varchar(15),
	sq_ft number
);

INSERT INTO ship_cabins (ship_cabin_id, room, window, sq_ft)
	VALUES
	(1, 102, 'Ocean', 533);
	
INSERT INTO ship_cabins (ship_cabin_id, room, window, sq_ft)
	VALUES
	(2, 103, 'Ocean', 160);

INSERT INTO ship_cabins (ship_cabin_id, room, window, sq_ft)
	VALUES
	(3, 104, 'None', 533);
	
INSERT INTO ship_cabins (ship_cabin_id, room, window, sq_ft)
	VALUES
	(4, 105, 'Ocean', 205);
	
INSERT INTO ship_cabins (ship_cabin_id, room, window, sq_ft)
	VALUES
	(5, 106, 'None', 586);

INSERT INTO ship_cabins (ship_cabin_id, room, window, sq_ft)
	VALUES
	(6, 107, 'Ocean', 1524);
	
SELECT 	WINDOW, ROOM, SQ_FT, 
		SUM(SQ_FT) OVER (PARTITION By window ORDER BY SQ_FT) "Running Total",
		SUM(SQ_FT) OVER (Partition by window ORDER BY SQ_FT ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) "Subset"
FROM SHIP_CABINS
ORDER BY SQ_FT;

Select 	window, room, sq_ft 
		, LAG(sq_ft) over (order by window, sq_ft) "Lag"
		, LEAD(sq_ft) over (order by window, sq_ft) "Lead"
from ship_cabins
Order by window, sq_ft;

SELECT avg(sq_ft), median(sq_ft), stddev(sq_ft), variance(sq_ft)
from ship_cabins;

Select Max(ord_date)
	From ord_details;

Select Ord_no, Max(ord_date) over (order by ord_no) “Running Max”
	From ord_details;

Select order_id, order_date, order_total, Max(order_total) over (order by order_date) "Running Max"
from orders;

Select order_id, Max(order_total)
	From 	orders;

SELECT 	window, room, sq_ft
		, variance(sq_ft) over (order by sq_ft) "Variance"
		, STDDEV(sq_ft) over (order by sq_ft) "Std Dev"
from ship_cabins
order by sq_ft;

select window, room, sq_ft, 
	percentile_cont(.6) within group (order by sq_ft) over (partition by window) "PCT"
from ship_cabins
order by sq_ft;

create table calls(
	call_id number primary key,
	call_date_TZ TIMESTAMP WITH TIME ZONE
);

INSERT INTO CALLS (call_id, call_date_TZ)
values
(1, TO_TIMESTAMP_TZ('24-May-12 10:15:30', 'DD-MON-RR HH24:MI:SS'));

SELECT TO_NUMBER('$17,000.23', '$999,999.99')
from dual;

SELECT TO_CHAr('Hi, how are you?') from dual;

SELECT TO_CHAR(198, '$999.99') from dual;

Select to_char(SYSDATE, 'HH24:MI:SS AM') from dual;

Select 
To_char(to_date('01-JAN-49', 'DD-MON_YY'), 'YYYY') "A",
To_char(to_date('01-JAN-50', 'DD-MON_YY'), 'YYYY') "B",
To_char(to_date('01-JAN-51', 'DD-MON_YY'), 'YYYY') "C",
To_char(to_date('01-JAN-49', 'DD-MON_RR'), 'RRRR') "D",
To_char(to_date('01-JAN-50', 'DD-MON_RR'), 'RRRR') "E",
To_char(to_date('01-JAN-51', 'DD-MON_RR'), 'RRRR') "F"
from dual;

Select 
To_char(to_date('07-JUL-16 00:00:00', 'DD-MON-YY HH24:MI:SS'), 'DD-MON-YY HH24:MI:SS PM') AS MIDNIGHT_HR24,
To_char(to_date('07-JUL-16 00:00:00', 'DD-MON-YY HH24:MI:SS'), 'DD-MON-YY HH12:MI:SS PM') AS MIDNIGHT_HR12
from dual;

SELECT TO_DATE('2016-01-31', 'RRRR-MM-DD') from dual;

select trim(to_yminterval('04-06'), '+') Event_time from dual;

select ltrim(ltrim(to_char(to_dsinterval('40 08:30:00.03225')), '+'), '0') Event_time from dual;

Select to_dsinterval('40 08:30:00.03225') Event_time from dual;

Select numtoyminterval(39, 'MONTH') FROM DUAL;

SELECT NUMTODSINTERVAL(36, 'HOUR') FROM DUAL;

SELECT CAST('19-JAN-16 11:35:30' AS TIMESTAMP WITH LOCAL TIME ZONE) "Converted LTZ"
From Dual;

Select order_id, cust_id, Order_total,
	Case 
		when order_total > 500 then 'Expensive'
		when order_total < 100 then 'Cheap'
		else 'Decent Price'
		End as Price_Eval
From orders;	

CREATE TABLE Births (
	birth_id Number,
	Fname VARCHAR2(20),
	Lname VARCHAR2(20),
	Birth_date DATE,
	Birth_place varchar(50),
	Father_Id NUMBER,
	Mother_Id Number,
	PRIMARY KEY (birth_id)
);

INSERT INTO Births (birth_id, Fname, Lname, Birth_date, Birth_place, Father_Id, Mother_Id)
	VALUES
	(1, 'Carl', 'Bahr', '04-Oct-1798', 'Daenischenhagen, Germany', null, null);

INSERT INTO Births (birth_id, Fname, Lname, Birth_date, Birth_place, Father_Id, Mother_Id)
	VALUES	
	(2, 'Anna', 'Schultz', '16-Jul-1813', 'Svendborg, Fyn, Denmark', null, null);
	
INSERT INTO Births (birth_id, Fname, Lname, Birth_date, Birth_place, Father_Id, Mother_Id)
	VALUES
	(3, 'John', 'Jackson', '04-Apr-1819', 'Tarvin, Cheshire, England', null, null);
	
INSERT INTO Births (birth_id, Fname, Lname, Birth_date, Birth_place, Father_Id, Mother_Id)
	VALUES
	(4, 'Mary', 'Joinson', '30-Aug-1819', 'Barra, Cheshire, England', null, null);
	
INSERT INTO Births (birth_id, Fname, Lname, Birth_date, Birth_place, Father_Id, Mother_Id)
	VALUES
	(5, 'William', 'Bahr', '02-May-1850', 'Eckernfoerde, Germany', 1, 2);
	
INSERT INTO Births (birth_id, Fname, Lname, Birth_date, Birth_place, Father_Id, Mother_Id)
	VALUES
	(6, 'Harriet', 'Jackson', '06-Feb-1856', 'Birkenhead, Cheshire, England', 3, 4);
	
INSERT INTO Births (birth_id, Fname, Lname, Birth_date, Birth_place, Father_Id, Mother_Id)
	VALUES
	(7, 'William', 'Butt', '30-Nov-1857', 'Malvern, Carroll, Ohio', null, null);
	
INSERT INTO Births (birth_id, Fname, Lname, Birth_date, Birth_place, Father_Id, Mother_Id)
	VALUES
	(8, 'Laura', 'Bushman', '9-Oct-1865', 'Lehi, Utah, Utah', null, null);
	
INSERT INTO Births (birth_id, Fname, Lname, Birth_date, Birth_place, Father_Id, Mother_Id)
	VALUES
	(9, 'Albert', 'Bahr', '24-May-1884', 'Lehi, Utah, Utah', 5, 6);
	
INSERT INTO Births (birth_id, Fname, Lname, Birth_date, Birth_place, Father_Id, Mother_Id)
	VALUES
	(10, 'Jessie', 'Butt', '01-Feb-1887', 'Lehi, Utah, Utah', 7, 8);
	
INSERT INTO Births (birth_id, Fname, Lname, Birth_date, Birth_place, Father_Id, Mother_Id)
	VALUES
	(11, 'Mormon', 'Miner', '26-Sep-1837', 'Kirtland, Geauga, Ohio', null, null);
	
INSERT INTO Births (birth_id, Fname, Lname, Birth_date, Birth_place, Father_Id, Mother_Id)
	VALUES
	(12, 'Phoebe', 'Curtis', '06-Dec-1844', 'Goldens, Point, Hancock, Illinois', null, null);
	
INSERT INTO Births (birth_id, Fname, Lname, Birth_date, Birth_place, Father_Id, Mother_Id)
	VALUES
	(13, 'Eli', 'Day', '23-Sep-1856', 'Springville, Utah, Utah', null, null);
	
INSERT INTO Births (birth_id, Fname, Lname, Birth_date, Birth_place, Father_Id, Mother_Id)
	VALUES
	(14, 'Eliza', 'Staker', '17-Nov-1860', 'Mount Pleasant, Sanpete, Utah', null, null);
	
INSERT INTO Births (birth_id, Fname, Lname, Birth_date, Birth_place, Father_Id, Mother_Id)
	VALUES
	(15, 'Albert', 'Miner', '10-Aug-1865', 'Fairview, Sanpete, Utah', 11, 12);
	
INSERT INTO Births (birth_id, Fname, Lname, Birth_date, Birth_place, Father_Id, Mother_Id)
	VALUES
	(16, 'Eliza', 'Day', '29-Apr-1879', 'Mount Pleasant, Sanpete, Utah', 13, 14);
	
/* Find Ancestors Born in Utah */

Select Fname, Lname, Decode(birth_place, 'Lehi, Utah, Utah', 'Utah',
										'Barra, Cheshire, England', 'England',
										'Other') AS "Birth Place"
FROM BIRTHS
Order by "Birth Place" Desc;

SELECT 	NVL(NULL, 0) FIRST_ANSWER,
		14+NULL-4 SECOND_ANSWER,
		14+NVL(NULL, 0)-4 THIRD_ANSWER
FROM DUAL;

ALTER TABLE ship_cabins
	ADD balcony_sq_ft number;

Update ship_cabins
SET balcony_sq_ft = 80
where room in (102, 103);

select sq_ft + NVL(balcony_sq_ft, 0) as "Total Square Feet"
from ship_cabins;

/* How to find the How to find all the tables the current user created:
	
*/
Select table_name
From user_tables;

ALTER TABLE Tests
	ADD test_score number;

ALTER TABLE Tests
	ADD updated_test_score number;

INSERT INTO Tests (id, test_name, test_score, updated_test_score)
VALUES
(1, 'US History', 95, 95);

INSERT INTO Tests (id, test_name, test_score, updated_test_score)
VALUES
(2, 'US History', 58, 85);

INSERT INTO Tests (id, test_name, test_score, updated_test_score)
VALUES
(3, 'Algebra I', 75, 75);

INSERT INTO Tests (id, test_name, test_score, updated_test_score)
VALUES
(4, 'Astronomy', 55, 90);

INSERT INTO Tests (id, test_name, test_score, updated_test_score)
VALUES
(5, 'US History', 98, 98);

SELECT 	test_score, updated_test_score, 
		NULLIF(updated_test_score, test_score) Revision_only
From tests;

create table ship_shop (
	id number primary key,
	item varchar2(30),
	price number(5,2)
);

INSERT INTO ship_shop(id, item, price)
VALUES
(1, 'Towel', 21.99);

INSERT INTO ship_shop(id, item, price)
VALUES
(2, 'Postcard', 2.49);

INSERT INTO ship_shop(id, item, price)
VALUES
(3, 'Mug', 7.19);

SELECT COUNT(Vendor_name) "Cnt Vendors", COUNT(status) "Cnt Status", COUNT(category) "Cnt Category"
FROM VENDORS;

select count(*) from vendors;

select last_name from employees;

select count(all last_name), count(distinct last_name)
from employees;

select min(last_name), max(last_name) from employees;

ALTER TABLE orders 
	MODIFY order_total number(8,2);

select to_char(round(avg(order_total), 2), '$999,999.99') AS "AVG Order Total" from orders;

select * from ship_cabins;

ALTER TABLE SHIP_CABINS
	add ROOM_STYLE VARCHAR2(10);

INSERT into ship_cabins (SHIP_CAbin_id, room, room_style, sq_ft)
values
(7, 108, 'Stateroom', 211);

Update ship_cabins
SET balcony_sq_ft = 80
where room in (102, 103);

UPDATE SHIP_CABINS
SET guest_id = 3
where ship_cabin_id in (2,5);

select ship_cabin_id, room_style, sq_ft
	, RANK() OVER (PARTITION BY ROOM_STYLE ORDER BY SQ_FT) SQ_FT_RK
FROM 	SHIP_CABINS
ORDER BY SQ_FT;

select rank(160) within group(order by sq_ft)
from ship_cabins
order by sq_ft;

select ship_cabin_id, room_style, sq_ft,
dense_rank() over (partition by room_style order by sq_Ft) sq_ft_drk
from ship_cabins
order by sq_ft;

select max(sq_ft) from ship_cabins;

select max(sq_ft) keep (dense_rank first order by guest_id)
	"Largest"
from ship_cabins;

alter table ship_cabins
add guest_id number;

select sysdate from dual;

create view 

select max()

select max(((sysdate - birth_date)/365.25)) keep (dense_rank last order by Lname) 
	"Largest"
from births;

alter table ship_cabins
add room_type varchar2(20);

alter table ship_cabins
add ship_id number(7);

ALTER TABLE ship_cabins
	drop column guest_id;

Alter table ship_cabins
add guests number;

insert into ship_cabins (ship_cabin_id, room, room_style, room_type, window, guests, sq_ft)
values
(8, 109, 'Stateroom', 'Large', 'None', 2, 180);

UPDATE SHIP_CABINS
SET room_type = 'Standard'
where ship_cabin_id = 8;

insert into ship_cabins (ship_cabin_id, room, room_style, room_type, window, guests, sq_ft)
values
(9, 110, 'Stateroom', 'Large', 'None', 2, 225);

insert into ship_cabins (ship_cabin_id, room, room_style, room_type, window, guests, sq_ft)
values
(10, 702, 'Suite', 'Presidential', 'None', 5, 1142);

insert into ship_cabins (ship_cabin_id, room, room_style, room_type, window, guests, sq_ft)
values
(11, 703, 'Suite', 'Royal', 'Ocean', 5, 1745);

insert into ship_cabins (ship_cabin_id, room, room_style, room_type, window, guests, sq_ft)
values
(12, 704, 'Suite', 'Skyloft', 'Ocean', 8, 722);

update ship_cabins
set ship_id = 1;

select ship_cabin_id, room, room_style, room_type, window, guests, sq_ft
from Ship_Cabins
where ship_id = 1;

select round(avg(sq_ft), 2)
from ship_cabins
where ship_id = 1;

Select room_style, round(avg(sq_Ft), 2)
from ship_cabins
group by room_style;

select 	room_style, room_number,
		round(avg(sq_ft), 2) "AVG SQ FT",
		min(guests) "Min # of Guests",
		count(ship_cabin_id) "Total # Cabins"
from 	ship_cabins
where 	ship_id = 1
group by room_style;

select room_style, avg(max(sq_ft))
from ship_cabins
group by room_style, room_type;

select 	round(avg(max(sq_ft)))
from ship_cabins
group by room_style, room_type;

SELECT 	ROOM_STYLE,
		ROOM_TYPE,
		TO_CHAR(MIN(SQ_FT), '9,999') "Min"
FROM 	SHIP_CABINS
GROUP BY ROOM_STYLE, ROOM_TYPE
HAVING 	ROOM_TYPE IN ('Standard', 'Large') OR MIN(SQ_FT) > 1200
ORDER BY 3;

select max(order_total) keep (dense_rank first order by cust_id) "Spent Most"
from orders;

select cust_id, sum(order_total) "All Orders", count(order_total) "Orders Made"
from orders
group by cust_id
having sum(order_total) > 1000
order by 2 desc;

Create table ports
(port_id number,
port_name varchar2(20),
country varchar2(40),
capacity number,
constraint port_pk primary key (port_id));

create table ships
(ship_id number,
ship_name varchar2(20),
home_port_id number,
CONSTRAINT ships_ports_fk foreign key (home_port_id) References Ports (port_id));

create table ships (
	ship_id number,
	ship_name varchar2(20),
	home_port_id number,
	constraint ships_pk primary key (ship_id),
	constraint ships_ports_fk foreign key (home_port_id)
		References ports (port_id)
		on delete set null);

create table vendors (
	VENDOR_ID NUMBER CONSTRAINT VENDOR_ID_PK PRIMARY KEY,
	VENDOR_NAME VARCHAR2(20) NOT NULL,
	STATUS NUMBER(1) CONSTRAINT STATUS_NN NOT NULL,
	CATEGORY VARCHAR2(20),
	CONSTRAINT STATUS_CK CHECK (STATUS IN (4, 5)),
	CONSTRAINT CATEGORY_CK CHECK (CATEGORY IN ('Active', 'Suspended', 'Inactive'))	
);

create table cruise_orders (
	cruise_order_id number,
	order_date date,
	constraint pk_co primary key (cruise_order_id)
);

create table order_returns(
	order_return_id number,
	cruise_order_id number,
	cruise_order_date date,
	constraint pk_or primary key (order_return_id),
	constraint fc_or_co foreign key (cruise_order_id) 
	references cruise_orders (cruise_order_id)
);

alter table cruise_orders drop column cruise_order_id cascade constraints;

create table emp_contacts (
	email varchar2(20),
	phone number(10) Primary Key,
	employee_id number(2),
	constraint fk_emp foreign key (employee_id)
	references employees (employee_id)
);

insert into emp_contacts (phone, email, employee_id)
values
(1234567890, 'jBastian@gmail.com', 1);

insert into emp_contacts (phone, email, employee_id)
values
(1234446578, 'sPalin@aol.com', 4);

insert into emp_contacts (phone, email)
values
(1112223333, 'lIngals@prarie.usa');

insert into emp_contacts (phone, email)
values
(7894657788, 'aWilder@farmers.usa');

insert into emp_contacts (phone, emp_email, employee_id)
values
(8014654945, 'glugkid@gmail.com', 5);

/* enter 4 employee contacts, and 4 birthdays, but only 2 foreigh keys */

Alter table birthdays
modify name varchar(25);

insert into birthdays (id, name, birth_date)
values
(1, 'Johann Sebastian Bach', '12-Aug-1658');

insert into birthdays (id, name, birth_date)
values
(2, 'Farmer Boy', '12-May-1858');

insert into birthdays (id, name, birth_date)
values
(3, 'Laura Ingalls', '1-Oct-1862');

insert into birthdays (id, name, birth_date)
values
(4, 'Sarah Plain', '27-Jan-1968');

insert into birthdays (id, name, birth_date)
values
(5, 'Thomas Charleston', '28-Jan-1968');

select employee_id, name, email
from emp_contacts E inner join birthdays B
on E.employee_id = B.id
order by birth_date;

select employee_id, name, email
from emp_contacts E Full join birthdays B
on E.employee_id = B.id
order by birth_date;

create table addresses (
	employee_id number,
	street_address varchar2(20),
	city varchar2(15),
	state varchar2(2),
	zip_code number(5),
	constraint fk_emp_ad foreign key (employee_id)
	references Employees (employee_id)
);

alter table addresses
modify state not null;

INSERT INTO addresses (employee_id, street_address, city, state, zip_code)
values
(1, '2543 Pleasant Ave', 'Haughton', 'LA', 71037);

INSERT INTO addresses (employee_id, street_address, city, state, zip_code)
values
(4, '256 S 700 W', 'Payson', 'UT', 84651);

INSERT INTO addresses (employee_id, street_address, city, state, zip_code)
values
(5, '204 Glendale Ave', 'Henderson', 'TX', 48051);

create table positions (
	position_id number(4),
	position varchar2(20),
	reports_to number(4),
	exempt char(1),
	min_salary number(10,2),
	max_salary number(10,2),
	constraint pk_positions primary key (position_id),
	constraint fk_po_po foreign key (reports_to)
	references positions (position_id)
);

INSERT INTO Positions (position_id, position, reports_to, min_salary)
values
(1, 'Business Owner', NULL, '200000');

INSERT INTO Positions (position_id, position, reports_to, min_salary)
values
(2, 'Executive Manager', 1, '100000');

INSERT INTO Positions (position_id, position, reports_to, min_salary)
values
(3, 'Senior Data Analyst', 2, '80000');

INSERT INTO Positions (position_id, position, reports_to, min_salary)
values
(4, 'Junior Analyst', 3, '60000');

INSERT INTO Positions (position_id, position, reports_to, min_salary)
values
(5, 'Head Janitor', 2, '40000');

select employee_id, last_name, phone
from employees inner join emp_contacts
using (employee_id);

select employee_id, last_name, phone
from employees left join emp_contacts
using (employee_id);

INSERT INTO Ports (port_id, port_name, country, capacity)
	VALUES
	(1, 'Baltimore', 'United States', 25);

INSERT INTO Ports (port_id, port_name, country, capacity)
	VALUES
	(2, 'Charleston', 'United States', 50);

INSERT INTO Ports (port_id, port_name, country, capacity)
	VALUES
	(3, 'Tampa', 'United States', 10);

INSERT INTO Ports (port_id, port_name, country, capacity)
	VALUES
	(4, 'Miami', 'United States', 15);

INSERT INTO Ports (port_id, port_name, country, capacity)
	VALUES
	(5, 'Fishboy', 'Coldwater', 45);
	
INSERT INTO Ships (ship_id, ship_name, home_port_id) 
	VALUES
	(1, 'Codd Crystal', 1);

INSERT INTO Ships (ship_id, ship_name, home_port_id) 
	VALUES	
	(2, 'Codd Elegance', 3);

INSERT INTO Ships (ship_id, ship_name, home_port_id) 
	VALUES
	(3, 'Codd Champion', 4);

INSERT INTO Ships (ship_id, ship_name, home_port_id) 
	VALUES
	(4, 'Codd Victorious', 3);

INSERT INTO Ships (ship_id, ship_name, home_port_id) 
	VALUES
	(5, 'Codd Grandeur', 2);

INSERT INTO Ships (ship_id, ship_name, home_port_id) 
	VALUES
	(6, 'Codd Prince', 2);

INSERT INTO Ship_cabins (ship_cabin_id, room, window, sq_ft, ship_id) 
	VALUES
(13, 101, 'Ocean', 500, 2);

INSERT INTO Ship_cabins (ship_cabin_id, room, window, sq_ft, ship_id) 
	VALUES
(14, 102, 'Ocean', 400, 2);

INSERT INTO Ship_cabins (ship_cabin_id, room, window, sq_ft, ship_id) 
	VALUES
(15, 101, 'Ocean', 600, 3);

SELECT 	P.PORT_NAME, S.SHIP_NAME, SC.ROOM
FROM 	PORTS P JOIN SHIPS S ON P.PORT_ID = S.HOME_PORT_ID
				JOIN SHIP_CABINS SC ON S.SHIP_ID = SC.SHIP_ID
where room > 110
order by ship_name;

Select E.last_name, A.city, A.state, EC.emp_email
from employees E join addresses A on E.employee_id = A.employee_id
				join emp_contacts EC on A.Employee_id = EC.Employee_id
Order By last_name;

create table grading (
	grading_id number(1),
	Grade char(1) primary key,
	score_min number(3),
	score_max number (3)
);

insert into grading (grading_id, grade, score_min, score_max)
values
(1, 'A', 90, 100);

insert into grading (grading_id, grade, score_min, score_max)
values
(2, 'B', 80, 89);

insert into grading (grading_id, grade, score_min, score_max)
values
(3, 'C', 70, 79);

insert into grading (grading_id, grade, score_min, score_max)
values
(4, 'D', 60, 69);

insert into grading (grading_id, grade, score_min, score_max)
values
(5, 'F', 0, 59);

select test_name, test_score, grade
from tests T inner join Grading G 
ON T.test_score between G.score_min and G.score_max;


select s.score_id

Create table invoices (
	invoice_id number(3),
	invoice_date date,
	account_number varchar2(10),
	terms_of_discount varchar2(10),
	vendor_id number(3),
	total_price number(8,2),
	constraint pk_inv primary key (invoice_id)
);

insert into invoices (invoice_id, invoice_date, account_number, vendor_id, total_price)
VALUES
(1, '03-Jan-2000', 'ACC123', 12, 7500.05);

insert into invoices (invoice_id, invoice_date, account_number, vendor_id, total_price)
VALUES
(2, '12-Feb-2005', 'ACC101', 10, 6540.99);

insert into invoices (invoice_id, invoice_date, account_number, vendor_id, total_price)
VALUES
(3, '21-May-2015', 'ACC102', 9, 5400.04);

insert into invoices (invoice_id, invoice_date, account_number, vendor_id, total_price)
VALUES
(4, '04-Jan-2020', 'ACC103', 8, 8500.99);

Update invoices inv 
	set terms_of_discount = '10 PCT'
where total_price = (select max(total_price)
					from invoices);

select max(total_price)
from invoices;

Update ports p
set capacity = (select count(*)
				from ships
				where home_port_id = P.port_id)
where exists (select * from ships
				where home_port_id = p.port_id);

Select count(*), port_name
from ships S inner join ports P
On S.home_port_id = P.port_id
group by port_name;

CREATE TABLE Deaths (
	Fname varchar(25),
	Lname varchar(25),
	Death_date date,
	Death_place varchar(40),
	Birth_Id Int NOT NULL,
	CONSTRAINT FK_BirthId Foreign Key (Birth_Id)
	REFERENCES Births (Birth_Id)
);

create table test_date(
	test_date date
);

alter table deaths
drop column Fname;


insert into deaths (birth_id, Death_date, Death_place)
VALUES
(17, '12-Feb-2007','Orem, Utah, UT');

insert into deaths (birth_id, Death_date, Death_place)
VALUES
(18, '05-Jun-2009', 'Taylorsville, Salt Lake, UT');

insert into deaths (birth_id, Death_date, Death_place)
VALUES
(9, '16-Jun-1979', 'Ontario, Malheur, OR');

Select birth_id, Fname, Lname
from births B
where exists (select *
				from deaths D 
				where B.birth_id = D.birth_id);

Insert into employees (employee_id, first_name, last_name, emp_email, hire_date)
values
(8, 'Desiree', 'Smith', 'DSmt@gmail.com', '05-June-2015');

CREATE TABLE PAY_HISTORY (
        PAY_HISTORY_ID  NUMBER,
        EMPLOYEE_ID     NUMBER,
        SALARY          NUMBER(10,2),
        START_DATE      DATE,
        END_DATE        DATE,
        CONSTRAINT PK_PAY PRIMARY KEY (PAY_HISTORY_ID),
        CONSTRAINT FK_EM_PAY FOREIGN KEY (EMPLOYEE_ID)
        REFERENCES EMPLOYEES (EMPLOYEE_ID)
);

INSERT INTO PAY_HISTORY (PAY_HISTORY_ID, Employee_id, SALARY, START_DATE, END_DATE)
VALUES
(1, 1, 100000, '12-JUN-2023', '31-DEC-2023');

INSERT INTO PAY_HISTORY (PAY_HISTORY_ID, Employee_id, SALARY, START_DATE, END_DATE)
VALUES
(2, 2, 80000, '11-JAN-2022', '31-DEC-2023');

INSERT INTO PAY_HISTORY (PAY_HISTORY_ID, Employee_id, SALARY, START_DATE, END_DATE)
VALUES
(3, 7, 120000, '01-JAN-2020', '31-DEC-2023');

INSERT INTO PAY_HISTORY (PAY_HISTORY_ID, Employee_id, SALARY)
VALUES
(4, 8, 90000);

INSERT INTO PAY_HISTORY (PAY_HISTORY_ID, Employee_id, SALARY)
VALUES
(5, 5, 90000);

INSERT INTO PAY_HISTORY (PAY_HISTORY_ID, Employee_id, SALARY)
VALUES
(6, 6, 50000);

INSERT INTO PAY_HISTORY (PAY_HISTORY_ID, Employee_id, SALARY)
VALUES
(7, 3, 60000);

 Create Table Product_type (
        Type_id number(2),
        Type_name varchar2(20),
        Constraint prodtype_pk Primary Key (type_id)
    );
    
    Create table electronics (
        model_number number(4),
        elec_name varchar2(20),
        Type_id number(2),
        constraint prodType_fk foreign key (type_id)
        references product_type (type_id) on delete cascade
    );

insert into product_type values (1, 'Electronics');
insert into product_type values (2, 'Tools');
insert into product_type values (3, 'Fire Arms');

insert into electronics values (1234, 'Chromebook', 1);
insert into electronics values (2345, 'Dell Lap Top', 1);
insert into electronics values (3456, 'Logi Wireless Mouse', 1);

create table cruise_customers (
	cruise_customer_id number(3),
	first_name varchar2(20),
	last_name varchar2(20),
	constraint crcust_pk primary key (cruise_customer_id)
);

create table cruise_orders (
	cruise_order_id number(3),
	order_date date,
	cruise_customer_id number(3),
	ship_id number(3),
	constraint cr_ord_pk primary key (cruise_order_id),
	constraint cr_cust_fc foreign key (cruise_customer_id)
	references cruise_customers (cruise_customer_id)
);

create sequence seq_cruise_customer_id;
create sequence seq_cruise_order_id;

INSERT INTO CRUISE_CUSTOMERS 
(cruise_customer_id, first_name, last_name)
VALUES
(seq_cruise_customer_id.NEXTVAL, 'John', 'Deer');

INSERT INTO CRUISE_ORDERS 
(cruise_order_id, order_date, cruise_customer_id)
VALUES
(seq_cruise_order_id.nextval, sysdate, seq_cruise_customer_id.currval);

create table cust_addresses (
	Address_id number(3),
	street_address varchar2(20),
	city varchar2(15),
	state varchar2(2),
	zip_code number(5),
	customer_id number(3),
	constraint pk_cust_ad primary key (Address_id),
	constraint fk_cust_id foreign key (customer_id)
	references Customers (Customer_id)
);

create sequence seq_customer_id START WITH 8;

create sequence seq_address_id;


INSERT INTO CUSTOMERS (Customer_id, FIRSTNAME, LASTNAME, PHONE)
VALUES
(seq_customer_id.NEXTVAL, 'Thomas', 'Edison', 3183334444);

INSERT INTO cust_addresses (address_id, street_address, city, state, zip_code, customer_id)
values
(seq_address_id.NEXTVAL, '2543 Pleasant Ave', 'Homer', 'LA', 71040, seq_customer_id.currval);

INSERT INTO CUSTOMERS (Customer_id, FIRSTNAME, LASTNAME, PHONE)
VALUES
(seq_customer_id.NEXTVAL, 'Jenna', 'Wilmington', 8013354474);

INSERT INTO cust_addresses (address_id, street_address, city, state, zip_code, customer_id)
values
(seq_address_id.NEXTVAL, '597 S 700 W', 'Cedar City', 'UT', 84720, seq_customer_id.currval);

CREATE TABLE SEMINARS
(SEMINAR_ID NUMBER(11) PRIMARY KEY,
SEMINAR_NAME VARCHAR2(30) UNIQUE);

/* HoW to remove not null constraint: 2 examples*/
alter table countries modify (region_id null);

alter tablee EMPLOYEES
modify (first_name null);

/* How to insert into with data from another table */

INSERT INTO EMPLOYEES (EMPLOYEE_ID, LAST_NAME, hire_date)
VALUES
((SELECT EMPNO FROM EMP WHERE EMPno = 7521),
(SELECT ENAME FROM EMP WHERE EMPNO =7521),
(SELECT HIREDATE FROM EMP WHERE EMPNO =7521)
);

select employee_id, last_name, hire_date
from employees
intersect
select empno, ename, HIREDATE
from emp
order by hire_date;

CREATE TABLE WWA_INVOICES (
        INV_ID NUMBER(7),
        CUST_PO VARCHAR2(10),
        INV_DATE DATE,
        NOTES VARCHAR2(200),
        CONSTRAINT PK_WINV PRIMARY KEY (INV_ID)
    );

    CREATE TABLE ONTARIO_ORDERS (
        ORDER_NUM NUMBER(11),
        PO_NUM VARCHAR2(20),
        SALES_REP VARCHAR2(20),
        CONSTRAINT PK_ONOR PRIMARY KEY (ORDER_NUM)
    );

INSERT INTO WWA_INVOICES (INV_ID, CUST_PO, INV_DATE)
VALUES
(10, 'WWA-200', '17_DEC-19');

INSERT INTO WWA_INVOICES (INV_ID, CUST_PO, INV_DATE)
VALUES
(20, 'WWA-001', '23-DEC-19');

INSERT INTO ONTARIO_ORDERS (ORDER_NUM, PO_NUM, SALES_REP)
VALUES
(882, 'WWA-001', 'C. Nelson');

INSERT INTO ONTARIO_ORDERS (ORDER_NUM, PO_NUM, SALES_REP)
VALUES
(883, 'WWA-017', 'J. Metelsky');

INSERT INTO ONTARIO_ORDERS (ORDER_NUM, PO_NUM, SALES_REP)
VALUES
(884, 'NBC-201', 'D. Knight');

MERGE INTO WWA_INVOICES WWA
USING ONTARIO_ORDERS ONT 
ON	(WWA.CUST_PO = ONT.PO_NUM)
WHEN MATCHED THEN UPDATE SET
	WWA.NOTES = ONT.SALES_REP
WHEN NOT MATCHED THEN INSERT
	(WWA.INV_ID, WWA.CUST_PO, WWA.INV_DATE, WWA.NOTES)
	VALUES
	(SEQ_INV.NEXTVAL, ONT.PO_NUM, SYSDATE, ONT.SALES_REP)
WHERE SUBSTR(ONT.PO_NUM, 1, 3) <> 'NBC';

CREATE sequence SEQ_INV START WITH 30 INCREMENT BY 10; 

INSERT INTO CRUISE_CUSTOMERS 
(cruise_customer_id, first_name, last_name)
VALUES
(seq_cruise_customer_id.NEXTVAL, 'Manuel', 'Moore');

INSERT INTO CRUISE_ORDERS 
(cruise_order_id, order_date, cruise_customer_id, ship_id)
VALUES
(seq_cruise_order_id.nextval, '30-oct-2022', seq_cruise_customer_id.currval, 2);

INSERT ALL
INTO CO_2023 	(CRUISE_ORDER_ID, ORDER_DATE,
				CRUISE_CUSTOMER_ID, SHIP_ID)
	VALUES 		(CRUISE_ORDER_ID, SYSDATE, 14, 1)
	INTO CO_ELCARO (CRUISE_ORDER_ID, ORDER_DATE, CRUISE_CUSTOMER_ID, SHIP_ID)
	VALUES 		(CRUISE_ORDER_ID, ORDER_DATE+30, 15, 1)
	INTO CO_ARCHIVED (CRUISE_ORDER_ID, ORDER_DATE, CRUISE_CUSTOMER_ID, SHIP_ID)
	VALUES (CRUISE_ORDER_ID, ORDER_DATE, CRUISE_CUSTOMER_ID, SHIP_ID)
SELECT CRUISE_ORDER_ID, ORDER_DATE, CRUISE_CUSTOMER_ID, SHIP_ID
FROM CRUISE_ORDERS;

create table CO_2023 (
	cruise_order_id number(3),
	order_date date,
	cruise_customer_id number(3),
	ship_id number(3)
);

create table CO_ELCARO (
	cruise_order_id number(3),
	order_date date,
	cruise_customer_id number(3),
	ship_id number(3)
);

create table CO_ARCHIVED (
	cruise_order_id number(3),
	order_date date,
	cruise_customer_id number(3),
	ship_id number(3)
);

CREATE TABLE WO_INV (
	INV_NO NUMBER(3),
	DATE_ENTERED DATE,
	DATE_SHIPPED DATE,
	CUST_ACCT VARCHAR2(20),
	CONSTRAINT PK_INV_NO PRIMARY KEY (INV_NO)
);

CREATE SEQUENCE SEQ_WO_INV;

CREATE TABLE INVOICES_ARCHIVED (
	INVOICE_ID NUMBER(3),
	INVOICE_DATE DATE,
	ACCOUNT_NUMBER VARCHAR(20),
	terms_of_discount VARCHAR2(20),
	VENDOR_ID NUMBER,
	TOTAL_PRICE NUMBER(8,2),
	shipping_date DATE
);

INSERT INTO WO_INV (INV_NO, DATE_ENTERED, DATE_SHIPPED, CUST_ACCT)
VALUES
(SEQ_WO_INV.NEXTVAL, '15-JUN-2019', '18-JUN-2019', 'ACC201');

INSERT INTO WO_INV (INV_NO, DATE_ENTERED, DATE_SHIPPED, CUST_ACCT)
VALUES
(SEQ_WO_INV.NEXTVAL, '12-JUN-2020', '18-JUN-2020', 'ACC202');

INSERT INTO WO_INV (INV_NO, DATE_ENTERED, DATE_SHIPPED, CUST_ACCT)
VALUES
(SEQ_WO_INV.NEXTVAL, '02-MAY-2023', '04-MAY-2023', 'ACC203');

INSERT INTO WO_INV (INV_NO, DATE_ENTERED, DATE_SHIPPED, CUST_ACCT)
VALUES
(SEQ_WO_INV.NEXTVAL, SYSDATE, '07-JUN-2023', 'ACC204');

INSERT FIRST
WHEN (DATE_SHIPPED < (ADD_MONTHS(SYSDATE,-12))) THEN
	INTO INVOICES_ARCHIVED (INVOICE_ID, INVOICE_DATE, SHIPPING_DATE, ACCOUNT_NUMBER)
	VALUES (INV_NO, DATE_ENTERED, DATE_SHIPPED, CUST_ACCT)
ELSE
	INTO INVOICES (INVOICE_ID, INVOICE_DATE, SHIPPING_DATE, ACCOUNT_NUMBER)
	VALUES (INV_NO, DATE_ENTERED, DATE_SHIPPED, CUST_ACCT)
SELECT INV_NO, DATE_ENTERED, DATE_SHIPPED, CUST_ACCT
FROM WO_INV;

CREATE SEQUENCE SEQ_BIRTHS START WITH 19;

create sequence SEQ_B_DAY START WITH 6;




/* INSERT into birthdays if living, if dead, insert into ancestors. */

create 

INSERT INTO Births (birth_id, Fname, Lname, Birth_date)
	VALUES
	(SEQ_BIRTHS.NEXTVAL, 'George W.', 'Bush', '06-Jul-1946');

INSERT INTO Births (birth_id, Fname, Lname, Birth_date)
	VALUES
	(SEQ_BIRTHS.NEXTVAL, 'Donald', 'Trump', '14-Jun-1946');

WHEN (TO_CHAR(Birth_date, 'YYYY') >= '1900') 
	AND birth_place like '%Utah'
	THEN

Update births
set birth_place = 'New Haven, CT, USA'
where fname = 'George W.';

SELECT Fname, Lname
from births
where (TO_CHAR(Birth_date, 'YYYY') >= '1900')
	AND birth_place like '%USA';

where (TO_CHAR(Birth_date, 'YYYY') >= '1900')
	AND birth_place like '%Utah';

Alter table birthdays
rename column Name to first_name;

INSERT
WHEN (TO_CHAR(Birth_date, 'YYYY') >= '1900')
	AND birth_place like '%Utah' THEN
	INTO ANCESTORS (BIRTH_ID, FIRST_NAME, LAST_NAME, BIRTH_DATE, BIRTH_PLACE)
	VALUES (BIRTH_ID, FNAME, LNAME, BIRTH_DATE, BIRTH_PLACE)
WHEN (TO_CHAR(Birth_date, 'YYYY') >= '1900')
	AND birth_place like '%USA' THEN
	INTO BIRTHDAYS (ID, FIRST_NAME, LAST_NAME, BIRTH_DATE, BIRTH_PLACE)
	VALUES (BIRTH_ID, FNAME, LNAME, BIRTH_DATE, BIRTH_PLACE)
SELECT BIRTH_ID, FNAME, LNAME, Birth_date, BIRTH_PLACE
FROM BIRTHS;

CREATE TABLE SALARY_CHART (
	ORG_ID 	NUMBER(3),
	EMP_TITLE VARCHAR2(30),
	EMP_INCOME NUMBER(10,2), 
	SUPERIOR VARCHAR2(30),
	SUP_INCOME NUMBER(10,2)
);

/* Calcualtes the cumulative sum of orders for order_total*/
select order_id, order_date, order_total, 
	SUM(order_total) OVER (ORDER BY ORDER_DATE) "Running Total"
FROM ORDERS
ORDER BY ORDER_DATE;

/* Calcualtes the cumulative variance and standard deveation for order_total*/
select order_id, order_date, order_total
	, variance(order_total) over (order by order_date) "Variance"
	, STDDEV(order_total) OVER (ORDER BY ORDER_date) "Std Dev"
from orders
order by order_date;

CREATE SEQUENCE SEQ_ORDERS START WITH 17;

INSERT INTO ORDERS (ORDER_ID, ORDER_DATE, ORDER_TOTAL, CUST_ID, ORDER_STATUS)
VALUES
(SEQ_ORDERS.NEXTVAL, '02-FEB-2023', 2000.00, 2, 3);
INSERT INTO ORDERS (ORDER_ID, ORDER_DATE, ORDER_TOTAL, CUST_ID, ORDER_STATUS)
VALUES
(SEQ_ORDERS.NEXTVAL, '05-FEB-2023', 2000.00, 2, 3);
INSERT INTO ORDERS (ORDER_ID, ORDER_DATE, ORDER_TOTAL, CUST_ID, ORDER_STATUS)
VALUES
(SEQ_ORDERS.NEXTVAL, '25-FEB-2023', 2200.99, 3, 2);
INSERT INTO ORDERS (ORDER_ID, ORDER_DATE, ORDER_TOTAL, CUST_ID, ORDER_STATUS)
VALUES
(SEQ_ORDERS.NEXTVAL, '05-MAR-2023', 1900.90, 4, 1);
INSERT INTO ORDERS (ORDER_ID, ORDER_DATE, ORDER_TOTAL, CUST_ID, ORDER_STATUS)
VALUES
(SEQ_ORDERS.NEXTVAL, '15-DEC-2022', 2000.99, 5, 3);

/* Neither of these worked*/
 select to_number((to_char(order_date, 'DD-MM-YYYY')))
 SELECT TO_NUMBER((TO_CHAR(ORDER_DATE, 'DD-MM-YYYY')), 'DD-MM-YYYY')


/* Converting a DATE TO A NUMBER using substr, months) */

Select TO_NUMBER(LTRIM(SUBSTR(to_char(order_date, 'DD-MM-YYYY'), 4, 2), 0)) Num_Mon
from orders;

/* You can get rid of LTRIM beacuse numbers trims the leading 0 anyway*/
Select TO_NUMBER((SUBSTR(to_char(order_date, 'DD-MM-YYYY'), 4, 2))) Num_Mon
from orders;

/* You can get rid of SUBSTR and type MM to get the month number*/
Select TO_NUMBER((to_char(order_date, 'MM'))) Num_Mon
from orders;

/*Or year*/
Select TO_NUMBER((to_char(order_date, 'YYYY'))) Num_Mon
from orders;

/*Or Day*/
Select TO_NUMBER((to_char(order_date, 'DD'))) Num_Mon
from orders;

/* Rank the orders*/
Select cust_id, order_date, order_total, 
	DENSE_RANK() OVER (PARTITION BY CUST_ID ORDER BY ORDER_TOTAL) CUST_ORD_RANK
FROM ORDERS
ORDER BY Cust_ID, Order_total;

/* Select the customer with the most orders*/

Select cust_id, Num_orders
from 	(Select cust_id, count(cust_id) Num_orders
		from orders
		group by cust_id)
where Num_orders =
	(Select max(count(cust_id))
	from orders
	group by cust_id);

/* Here's a more complicated way to find the customer with the most orders */

Select cust_id
from (Select cust_id, order_date, order_total, 
	DENSE_RANK() OVER (PARTITION BY CUST_ID ORDER BY ORDER_TOTAL) CUST_ORD_RANK
FROM ORDERS
ORDER BY Cust_ID, Order_total)
where CUST_ORD_RANK =
	(Select max(count(cust_id))
	from orders
	group by cust_id);

/* What the number of orders for each customer */
Select count(cust_id)
from orders
group by cust_id;

/* What is the max number of orders by a customer */
Select max(count(cust_id))
from orders
group by cust_id;

Select cust_id, count(cust_id) Num_orders
from orders
group by cust_id;

Select 
To_char(to_date('01-JAN-55', 'DD-MON_YY'), 'YYYY') "A",
To_char(to_date('01-JAN-65', 'DD-MON_YY'), 'YYYY') "B",
To_char(to_date('01-JAN-75', 'DD-MON_YY'), 'YYYY') "C",
To_char(to_date('01-JAN-80', 'DD-MON_YY'), 'YYYY') "D",
To_char(to_date('01-JAN-85', 'DD-MON_YY'), 'YYYY') "E",
To_char(to_date('01-JAN-90', 'DD-MON_YY'), 'YYYY') "F",
To_char(to_date('01-JAN-99', 'DD-MON_YY'), 'YYYY') "G",
To_char(to_date('01-JAN-00', 'DD-MON_YY'), 'YYYY') "H",
To_char(to_date('01-JAN-01', 'DD-MON_YY'), 'YYYY') "I",
To_char(to_date('01-JAN-05', 'DD-MON_YY'), 'YYYY') "J"
from dual;

WITH
Births_since_1900 AS (
Select Fname, Lname, Birth_place
From births
WHERE birth_date > '01-Jan-1890'
)
Select Fname
From Births_since_1900
Order By Fname;

select e.ename as employee_name,
       dc1.dept_count as emp_dept_count,
       m.ename as manager_name,
       dc2.dept_count as mgr_dept_count
    from   emp e
       join (select deptno, count(*) as dept_count
             from   emp
             group by deptno) dc1
         on e.deptno = dc1.deptno
       join emp m on e.mgr = m.empno
       join (select deptno, count(*) as dept_count
             from   emp
             group by deptno) dc2
         on m.deptno = dc2.deptno;

dept

with dept_count as (
  select deptno, count(*) as dept_count
  from   emp
  group by deptno)
select e.ename as employee_name,
       dc.dept_count as emp_dept_count
from   emp e
       join dept_count dc on e.deptno = dc.deptno;

SELECT 	CHILD.FIRST_NAME || ' ' || CHILD.LAST_NAME CHILD, 
		FATHER.FIRST_NAME || ' ' || FATHER.LAST_NAME FATHER
FROM BIRTHS CHILD INNER JOIN BIRTHS FATHER
ON CHILD.FATHER_ID = FATHER.BIRTH_ID
ORDER BY CHILD.LAST_NAME;

Create Table MARRIAGES (
	Marriage_Id number(3),
	Marriage_year NUMBER,
	Marriage_place VARCHAR2(35),
	Groom_Id NUMBER(3) not null,
	Bride_Id NUMBER(3) not null,
	CONSTRAINT PK_MARR Primary Key (Marriage_Id),
	CONSTRAINT FK_Groom_Id Foreign Key (Groom_Id)
	REFERENCES Births (BIRTH_ID),
	CONSTRAINT FK_Bride_Id Foreign Key (Bride_Id)
	REFERENCES Births (BIRTH_ID)
);

CREATE SEQUENCE SEQ_MARR_ID START WITH 101;

INSERT INTO MARRIAGES (MARRIAGE_ID, Marriage_year, Marriage_place, Groom_Id, Bride_Id)
	VALUES
	(SEQ_MARR_ID.NEXTVAL, 1885, 'Logan, Cache, Utah', 7, 8);
	
INSERT INTO MARRIAGES (MARRIAGE_ID, Marriage_year, Marriage_place, Groom_Id, Bride_Id)
	VALUES
	(SEQ_MARR_ID.NEXTVAL, 1872, 'Lehi, Lehi, Utah', 5, 6);

INSERT INTO MARRIAGES (MARRIAGE_ID, Marriage_year, Marriage_place, Groom_Id, Bride_Id)
	VALUES
	(SEQ_MARR_ID.NEXTVAL, 1861, 'Springville, Utah, Utah', 11, 12);

INSERT INTO MARRIAGES (MARRIAGE_ID, Marriage_year, Marriage_place, Groom_Id, Bride_Id)
	VALUES
	(SEQ_MARR_ID.NEXTVAL, 1878, 'St George, Washington, Utah', 13, 14);

INSERT INTO MARRIAGES (MARRIAGE_ID, Marriage_year, Marriage_place, Groom_Id, Bride_Id)
	VALUES
	(SEQ_MARR_ID.NEXTVAL, 1897, 'Manti, Sanpete, Utah', 15, 16);

INSERT INTO MARRIAGES (MARRIAGE_ID, Marriage_year, Marriage_place, Groom_Id, Bride_Id)
	VALUES
	(SEQ_MARR_ID.NEXTVAL, 1913, 'Salt lake City, Salt Lake, Utah', 9, 10);

INSERT INTO MARRIAGES (MARRIAGE_ID, Marriage_year, Marriage_place, Groom_Id, Bride_Id)
	VALUES
	(SEQ_MARR_ID.NEXTVAL, 1936, 'Manti, Sanpete, Utah', 17, 18);

SELECT 	M.MARRIAGE_YEAR,
		GROOM.FIRST_NAME || ' ' || GROOM.LAST_NAME GROOM, 
		BRIDE.FIRST_NAME || ' ' || BRIDE.LAST_NAME BRIDE
FROM 	MARRIAGES M INNER JOIN BIRTHS GROOM
				ON M.GROOM_ID = GROOM.BIRTH_ID
			INNER JOIN BIRTHS BRIDE
				ON M.BRIDE_ID = BRIDE.BIRTH_ID
ORDER BY M.MARRIAGE_YEAR;


Alter table sales
Add constraint fk_sales Foreign key (prod_id)
		References products (prod_id);

CREATE TABLE products (
	Prod_id NUMBER(3),
	Prod_name VARCHAR2(20),
	prod_list_price NUMBER(8 ,2),
	CONSTRAINT PK_PROD PRIMARY KEY (PROD_ID)
);

CREATE TABLE sales (
	Prod_id NUMBER(3),
	cust_id NUMBER(3),
	time_id date,
	qty_sold NUMBER(10,2),
	CONSTRAINT PK_SALES primary key (CUST_id),
	CONSTRAINT FK_SAL_PROD FOREIGN KEY (PROD_ID)
		References PRODUCTS (PROD_ID)
);

CREATE SEQUENCE SEQ_PROD START WITH 101;

INSERT INTO PRODUCTS (prod_id, Prod_name, prod_list_price, SURCHARGE, DELIVERY_DATE)
	VALUES
	(seq_prod.nextval, 'Table Saw', 250.99, '7', '01-jun-2022');

INSERT INTO PRODUCTS (prod_id, Prod_name, prod_list_price, SURCHARGE, DELIVERY_DATE)
	VALUES
	(seq_prod.nextval, 'Drywall Knife', 12.79, '.3', '02-JUN-2022');

INSERT INTO PRODUCTS (prod_id, Prod_name, prod_list_price, SURCHARGE, DELIVERY_DATE)
	VALUES
	(seq_prod.nextval, 'Four Wheeler', 7999.99, '99', '05-JUN-2022');

INSERT INTO PRODUCTS (prod_id, Prod_name, prod_list_price, SURCHARGE, DELIVERY_DATE)
	VALUES
	(seq_prod.nextval, 'Trailer', 4589.89, '75', '06-JUN-2022');
	
INSERT INTO SALES (Prod_id, cust_id, time_id, qty_sold)
	VALUES
	(103, seq_customer_id.NEXTVAL, '01-FEB-2014', 2);

INSERT INTO SALES (Prod_id, cust_id, time_id, qty_sold)
	VALUES
	(102, seq_customer_id.NEXTVAL, '02-OCT-2015', 1);

INSERT INTO SALES (Prod_id, cust_id, time_id, qty_sold)
	VALUES
	(101, seq_customer_id.NEXTVAL, '08-MAY-2022', 3);
INSERT INTO SALES (Prod_id, cust_id, time_id, qty_sold)
	VALUES
	(101, seq_customer_id.NEXTVAL, '08-JUN-2022', 2);
INSERT INTO SALES (Prod_id, cust_id, time_id, qty_sold)
	VALUES
	(102, seq_customer_id.NEXTVAL, '12-JUN-2022', 4);
	
SELECT p.prod_id, COUNT(s.prod_id)
FROM products p Left Outer Join sales s
ON p.prod_id = s.prod_id
Group by p.prod_id;

SELECT p.prod_id, COUNT(s.prod_id)
FROM products P Right Outer Join sales s
ON p.prod_id = s.prod_id
Group by p.prod_id;

SELECT p.prod_id, COUNT(s.prod_id)
FROM products P MATCH Join sales s
ON p.prod_id = s.prod_id
Group by p.prod_id;

CREATE TABLE PROGRAMS (
	PROG_ID NUMBER(3),
	PROG_COST NUMBER(8,2),
	START_DATE DATE NOT NULL,
	END_DATE DATE,
	CONSTRAINT PK_PROG PRIMARY KEY (PROG_ID)
);

INSERT INTO PROGRAMS (PROG_ID, PROG_COST, START_DATE, END_DATE)
VALUES
(1, 1099.99, '01-MAY-2023', '31-MAY-2023');

INSERT INTO PROGRAMS (PROG_ID, PROG_COST, START_DATE, END_DATE)
VALUES
(2, 2099.99, '10-MAY-2023', '08-JUN-2023');

INSERT INTO PROGRAMS (PROG_ID, PROG_COST, START_DATE, END_DATE)
VALUES
(3, 3099.99, '20-MAY-2023', NULL);

create sequence ord_seq;

CREATE TABLE ord_items(
	ord_no number(4) DEFAULT ORD_SEQ.NEXTVAL NOT NULL,
	item_no NUMBER(3),
	qty NUMBER(3) CHECK (qty BETWEEN 100 AND 200),
	expiry_date DATE CHECK (expiry_date > TO_DATE('01-JAN-2023')),
	CONSTRAINT IT_PK PRIMARY KEY (ORD_NO, ITEM_NO),
	CONSTRAINT ORD_FK FOREIGN KEY (ord_no) REFERENCES orders (order_id)
);

insert into ord_items (item_no, qty, expiry_date) values (4, 145, '12-Jul-2023');

select start_date, NVL2(end_date, to_char(prog_cost), 'Unknown')
FROM programs;

/* Number of days From the 15th of March until today */

select 365.25*((MONTHS_BETWEEN(sysdate, '15-Mar-2020'))/12) as "DAYS"
from dual;

SELECT ROUND(SYSDATE – TO_DATE('15-MAR-2020') FROM DUAL;

CREATE TABLE CUSTOMERS

ALTER TABLE CUSTOMERS
MODIFY CUST_CITY VARCHAR2(10);


ALTER TABLE CUSTOMERS
MODIFY CUST_CREDIT_LIMIT NUMBER(5);

INSERT INTO CUSTOMERS (Customer_id, FIRSTNAME, LASTNAME, CUST_CITY, CUST_CREDIT_LIMIT)
VALUES
(seq_customer_id.NEXTVAL, 'Mariadoc', 'Brandybuck', 'Holland', 1000);

INSERT INTO CUSTOMERS (Customer_id, FIRSTNAME, LASTNAME, CUST_CITY, CUST_CREDIT_LIMIT)
VALUES
(seq_customer_id.NEXTVAL, 'June', 'Soon', 'Minden', 750);

SELECT 	Customer_id, lastname, cust_city,
		CUST_CREDIT_LIMIT "CURRENT CREDIT", 
		NVL(TO_CHAR(CUST_CREDIT_LIMIT * 1.15), 'N/A') "New Credit"
from customers;

ALTER TABLE ABCS
SET UNUSED COLUMN2;

select lastname, CUST_CREDIT_LIMIT
from customers
where ((Initcap(lastname) LIKE 'A%')
	OR (INITCAP(LASTNAME) LIKE 'B%'))
	AND CUST_CREDIT_LIMIT < 1000;

/* To add a constraint to a table*/
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
   FOREIGN KEY (column1, column2, ... column_n)
   REFERENCES parent_table (column1, column2, ... column_n)
   ON DELETE CASCADE;

/* For example */

ALTER TABLE orders
ADD CONSTRAINT order_Cust_id_fk
   FOREIGN KEY (order_id)
   REFERENCES customers (customer_id)
   ON DELETE CASCADE;

/* to drop a constraint, since you can rename a constraint, but not modify it other ways */
ALTER TABLE table_name
DROP CONSTRAINT constraint_name;

/* For example */
ALTER TABLE orders
DROP CONSTRAINT order_id_fk;

/* You can also use the cascade keyword when droppoing a primary key to make sure it also 
drops the associated foreign keys */
ALTER TABLE table_name 
DISABLE CONSTRAINT constraint_name CASCADE;

/* Other creating and dropping constraints examples */

Alter table sales
Add constraint fk_sales Foreign key (prod_id)
		References products (prod_id);

ALTER TABLE parent 
ADD CONSTRAINT pk_parent primary key (id);

ALTER TABLE kid 
ADD CONSTRAINT fk_kid_par FOREIGN KEY (parent_id)
	REFERENCES parent (id);

ALTER TABLE parent 
DISABLE CONSTRAINT pk_parent CASCADE;

/* How to rename a constraint */
ALTER TABLE PORTS
    	RENAME CONSTRAINT SYS_C0011505 TO PORT_ID_PK;

/* For example: */
ALTER TABLE employees
    	RENAME CONSTRAINT SYS_C008251 TO EMP_ID_PK;

UPDATE employees A
	SET department_id = 
		(SELECT department_id
			FROM departments
			WHERE location_id = '2100'),
		(salary, commision_pct) = 
		(SELECT 1.1*AVG(salary), 1.5*AVG(commision_pct)
		FROM EMPLOYEES B 
		WHERE a.department_id = b.department_id)
	WHERE department_id IN 
		(SELECT department_id
		FROM departments
		WHERE LOCATION_ID = 2900
			OR location_id = 2700);


/*
	Counting from the left, for any letters after the second ' ', replace them with *.
	- Substr (to identify the letters after the ' ')
	- use instr to find the ' '
	- length to count the # of letters
	- ltrim to take away those letters
	- Lpad (pad with *)

Extract only those customer names taht have three names and display the * symbole in the place of the first name. 

 */

 CREATE TABLE CUST (
	ID NUMBER(3),
	CUST_NAME VARCHAR2(30)
 );

select substr(CUST_NAME, 1, INSTR(CUST_NAME, ' ', -1, 2))
FROM CUST;

SELECT INSTR(CUST_NAME, ' ', -1, 2)
FROM CUST;

SELECT LTRIM(CUST_NAME, substr(CUST_NAME, 1, INSTR(CUST_NAME, ' ', -1, 2)-1))
FROM CUST;

/* Question 62 from practice test 4. 
My answer is the first query, 
his answer is the 2nd query */ 

SELECT LPAD(LTRIM(
	CUST_NAME, 
	substr(CUST_NAME, 1, INSTR(CUST_NAME, ' ', -1, 2)-1)), 
	Length(CUST_NAME), '*') "CUST NAME"
FROM CUST;

SELECT LPAD(SUBSTR(CUST_NAME, 
	INSTR(CUST_NAME, ' ')), LENGTH(CUST_NAME), '*') "CUST NAME"
FROM CUST
WHERE INSTR(CUST_NAME, ' ', -1, 2) <> 0;


create SEQUENCE SEQ_EMP_ID START WITH 10;

INSERT INTO EMPLOYEES (EMPLOYEE_ID, LAST_NAME, HIRE_DATE)
VALUES
(SEQ_EMP_ID.NEXTVAL, 'Mo Jo Irish Boy', '05-MAY-2023');

INSERT INTO EMPLOYEES (EMPLOYEE_ID, LAST_NAME, HIRE_DATE)
VALUES
(SEQ_EMP_ID.NEXTVAL, 'Jay Man Swiss', '05-MAY-2023');

select Employee_id, last_name, Instr(last_name, ' ', 1, 2)
from employees
WHERE Instr(last_name, ' ', 1, 2) != 0;

SELECT EMPLOYEE_ID, SUBSTR(LAST_NAME,
	Instr(last_name, ' ', 1, 2))
FROM EMPLOYEES
WHERE Instr(last_name, ' ', 1, 2) <> 0;

Select REMAINDER(18, 10) DIST_2, REMAINDER(19, 5) DIST_1
FROM DUAL;

SELECT SUM(ORDER_TOTAL) "Total Spent", CUST_ID
from orders
group by cust_id
order by 1 desc;

SELECT CUST_ID, ORDER_DATE, ORDER_TOTAL, 
	SUM(ORDER_TOTAL) OVER (PARTITION BY CUST_ID ORDER BY ORDER_DATE) "Cust Run Total"
from orders
order by cust_id;

CREATE SEQUENCE SEQ_TEMP_ID;

CREATE TABLE TEMPLES (
	TEMPLE_ID NUMBER(3) DEFAULT SEQ_TEMP_ID.NEXTVAL,
	TEMPLE_NAME VARCHAR2(20),
	DATE_DEDICATED DATE CHECK(DATE_DEDICATED > TO_DATE('01-JAN-1836')),
	CONSTRAINT PK_TEMP_ID PRIMARY KEY (TEMPLE_ID)
);

INSERT INTO TEMPLES (TEMPLE_NAME, DATE_DEDICATED)
VALUES
('DALLAS TEXAS', '19-OCT-1984');

INSERT INTO TEMPLES (TEMPLE_NAME, DATE_DEDICATED)
VALUES
('Provo Utah', '09-FEB-1972');

INSERT INTO TEMPLES (TEMPLE_NAME, DATE_DEDICATED)
VALUES
('St George Utah', '06-APR-1877');

INSERT INTO TEMPLES (TEMPLE_NAME, DATE_DEDICATED)
VALUES
('Salt Lake City', '06-APR-1893');

INSERT INTO EMPLOYEES (EMPLOYEE_ID, LAST_NAME, HIRE_DATE)
VALUES
(7369, 'Smith', '07-DEC-2008');

INSERT INTO EMPLOYEES (EMPLOYEE_ID, LAST_NAME, HIRE_DATE)
VALUES
(7499, 'Schmidt', '17-DEC-2000');

INSERT INTO EMPLOYEES (EMPLOYEE_ID, LAST_NAME, HIRE_DATE)
VALUES
(7788, 'Adams', '18-jan-2001');

insert into emp (empno, ename, hiredate)
values
(3, 'Davis', '12-JUN-23');


-- Merge employees and emp tables
MERGE INTO employees Y
USING emp E
ON (Y.EMPLOYEE_ID = E.EMPNO)
WHEN MATCHED
	THEN UPDATE SET
		Y.last_name = E.ename,
		Y.hire_date = E.hiredate
	WHERE UPPER(Y.LAST_NAME) <> UPPER(E.ENAME)
	DELETE WHERE Y.FIRST_NAME LIKE 'J%'
WHEN NOT MATCHED
	THEN INSERT (Y.EMPLOYEE_ID, Y.LAST_NAME, Y.HIRE_DATE)
	VALUES (E.EMPNO, E.ENAME, E.HIREDATE);

SELECT nvl(first_name, 'NFN') from employees;

CREATE TABLE PROJECT_TASK_DETAILS (
	TASK_ID VARCHAR2(3),
	BASED_ON VARCHAR2(3),
	TASK_IN_CHARGE VARCHAR2(15),
	CONSTRAINT PK_PROJ_TASK PRIMARY KEY (TASK_ID),
	CONSTRAINT FK_BASED_ID FOREIGN KEY (BASED_ON)
	REFERENCES PROJECT_TASK_DETAILS (TASK_ID)
);

INSERT INTO PROJECT_TASK_DETAILS (TASK_ID, TASK_IN_CHARGE)
VALUES
('PO1', 'KING');

INSERT INTO PROJECT_TASK_DETAILS (TASK_ID, BASED_ON, TASK_IN_CHARGE)
VALUES
('PO2', 'PO1', 'KOCHAR');

INSERT INTO PROJECT_TASK_DETAILS (TASK_ID, BASED_ON, TASK_IN_CHARGE)
VALUES
('PO3', NULL, 'GREEN');

INSERT INTO PROJECT_TASK_DETAILS (TASK_ID, BASED_ON, TASK_IN_CHARGE)
VALUES
('PO4', 'PO3', 'SCOTT');

SELECT P.TASK_ID, P.BASED_ON, D.TASK_IN_CHARGE
FROM PROJECT_TASK_DETAILS P
JOIN PROJECT_TASK_DETAILS D
ON (P.BASED_ON = D.TASK_ID);

SELECT P.TASK_ID, P.BASED_ON, D.TASK_IN_CHARGE
FROM PROJECT_TASK_DETAILS P
LEFT JOIN PROJECT_TASK_DETAILS D
ON (P.BASED_ON = D.TASK_ID);

CREATE TABLE ORDER_ITEMS (
	ORDER_ID NUMBER(5) NOT NULL,
	LINE_ITEM_ID NUMBER(2),
	PRODUCT_ID NUMBER(4),
	UNIT_PRICE NUMBER(9,2),
	QUANTITY NUMBER(4),
);

INSERT INTO ORDER_ITEMS (ORDER_ID, LINE_ITEM_ID, PRODUCT_ID, UNIT_PRICE, QUANTITY)
VALUES
(20012, 4, 2322, 19.00, 188);

INSERT INTO ORDER_ITEMS (ORDER_ID, LINE_ITEM_ID, PRODUCT_ID, UNIT_PRICE, QUANTITY)
VALUES
(20013, 5, 2323, 17.00, 190);

INSERT INTO ORDER_ITEMS (ORDER_ID, LINE_ITEM_ID, PRODUCT_ID, UNIT_PRICE, QUANTITY)
VALUES
(20013, 9, 2359, 227.99, 204);

INSERT INTO ORDER_ITEMS (ORDER_ID, LINE_ITEM_ID, PRODUCT_ID, UNIT_PRICE, QUANTITY)
VALUES
(20014, 5, 2311, 58, 47);

INSERT INTO ORDER_ITEMS (ORDER_ID, LINE_ITEM_ID, PRODUCT_ID, UNIT_PRICE, QUANTITY)
VALUES
(20014, 6, 2289, 95, 51);

ALTER TABLE ORDER_ITEMS
DROP CONSTRAINT PK_ORD_ITEMS;

ALTER TABLE ORDER_ITEMS
MODIFY ORDER_ID NOT NULL;

/* Select the order_id of the order that has the highest total value among all the orders 

The 2 next queries both give you the correct order_id, but only the first gives you the correct total.

The third query gives a running total.
*/

select ORDER_ID, sum(UNIT_PRICE * QUANTITY)
FROM ORDER_ITEMS
GROUP BY ORDER_ID
ORDER BY 2 DESC
FETCH FIRST ROW ONLY;

SELECT ORDER_ID, MAX(UNIT_PRICE * QUANTITY) AS "LARGEST ORDER"
FROM ORDER_ITEMS 
GROUP BY ORDER_ID
HAVING SUM(UNIT_PRICE * QUANTITY) = (
	SELECT MAX(SUM(UNIT_PRICE * QUANTITY))
	FROM ORDER_ITEMS
	GROUP BY ORDER_ID);

SELECT ORDER_ID, (UNIT_PRICE * QUANTITY) "SUB TOTAL",
	SUM(UNIT_PRICE * QUANTITY) OVER (PARTITION BY ORDER_ID ORDER BY (UNIT_PRICE * QUANTITY)) "RUNNING TOTAL"
FROM ORDER_ITEMS
ORDER BY ORDER_ID;

SELECT MAX(UNIT_PRICE * QUANTITY) KEEP (DENSE_RANK FIRST ORDER BY ORDER_ID)
"MAX SPENT ITEM"
FROM ORDER_ITEMS;

-- Dense Rank
SELECT ORDER_ID, (UNIT_PRICE * QUANTITY) SPENT_ON_ITEM,
	DENSE_RANK() OVER (PARTITION BY ORDER_ID ORDER BY (UNIT_PRICE * QUANTITY) DESC) SPENT_RANK
FROM ORDER_ITEMS
ORDER BY order_id;

SELECT ORDER_ID, (QUANTITY * UNIT_PRICE) SPENT
FROM ORDER_ITEMS
WHERE UNIT_PRICE = (
SELECT MAX(UNIT_PRICE)
FROM ORDER_ITEMS);

SELECT ORDER_ID, 
	SUM(QUANTITY * UNIT_PRICE) "Order Total", 
	count(unit_price) "Items Purchased",
	Sum(quantity) "How Many?"
from order_items
group by order_id
having sum(quantity * unit_price) > 5000
order by 2 desc;

select lastname, cust_credit_limit
from customers
where((INITCAP(lastname) LIKE 'A%')
OR (INITCAP(LASTNAME) LIKE 'B%'))
AND CUST_CREDIT_LIMIT < 1000;