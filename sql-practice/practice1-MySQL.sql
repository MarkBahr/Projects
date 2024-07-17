/*
Visual Studio Code Keyboard Shortcuts

Ctrl P = quick assess to open a file
Ctrl B = Open and close the side bar file explorer
Ctrl D = when you need to change a bunch of H3 tags to H4 or a bunch of 
references to the table MOVIES to MY_MOVIES you can change them all at once. 
SHIFT+ALT+A = Multi-line comment
ALT+DownARROW / ALT+UpArrow = move a line of text up or down 
Windows: SHIFT+ALT+UP or SHIFT+ALT+DOWN = Copy/past below or above
7. Go back / move forward (ALT+LeftArrow,  ALT+RightArrow) = Moves you between
two different places in the document, could be pages apart.

*/

CREATE TABLE Movies (
	MovieID INT NOT NULL AUTO_INCREMENT, 
	title varchar(100), 
	release_year YEAR, 
	rating DOUBLE(3,2), 
	PRIMARY KEY (MovieID)
	);

CREATE TABLE Actors (
	ActorID INT NOT NULL AUTO_INCREMENT,
	first_name varchar(100),
	last_name varchar(100),
	PRIMARY KEY (ActorID)
	);
	
INSERT INTO Actors (ActorID, first_name, last_name)
	VALUES (1, 'Mark', 'Bahr');


Product Category
- Equipment
- Tools
- Building materials
- Miscellaneous

Products
- product ID
- Product name
- Product price
- product category

CREATE TABLE Product_Categories (
	CategoryID INT NOT NULL AUTO_INCREMENT,
	product_category varchar(100),
	PRIMARY KEY (CategoryID)
	);
	
	
INSERT INTO Product_Categories
	(product_category)
	VALUES 
	('Tools'),
	('Equipment'),
	('Materials'),
	('Miscellaneous');

CREATE TABLE Products (
	ProductID INT NOT NULL AUTO_INCREMENT,
	product_name varchar(100),
	product_price INT,
	product_categoryID INT NOT NULL,
	PRIMARY KEY (ProductID),
	CONSTRAINT Product_FK FOREIGN KEY (product_categoryID) 
	REFERENCES Product_Categories (CategoryID)
	);
	
	
INSERT INTO Actors (first_name, last_name) 
	VALUES 
	('Mickey', 'Mouse'), 
	('John', 'Baptist'), 
	('National', 'Park'), 
	('Terrence', 'Moss'), 
	('Han', 'Solo'), 
	('John', 'Deer'), 
	('Ally', 'Pearson'),
	('Alice', 'Johnson');
	
CREATE TABLE Banana_Joe (
	GameID INT NOT NULL AUTO_INCREMENT,
	FName VARCHAR(100),
	LName VARCHAR(100),
	game1 INT,
	game2 INT,
	game3 INT,
	game4 INT,
	PRIMARY KEY (GameID)
	);
	
INSERT INTO Banana_Joe (FName, LName, game1, game2, game3, game4)
	VALUES
	('Esther', 'Bahr', 1, 5, 8, 2),
	('Jenny', 'Bahr', 3, 4, 5, 3),
	('Rachel', 'Bahr', 0, 5, 7, 5),
	('Mary', 'Bahr', 7, 4, 2, 1);
	
SELECT CONCAT(Fname, ' ', Lname) AS Player FROM BANANA_JOE;

SELECT CONCAT(Fname, ' ', Lname) AS Player,  FROM BANANA_JOE;

/* This is for initials*/
SELECT CONCAT(SUBSTRING(Fname, 1, 1), SUBSTRING(Lname, 1, 1)) as Player_Initials from BANANA_JOE;

SELECT PLAYER Name, Initials, Game 1, Game 2, Gamd 3, Game 4, Total Score, Average score, 

/* Player Name */
SELECT 
	CONCAT(LName, ', ', FName) AS "Player Name", 
	CONCAT(SUBSTRING(Fname, 1, 1), SUBSTRING(Lname, 1, 1)) as Player_Initials, 
	game1 as "Game 1", 
	game2 AS "Game 2", 
	game3 AS "Game 3",
	game4 as "Game 4",
	(game1 + game2 + game3 + game4) as Total_Score, 
	((game1 + game2 + game3 + game4)/4) as "Average Score"
	from BANANA_JOE;


/* Game 1 */
SELECT game1 as "Game 1" from banana_joe;

/* Game 2 */
SELECT game2 as "Game 2" from banana_joe;

/* Game 3 */
SELECT game3 as "Game 3" from banana_joe;

/* Game 4 */
SELECT game4 as "Game 4" from banana_joe;

/* Total Score*/
SELECT (game1 + game2 + game3 + game4) as Total_Score, ((game1 + game2 + game3 + game4)/4) as "Average Score" FROM BANANA_JOE;

SELECT game1 as Total_Score, (Total_Score/4) as "Average Score" FROM BANANA_JOE;


/* Average Score*/ 
SELECT (Total_Score/4) as "Average Score" FROM BANANA_JOE;

 insert into products (product_name, product_price, product_categoryID) 
	values 
	('Dewalt Hammer', 19.99, 1),
	('Drywall 6 Inch Knife', 12.99, 1),
	('Big Max Tape Measure (25 ft)', 18.99, 1),
	('Multipurpose Tractor (CAT)', 20000.99, 2),
	('2x4, 10ft', 4.99, 3),
	('8x4 Sheetrock', 10.99, 3),
	('Cieling Fan', 89.99, 3),
	('Exterior Screws, 2 inch, 5 lb', 25.99, 3),
	('Old Fashioned Licorice', 6.99, 4),
	('Chapstick', 2.99, 4);
	
(
	ProductID INT NOT NULL AUTO_INCREMENT,
	product_name varchar(100),
	product_price INT,
	product_categoryID INT NOT NULL,
	PRIMARY KEY (ProductID),
	CONSTRAINT Product_FK FOREIGN KEY (product_categoryID) 
	REFERENCES Product_Categories (CategoryID)
	);	
	
CREATE TABLE Projects (
	project_id INT NOT NULL AUTO_INCREMENT,
	Ship_id int,
	Project_name varchar(100),
	Project_cost int,
	days INT,
	Primary key (project_id)
	);
	
insert into projects (ship_id, Project_name, project_cost, days) 
	values 
	(2, 'Deck Resurfacing', 964000, 10),
	(3, 'Lifeboat Inspection', 12000, 3),
	(1, 'Clean Pools', 37000, 5),
	(1, 'Replace Lobby Carpeting', 137000, 5),
	(1, 'Major Engine Service', 837000, 15),
	(1, 'Remodel Dining Room A', 950000, 45),
	(1, 'Remodel Dining Room B', 925000, 37),
	(1, 'Lifeboat Inspection', 12000, 3);
	
insert into banana_joe (FName, LName, game1, game2)
	values
	('Mark', 'Bahr', 2, 3),
	('Lydia', 'Bahr', 4, 5);

Got to middle of page 6 in Lesson 4 Restricting Data SQL Cert

SELECT project_id, project_name, project_cost, days, project_cost/days from projects
order by 5;

SELECT ship_id, project_cost, project_name as "The Project", days
FROM projects
ORDER BY ship_id desc, "The Project", 2;

Create table bubbles (
	member_id INT NOT NULL Auto_increment,
	Fname varchar(100),
	Lname varchar(100),
	bubbles_popped int,
	Primary key (member_id)
);

INSERT INTO bubbles (fname, lname, bubbles_popped)
	VALUES
	('Esther', 'Bahr', 10),
	('Landreigh', 'Sparish', 20),
	('Drake', 'Sparish', 200),
	('Jenny', 'Bahr', 15),
	('Rachel', 'Bahr', 35),
	('Chase', 'Sparish', 150),
	('Pistachio', 'Gelattoson', 20),
	
INSERT INTO Ports (port_name, country, capacity)
	VALUES
	('Baltimore', 'United States', 25),
	('Charleston', 'United States', 50),
	('Tampa', 'United States', 10),
	('Miami', 'United States', 15);
	('Fishboy', 'Coldwater', 45);
	
INSERT INTO Ships (ship_name, home_port_id) 
	VALUES
	('Codd Crystal', 1),
	('Codd Elegance', 3),
	('Codd Champion', 4),
	('Codd Victorious', 3),
	('Codd Grandeur', 2),
	('Codd Prince', 2);
	
CREATE TABLE Births (
	Id Int NOT NULL Auto_increment,
	Fname varchar(100),
	Lname varchar(100),
	Birth_year int,
	Birth_place varchar(100),
	Father_Id int,
	Mother_Id int,
	PRIMARY KEY (Id)
);

CREATE TABLE Deaths (
	Fname varchar(100),
	Lname varchar(100),
	Death_year int,
	Death_place varchar(100),
	Birth_Id Int NOT NULL,
	CONSTRAINT FK_BirthId Foreign Key (Birth_Id)
	REFERENCES Births (Id)
);

Alter table Births
Set 

INSERT INTO Births (Fname, Lname, Birth_Year, Birth_place, Father_Id, Mother_Id)
	VALUES
	('Carl', 'Bahr', 1798, 'Daenischenhagen, Germany', null, null);

INSERT INTO Births (Fname, Lname, Birth_Year, Birth_place, Father_Id, Mother_Id)
	VALUES
	('Anna', 'Schultz', 1813, 'Svendborg, Fyn, Denmark', null, null),
	('John', 'Jackson', 1819, 'Tarvin, Cheshire, England', null, null),
	('Mary', 'Joinson', 1819, 'Barra, Cheshire, England', null, null),
	('William', 'Bahr', 1850, 'Eckernfoerde, Germany', 1, 2),
	('Harriet', 'Jackson', 1856, 'Birkenhead, Cheshire, England', 3, 4),
	('William', 'Butt', 1857, 'Malvern, Carroll, Ohio', null, null),
	('Laura', 'Bushman', 1865, 'Lehi, Utah, Utah', null, null),
	('Albert', 'Bahr', 1884, 'Lehi, Utah, Utah', 5, 6),
	('Jessie', 'Butt', 1887, 'Lehi, Utah, Utah', 7, 8),
	('Mormon', 'Miner', 1837, 'Kirtland, Geauga, Ohio', null, null),
	('Phoebe', 'Curtis', 1844, 'Goldens, Point, Hancock, Illinois', null, null),
	('Eli', 'Day', 1856, 'Springville, Utah, Utah', null, null),
	('Eliza', 'Staker', 1860, 'Mount Pleasant, Sanpete, Utah', null, null),
	('Albert', 'Miner', 1865, 'Fairview, Sanpete, Utah', 11, 12),
	('Eliza', 'Day', 1879, 'Mount Pleasant, Sanpete, Utah', 13, 14),
	('Francis', 'Bahr', 1914, 'Lehi, Utah, Utah', 9, 10),
	('Louie Jean', 'Miner', 1915, 'Fairview, Sanpete, Utah', 15, 16),
	('Laurel', 'Miner', 1898, 'Fairview, Sanpete, Utah,', 15, 16),
	('Mark', 'Miner', 1921, 'Fairview, Sanpete, Utah', 15, 16),
	('Ernest', 'Miner', 1923, 'Fairview, Sanpete, Utah', 15, 16);
	
Create Table Marriage (
	Marriage_Id int not null Auto_increment,
	Marriage_year int,
	Marriage_place VARCHAR(100),
	Groom_Id int not null,
	Bride_Id int not null,
	Primary Key (Marriage_Id),
	CONSTRAINT FK_Groom_Id Foreign Key (Groom_Id)
	REFERENCES Births (Id),
	CONSTRAINT FK_Bride_Id Foreign Key (Bride_Id)
	REFERENCES Births (Id)
);
	
INSERT INTO Marriage (Marriage_year, Marriage_place, Groom_Id, Bride_Id)
	VALUES
	(1885, 'Logan, Cache, Utah', 7, 8),
	(1872, 'Lehi, Lehi, Utah', 5, 6), 
	(1861, 'Springville, Utah, Utah', 11, 12),
	(1878, 'St George, Washington, Utah', 13, 14),
	(1897, 'Manti, Sanpete, Utah', 15, 16),
	(1913, 'Salt lake City, Salt Lake, Utah', 9, 10),
	(1936, 'Manti, Sanpete, Utah', 17, 18);
	
Select Fname, Lname, Marriage_place, Marriage_year
From Marriage Inner Join Births
ON Marriage.Groom_Id = Births.Id
UNION
Select Fname, Lname, Marriage_place, Marriage_year
From Marriage Inner Join Births
ON Marriage.Bride_Id = Births.Id
Order by Marriage_year;

Select Marriage_Id, Fname, Lname, Marriage_place, Marriage_year
From Marriage Inner Join Births
ON Marriage.Groom_Id = Births.Id or Marriage.Bride_Id = Births.Id
order by marriage_year
limit 4;

/* 
	Make a table with a person's name, b-day, death day, spouse name
	1. Subquery to Select a spouse's name
*/
insert into deaths (Fname, Lname, Death_year, Death_place, Birth_Id)
	VALUES
	('Carl', 'Bahr', 1852, 'Stohl, Rdbrg.-Ecfrd., Germany', 1),
	('Anna', 'Schultz', 1907, 'Salem, Utah, Utah', 2),
	('John', 'Jackson', 1870, 'Lehi, Utah, Utah', 3),
	('Mary', 'Joinson', 1906, 'Lehi, Utah, Utah', 4),
	('William', 'Bahr', 1885, 'Eureka, Juab, Utah', 5),
	('Harriet', 'Jackson', 1948, 'Lehi, Lehi, Utah', 6),
	('William', 'Butt', 1940, 'Provo, Utah, Utah', 7),
	('Laura', 'Bushman', 1899, 'Lehi, Lehi, Utah', 8),
	('Albert', 'Bahr', 1979, 'Ontario, Malheur, OR', 9),
	('Jessie', 'Butt', 1975, 'Payette, payette, ID', 10),
	('Mormon', 'Miner', 1918, 'Provo, Utah, Utah', 11),
	('Phoebe', 'Curtis', 1905, 'Fairview, Sanpete, Utah', 12),
	('Eli', 'Day', 1943, 'Fairview, Sanpete, Utah', 13),
	('Eliza', 'Staker', 1948, 'Fairview, Sanpete, Utah', 14),
	('Albert', 'Miner', 1944, 'Berkeley, Contra Costa, California', 15),
	('Eliza', 'Day', 1946, 'Salt Lake City, Salt Lake, Utah', 16),
	

/* All the people born in Lehi */
Select Fname, Lname, Death_place from deaths
where death_place like 'Lehi%'
Union all
SELECT Fname, Lname, Birth_place from births
WHERE birth_place like 'Lehi%';

/* All the important info for those born in Utah */
Select DISTINCT Births.Fname, Deaths.Lname, Birth_year, Birth_place, Marriage_year, Marriage_place, Death_year, Death_place
From Births JOIN Deaths ON Births.Id = Deaths.Birth_Id
			Join Marriage ON Births.Id = Marriage.Groom_id OR Births.Id = Marriage.Bride_Id
Where Birth_place LIke '%Utah'
Order By Marriage.Marriage_year;

CREATE TABLE Archived_Cabins (
	Ship_Cabin_id int not null,
	room int,
	window varchar(20),
	sq_ft INT,
	PRIMARY KEY (Ship_cabin_id)
);

CREATE TABLE Utah_Cabins (
	Ship_Cabin_id int not null,
	room int,
	window varchar(20),
	sq_ft INT,
	PRIMARY KEY (Ship_cabin_id)
);

CREATE TABLE La_Cabins (
	Ship_Cabin_id int not null,
	room int,
	window varchar(20),
	sq_ft INT,
	PRIMARY KEY (Ship_cabin_id)
);

/* Look up mysql syntax for insert all 
*/

INSERT ALL 
	INTO Archived_Cabins (Ship_Cabin_id, Room, window, sq_ft)
	VALUES (Ship_Cabin_id, Room, window, sq_ft)
	INTO Utah_Cabins (Ship_Cabin_id, Room, window, sq_ft)
	VALUES (Ship_Cabin_id, Room, window, sq_ft)
	INTO La_Cabins (Ship_Cabin_id, Room, window, sq_ft)
	VALUES (Ship_Cabin_id, Room, window, sq_ft)
Select Ship_Cabin_id, Room, window, sq_ft
FROM ship_cabins;

CREATE TABLE Ship_Cabins (
	Ship_Cabin_id int not null,
	room int,
	window varchar(20),
	sq_ft INT,
	PRIMARY KEY (Ship_cabin_id)
);

INSERT INTO ship_cabins (ship_cabin_id, room, window, sq_ft)
	VALUES
	(1, 102, 'Ocean', 533),
	(2, 103, 'Ocean', 160),
	(3, 104, 'None', 533),
	(4, 105, 'Ocean', 205),
	(5, 106, 'None', 586),
	(6, 107, 'Ocean', 1524);
	

Page 17, in ch 5 sql cert book.

// This joins the groom & bride on the same line
Select 
	(Select Concat(Fname, ' ', Lname)
	from births inner join marriage 
	on births.id = marriage.groom_id
	Where marriage_id IN (1, 3, 5, 7, 9)) AS "Groom Name",
	(Select Concat(Fname, ' ', Lname)
	from births Inner Join marriage
	on births.id = marriage.bride_id
	where marriage_id IN (1, 3, 5, 7, 9)) AS "Bride name",
	marriage_year
from marriage
Where marriage_id = 1 OR 3 or 5 or 7 or 9;

Select marriage_year,
	Concat(Fname, ' ', Lname) AS "Groom Name"
	from births inner join marriage 
	on births.id = marriage.groom_id,
	Concat(Fname, ' ', Lname) AS "Bride Name"
	from births Inner Join marriage
	on births.id = marriage.bride_id,
from marriage;


Select Concat(Fname, ' ', Lname) AS "Groom Name", Concat(Fname, ' ', Lname) AS "Bride Name"
from births inner join marriage M1 on births.id = M1.groom_id
			inner join marriage M2 on births.id = M2.bride_id;

Select marriage_year, Concat(Fname, ' ', Lname) AS "Groom Name"
	from births inner join marriage 
	on births.id = marriage.groom_id;

Select marriage_year, Concat(Fname, ' ', Lname) AS "Bride Name"
from births Inner Join marriage
on births.id = marriage.bride_id;

/* In order to get the groom name and bride name on the same line I did the following:
	1. Created a view with the groom name and marriage year on the same line using a join.
	2. Created a view with the bride name and marraige year on the same line using a join.
	3. Created a view with both names & marriage year using a join based on the previous views.
*/
Create view VW_GROOMS as 
	Select marriage_year, Concat(Fname, ' ', Lname) AS groom_name
	from births inner join marriages 
	on births.id = marriages.groom_id;

CREATE VIEW VW_BRIDES AS
	Select marriage_year, Concat(Fname, ' ', Lname) AS bride_name
	from births Inner Join marriages
	on births.id = marriages.bride_id;
	
CREATE VIEW VW_MARRIAGES AS
Select groom_name as "Groom Name", bride_name AS "Bride Name", G.marriage_year as "Marriage Year"
from vw_grooms G inner join vw_brides B
On G.marriage_year = B.marriage_year;

Select Concat(Fname, ' ', Lname) AS Name, birth_year
from births
order by birth_year desc;

/* How to select max along with the person that goes with it */
Select Fname, Lname, max(birth_year) AS "Min/Max"
from Births
where birth_year = (Select max(birth_year) from births);

Select Fname, Lname, min(birth_year) AS "Min/Max"
from Births
where birth_year = (select min(birth_year) from births);

Select Fname, Lname, max(birth_year) AS "Min/Max"
from Births
where birth_year = (Select max(birth_year) from births)
Union
Select Fname, Lname, min(birth_year) AS "Min/Max"
from Births
where birth_year = (select min(birth_year) from births);

Select id, count(birth_year) count_births
FROM births;

select groom_id, count(marriage_year) count_marriages
from marriages;

Select B.count_births
From (Select id, count(birth_year) count_births
	FROM births) B; 
	
Select B.Fname, B.Lname, B.yrs_old_100
FROM (Select Fname, Lname, birth_year + 100 AS yrs_old_100
	FROM births order by birth_year) B
Order by Fname
limit 5;

Select B.id, B.count_births, M.count_Marriages
From (Select id, count(birth_year) count_births
	FROM births) B
	Join
	(select groom_id, count(marriage_year) count_marriages
	from marriages) M
ON	B.id = M.groom_id;

Select marriage_year, 
	CASE 
		WHEN marriage_id IS NOT NULL
		THEN (Select Concat(Fname, ' ', Lname)AS "Groom Name"
			from births inner join marriage 
			on births.id = marriage.groom_id)
		ELSE 'null'
		END
from marriage;
	

CREATE TABLE PRODUCT_LIST (
	p_id int not null auto_increment,
	p_name varchar(20),
	p_price int,
	PRIMARY KEY (p_id)
);

Create Table Updated_List (
	p_id int not null auto_increment,
	p_name varchar(20),
	p_price int,
	PRIMARY KEY (p_id)
);

insert into product_list (p_name, p_price) 
	VALUES 
	('Tea', 10),
	('Coffe', 15),
	('Biscuit', 20);

insert into Updated_List (p_name, p_price) 
	VALUES 
	('Tea', 10),
	('Coffee', 25),
	('Ice Cream', 12),
	('Chips', 22);
	
Delete from updated_list
Where p_id = 3;

/* Look up MySQL syntax for merge. And dowload the 
SQL*Plus software stuff.
*/

MERGE PRODUCT_LIST AS Target
	USING UPDATE_LIST AS Source
	ON (Target.p_id = Source.p_id)
	WHEN MATCHED
		AND Target.p_name <> source.p_name
		OR Target.p_price <> Source.p_price
	THEN UPDATE	
		SET Target.p_name = Source.P_name
		Target.P_price = Source.P_price
	WHEN NOT MATCHED BY SOURCE
	Then Delete;




MERGE ApplicationTeasm as Target
	USING TempApplicationTeams AS Source
	ON (Target.ServerId = (SELECT ID from Servers WHERE Name='Source.ServerName'))
	WHEN MATCHED THEN
	UPDATE SET Target.Team = Target.Team
	WHEN NOT MATCHED BY TARGET THEN
	INSERT (ServerId, Team) VALUES((SELECT ID from Servers WHERE Name='Source.ServerName') 
		AND Target.Team = Source.Team)
	WHEN NOT MATCHED BY SOURCE THEN	DELETE;
	
	
	Create Table Positions (
	position_id int not null auto_increment,
	position varchar(20),
	reports_to int,
	exempt char(1),
	min_salary double(10, 2),
	max_salery double(10, 2),
	PRIMARY KEY (position_id)
);
	/* The Positions table is supported with a foreign key that points
	 to itself, which is created with this SQL statement: */
	ALTER TABLE Positions
	ADD CONSTRAINT FK_Position Foreign Key (reports_to)
	REFERENCES Positions (position_id);
	
INSERT INTO Positions (Position, Reports_to)
	VALUES 
	('Captain', null),
	('Director', 1),
	('Manager', 2),
	('Crew Chief', 3),
	('Crew', 4);

/* This query finds who is the boss of who. 
*/
SELECT A.POSITION_ID, A.POSITION, B.POSITION BOSS
FROM POSITIONS A LEFT OUTER JOIN POSITIONS B
ON A.REPORTS_TO = B.POSITION_ID
ORDER BY A.POSITION_ID;

CREATE TABLE Members (
	member_id varchar(6) not null,
	first_name varchar(50),
	last_name varchar(50) not null,
	address varchar(50)
);

INSERT INTO Members (member_id, first_name, last_name, address)
	VALUES
	('BAMA85', 'Mark', 'Bahr', '323 S 300 W'),
	('BALY84', 'Lydia', 'Bahr', '323 S 300 W'),
	('ALSO', 'Alma', 'Son of Alma', 'Zarahemla'),
	('HESO', 'Helaman', 'Son of Alma', '464 Ammon St Jershon');
	
/*
	Note that using empty strings as columns works. The space in the
	single quotation marks is valid. You can add characters or a name
	to the column as well, which will display no data (empty).
*/
SELECT member_id, '',first_name,'',last_name "ID FIRSTNAME LASTNAME"
from MEMBERS;

/*
Interval data types don't work with MySQL.  
*/
CREATE TABLE candidates (
	candidate_id int,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	job_title varchar(255) not null,
	year_of_experience interval year to month,
	primary key (candidate_id)
);

CREATE TABLE sales (
	Prod_id int(3),
	cust_id int(3) not null,
	time_id date,
	qty_sold double(10,2),
	primary key (prod_id)
);

CREATE TABLE products (
	Prod_id int(3) Primary Key,
	Prod_name varchar(30),
	prod_list_price double(8 ,2)
);


Alter table sales
Add constraint fk_sales Foreign key (prod_id)
		References products (prod_id);

CONSTRAINT FK_Bride_Id Foreign Key (Bride_Id)
	REFERENCES Births (Id)
	
INSERT INTO PRODUCTS ()
	VALUES
	(100, 'Table Saw', 250.99),
	(101, 'Drywall Knife', 12.79),
	(102, 'Four Wheeler', 7999.99),
	(103, 'Trailer', 2589.89);
	
INSERT INTO SALES ()
	VALUES
	(103, 3, '1999-12-01', 2),
	(100, 4, '2015-10-02', 1),
	(101, 2, '2022-01-02', 3);
	
SELECT p.prod_id, COUNT(s.prod_id)
FROM products p Left Outer Join sales s
ON p.prod_id = s.prod_id
Group by p.prod_id;

INSERT INTO SALES ()
	VALUES
	(100, 5, '1998-12-01', 2),
	(101, 6, '2014-10-02', 1);
	
SELECT p.prod_id, COUNT(s.prod_id)
FROM products p Right Outer Join sales s
ON p.prod_id = s.prod_id
Group by p.prod_id;

SELECT p.prod_id, COUNT(s.prod_id)
FROM products p OUTER Join sales s
ON p.prod_id = s.prod_id
Group by p.prod_id;

CREATE VIEW vw_LifeEvents AS
	Select DISTINCT Births.Fname, Deaths.Lname, Birth_year, Birth_place, Marriage_year, Marriage_place, Death_year, Death_place
	From Births JOIN Deaths ON Births.Id = Deaths.Birth_Id
			Join Marriage ON Births.Id = Marriage.Groom_id OR Births.Id = Marriage.Bride_Id
	Where Birth_place LIke '%Utah'
	Order By Marriage.Marriage_year;

/*  Create user in the database named Harold with RUSSFUSS to identify
	Then, give Harold the ability to connect to the database, and the 
	ability to select & update the Webinars table
*/
CONNECT LISA/ARNOLD;
CREATE USER HAROLD IDENTIFIED BY RUSSFUSS;
GRANT CREATE SESSION TO HAROLD;
GRANT SELECT, UPDATE TO HAROLD ON WEBINARS;

/* 	Login as user: HAROLD. Write a query to get all the data in the 
	Webinars table. Then, change the webinar name to Online Test.

*/
CONNECT HAROLD/RUSSFUSS;
SELECT * FROM LISA.WEBINARS;
UPDATE LISA.WEBINARS SET WEBINAR_NAME = 'ONOLINE TEST';

/*
	If Harold tried to INSERT data into the webinars table, it would give 
	an error and say that he has insufficient privileges. Look above, and 
	we see that Lisa only gave him the select and update privileges on the 
	webinars table, not the insert privilege. 
*/

Create table Tools (
	product_name varchar(100),
	product_price int(11)
);

Create table Tools_2022 (
	product_name varchar(100),
	product_price int(11)
);

Create table Materials (
	product_name varchar(100),
	product_price int(11)
);

Select product_name, product_price
from products
where product_categoryID = 1;

INSERT
	INTO Tools
	VALUES (product_name, product_price)
	Select product_name, product_price
	from products
	where product_categoryID = 1; 

INSERT INTO project1.members
	(member_id, first_name, last_name, birth_year)
	VALUES
	('Yosh56', 'Yoshi', 'Dragon', 1956),
	('Joby10', 'Joel', 'Grow', 1910),
	('Maba21', 'Mark', 'Miner', 1921),
	('FraB14', 'Francis', 'Bahr', 1914);
	
Select Fname, birth_year
FROM births
WHERE birth_year > 1900
MINUS
SELECT first_name, birth_year
FROM project1.members
WHERE birth_year > 1900
ORDER BY birth_year;
	
INSERT INTO marriages (marriage_year, marriage_place, groom_id, bride_id)
	VALUES
	(1941, 'Springerville, AZ', 23, 24),
	(1970, 'Salt Lake City, UT', 25, 26),
	(1973, 'Oakland, CA', 27, 28),
	(2008, 'St. George, UT', 29, 30);
	

/* MySQL does not do invisible columns with the keyword 'invisible'. */

Create Table ship_admin (
	ship_admin_id 		INT,
	SHIP_ID 			INT,
	CONSTRUCTION_COST 	INT	INVISIBLE
);

Select Fname, LName
from births
WHERE Lname IN ('Jackson', 'Bahr', 'Hunt');

Select Fname, LName
from births
WHERE Lname NOT IN ('Jackson', 'Bahr', 'Hunt');

CREATE TABLE Sales_data (
	ID 			int,
	Rep 		varchar(10),
	Year 		int(4),
	Total_sales int
);

INSERT INTO Sales_data (ID, Rep, Year, Total_sales)
	VALUES 
		( 1, 'Joe', 2018, 249),
		( 2, 'Joe', 2017, 178),
		( 3, 'Joe', 2016, 483),
		( 4, 'Ann', 2018, 422),
		( 5, 'Ann', 2017, 427),
		( 6, 'Ann', 2016, 245),
		( 7, 'Moe', 2018, 308),
		( 8, 'Moe', 2017, 721),
		( 9, 'Moe', 2016, 109),
		(10, 'Lyn', 2018, 525),
		(11, 'Lyn', 2017, 589),
		(12, 'Lyn', 2016, 742);

SELECT REP 
FROM sales_data
WHERE year = 2018
AND Total_Sales > (SELECT AVG(Total_sales)
					FROM sales_data
					Where Year = 2017);
					
UPDATE sales_data
	SET Total_sales = (100 + Total_sales)
WHERE TOTAL_sales = (SELECT MAX(Total_sales)
					FROM sales_data
					WHERE Year = 2016);

SELECT MAX(Total_sales)
FROM sales_data
WHERE Year = 2016;
	
/* Add a column to a table in MySQL*/
ALTER TABLE ship_cabins
	ADD ship_id int(7)
	AFTER ship_cabin_id;
	
/* Rename a column*/
ALTER TABLE ship_cabins
	CHANGE room room_number int(11);

/* Add column & specify where with AFTER*/
ALTER TABLE ship_cabins
	ADD Room_style varchar(10)
	AFTER Room_number;
	
Insert into ship_cabins (ship_cabin_id, room_number, room_style, sq_ft)
	VALUES
	(7, 108, 'Stateroom', 211),
	(8, 109, 'Stateroom', 180),
	(9, 110, 'Stateroom', 225),
	(10, 702, 'Suite', 1142),
	(11, 703, 'Suite', 1745),
	(12, 704, 'Suite', 722);
	
Update ship_cabins
set room_style = 'Suite'
WHERE ship_cabin_id IN (1, 3, 5, 6);

Update ship_cabins
set room_style = 'Stateroom'
WHERE ship_cabin_id IN (2, 4);

SELECT avg(sq_ft)
FROM ship_cabins
where room_style = 'Suite';

SELECT avg(sq_ft)
FROM ship_cabins
where room_style = 'Stateroom';

SELECT ship_cabin_id, sq_ft
From ship_cabins
WHERE room_style = 'Stateroom'
	AND sq_ft > (
		SELECT avg(sq_ft)
		FROM ship_cabins
		where room_style = 'Stateroom'
);

SELECT ship_cabin_id, sq_ft
From ship_cabins
WHERE room_style = 'Suite'
	AND sq_ft > (
		SELECT avg(sq_ft)
		FROM ship_cabins
		where room_style = 'Suite'
);

SELECT A.Ship_cabin_id, A.room_style, A.Room_number, A.sq_ft
fROM ship_cabins A
WHERE A.Sq_ft > (SELECT avg(sq_ft)
		FROM ship_cabins
		where room_style = A.Room_style)
Order By A.Room_number;

/* Try using a Coorelated subquery with my geneology database

Find the average age of all the poeple born in Lehi and FAirview
Then find those people whose age is more than that average
*/

Select A.Fname, A.Lname, 2022 - A.Birth_year AS AGE, A.birth_place
FROM Births A
Order by Age;

SELECT B.Fname, B.Lname, B.Age, B.Birth_place
FROM (SELECT Fname, Lname, 2022-Birth_year AS Age, Birth_place
	FROM births) B;

UPdate births
set birth_place = 'Fairview, Sanpete, Utah'
WHERE Fname = 'Laurel';

Create View VW_AGE AS
	SELECT B.Fname, B.Lname, B.Age, B.Birth_place
	FROM (SELECT Fname, Lname, 2022-Birth_year AS Age, Birth_place
	FROM births) B;
	
Select A.Fname, A.Lname, A.Age, A.Birth_place
From Vw_age A
WHERE A.Age > (Select avg(age)
				FROM vw_age
				WHERE birth_place = A.birth_place)
Order by birth_place;

Select avg(age)
from vw_age
Where birth_place LIKE 'Mount%';

CREATE TABLE INVOICES (
	Invoice_id int not null Auto_increment,
	invoice_date DATE,
	account_number varchar(80),
	terms_of_discount varchar(20),
	vendor_id int,
	total_price double(8,2),
	shipping_date date,
	Primary Key (invoice_id)
);

/* MySQL DATE = YYYY-MM-DD*/
Insert into invoices 
(invoice_id, sinvoice_date, account_number, terms_of_discount, vendor_id, total_price, shipping_date)
VALUES
(1, '2019-02-10', '1234', 'Coupon', 12, 129.99, '2019-02-12');

/* To do: try a version of the update statement on pg 7*/

Create Table Tests (
	Student_id int not null,
	Student_name varchar(40),
	exam_1 int,
	exam_2 int,
	Primary Key (student_id)
);

Insert into Tests (Student_id, student_name, exam_1, exam_2)
	VALUES
	(14, 'Albert Einstein', 50, 60),
	(15, 'Thomas Edison', 98, 100),
	(16, 'Benjamin Franklin', 91, 96);
	
Select student_name, exam_1 + exam_2 as "Total Score"
	from tests
	Where (exam_1 + exam_2) > (Select avg(exam_1 + exam_2)
	from tests);
	
Insert into Tests (Student_id, student_name, exam_1, exam_2)
	VALUES
	(17, 'Rubber Blockhead', -5, -10);
	
ALTER TABLE tests
	ADD Extra_curric varchar(30)
	AFTER student_name;
	
UPdate tests
set extra_curric = 'Football'
WHERE (exam_1) > (Select avg(T.exam_2)
	from Tests T);

Insert into Tests (Student_id, student_name, exam_1, exam_2)
	VALUES
	(17, 'George Washington', 88, 92),
	(18, 'Alexander Hamilton', 67, 83);
	
/* get the names of all the students whose test score is above the average
for those in that extracurricular activity. */

Select T.Student_name, T.extra_curric, T.exam_2
From tests T
Where T.exam_1 > (select avg(exam_1)
				FROM Tests
				WHERE extra_curric = T.extra_curric)
Order by T.extra_curric;
	
CREATE TABLE sales (
	order_id int Primary Key,
	product_id int,
	qty int,
	unit_price double(8,2),
	CONSTRAINT fk_prod_id Foreign Key (product_id) REFERENCES products (productID)
);

INsert into sales (order_id, product_id, qty, unit_price)
	VALUES
		(1, 4, 1, 20000.00),
		(2, 7, 3, 90.00),
		(3, 6, 16, 11.00),
		(4, 1, 2, 20.00),
		(5, 9, 2, 7.00),
		(6, 3, 1, 19.00);
		
Select p.product_name, i.item_cnt
FROM (
	Select product_id, Count(*) item_cnt
	FROM sales
	group by product_id)
I right outer join products p
ON i.product_id = p.productID;

Create Table Tests (
	Student_id number not null,
	Student_name varchar2(40),
	exam_1 number,
	exam_2 number,
	Primary Key (student_id)
);

Update Movies
SET director = "John Lasseter"
Where Title = "A Bug's Life";

Update Movies
Set year = 1999
Where Title = "Toy Story 2";

Update Movies
SET director = "Lee Unkrich",
	Title = "Toy Story 3"
Where title = "Toy Story 8";

DELETE FROM mytable
WHERE condition;

Delete from movies
where year < 2005;

Movies table schema
CREATE TABLE movies (
    id INTEGER PRIMARY KEY,
    title TEXT,
    director TEXT,
    year INTEGER, 
    length_minutes INTEGER
);

Create Table DATABASE (
	Name Text,
	Version float,
	Download_count Integer
);

ALTER TABLE Movies
ADD Aspect_ratio float 
    DEFAULT 0;