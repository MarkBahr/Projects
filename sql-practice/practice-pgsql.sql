/* 
See https://www.postgresqltutorial.com/
*/

CREATE DATABASE mydatabase;

CREATE TABLE inv(
    invno SERIAL PRIMARY KEY
);

/* 
dATE FORMAT: 'yyyy-MM-DD'

command: \dt 
This command shows tables in the current database.
\dt+ gives even more information.
*/

ALTER TABLE table_name
ADD COLUMN column_name datatype column_constraint;

ALTER TABLE inv
ADD COLUMN buy_date VARCHAR(20);

ALTER TABLE inv
RENAME COLUMN buy_date TO product;

ALTER TABLE inv
ADD COLUMN buy_date DATE;

INSERT INTO inv (product, buy_date)
VALUES
('Hammer', '2022-04-24'),
('Drywall Knife', '2022-06-12'),
('Chain Saw', '2023-05-15');

ALTER TABLE inv
ADD COLUMN p_weight NUMERIC(6,5);

update inv
set p_weight = 0.7
where invno = 1;

update inv
set p_weight = .5
where invno = 2;

update inv
set p_weight = 1.23
where invno = 3;

create table num(
    my_num float(5),
    ur_num numeric(5)
);

INSERT INTO num (my_num, ur_num)
VALUES
(1.5, 1.5),
(23.456, 23.456),
(0.7, 0.7);

INSERT INTO num (my_num, ur_num)
VALUES
(45.23, 234534.098);


CREATE DATABASE alpha_computer;

CREATE TABLE customers(
    cust_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number VARCHAR(10),
    email VARCHAR(100)
);

CREATE TABLE inventory(
    model_num BIGSERIAL PRIMARY KEY,
    quantity BIGINT,
    status BOOLEAN,
    price NUMERIC(7,2)
);

CREATE TABLE service_requests(
    request_id SERIAL PRIMARY KEY,
    cust_id INTEGER, 
    init_date DATE NOT NULL,
    complete_date DATE,
    amount NUMBER(9,2),
    status BOOLEAN,
    CONSTRAINT fk_cust_req FOREIGN KEY (cust_id)
        REFERENCES customers (cust_id)
);

CREATE TABLE ckeck_const (
    id serial,
    brightness varchar(12) CHECK (brightness IN ('Dim', 'Bright', 'Ultra-bright'))
);

INSERT INTO ckeck_const (brightness)
VALUES
('Dim'),
('Bright'),
('Ultra-bright');

INSERT INTO ckeck_const (brightness)
VALUES
('Dimmest');

Select s.id, c.title, s.sec_id
FROM TAKES t    JOIN student s ON t.id = s.id
                JOIN course c ON t.course_id = c.course_id
                JOIN section s ON t.sec_id = s.sec_id
ORDER BY c.title;


create table grade (
    s_id int PRIMARY KEY,
    Fname varchar(20)
);


create table test1 (
    test_id int,
    s_id int,
    score numeric(5,2),
    CONSTRAINT fk_s_id FOREIGN KEY (s_id)
        REFERENCES grade (s_id) ON DELETE SET NULL
);

INSERT INTO grade (s_id, Fname)
VALUES
(1, 'Mark'),
(2, 'Lydia');

INSERT INTO test1 (test_id, s_id, score)
VALUES
(10, 1, 89.5),
(11, 2, 95.9);

DELETE FROM grade
WHERE s_id = 1;

-- This command caused only that column to be set null, the rest of the row remains. 

-- What if we do ondelete cascade? Will it delete the entire record?
create table test1 (
    test_id int,
    s_id int,
    score numeric(5,2),
    CONSTRAINT fk_s_id FOREIGN KEY (s_id)
        REFERENCES grade (s_id) ON DELETE CASCADE
);

-- Yep, deleting in the parent table deleted the entire row from the child table
-- So, On delete cascade will delete the entire row, set null will just set null that one value in the row. 

CREATE TABLE meat_poultry_egg_establishments (
    establishment_number text CONSTRAINT est_number_key PRIMARY KEY, 
    company text, 
    street text, 
    city text, 
    st text, 
    zip text, 
    phone text, 
    grant_date date, 
    activities text, 
    dbas text
);

COPY meat_poultry_egg_establishments
FROM 'C:\YourDirectory\MPI_Directory_by_Establishment_Name.csv'
WITH (FORMAT CSV, HEADER);

CREATE INDEX company_idx ON meat_poultry_egg_establishments (company);

-- lOOKING FOR Null values
SELECT st, count(*) AS st_count
FROM meat_poultry_egg_establishments
GROUP BY st
ORDER BY st;

-- Using IS NULL to find missing values in the st column
SELECT establishment_number, company, city, st, zip
FROM meat_poultry_egg_establishments
WHERE st IS NULL;

-- We'll update, but before we update, well create a copy of the column (extra caution) so we have the original dota
ALTER TABLE meat_poultry_egg_establishments
ADD COLUMN st_copy text;

UPDATE meat_poultry_egg_establishments
SET st_copy = st;

-- Next, check to confirm values were copied properly.
SELECT company, count(*) AS company_count
FROM meat_poultry_egg_establishments
GROUP BY company
ORDER BY company ASC;




-- He makes a list of items to fix, each 



-- ALTER TABLE SYNTAX
ALTER TABLE table_name
-- Add a column 
ADD COLUMN column_name datatype
-- Change the data type of a column
ALTER COLUMN column_name SET DATA TYPE datatype
-- Set not null
ALTER COLUMN column_name SET NOT NULL
-- Set so you can include null values
COLUMN column_name DROP NOT NULL

ALTER TABLE table_name
DROP COLUMN column_name;


--UPDATE TABLE SYNTAX
UPDATE table_name
SET column_name = value
WHERE condition



-- EXAMPLES


UPDATE table
SET column = table_b.column
FROM table_b
WHERE table.column = table_b.column;

UPDATE location
SET city = 




UPDATE table
SET column = (SELECT column FROM table_b WHERE table.column = table_b.column)
WHERE EXISTS (SELECT column FROM table_b WHERE table.column = table_b.column);


UPDATE ds_salaries DS1
SET DS1.city = SPLIT_PART(DS1.location, ',', 1);



'AK', 'AL', 'AR', 'AS', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'GA', 'GU', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 'MP', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UM', 'UT', 'VA', 'VI', 'VT', 'WA', 'WI', 'WV', 'WY'


-- Code for country in Assignment 6

 -- Make a new column called country
    ALTER TABLE ds_salaries
    ADD COLUMN country VARCHAR(100);

    -- Copy the country values into the new country column
    UPDATE ds_salaries
    SET country = SPLIT_PART(location, ', ', 3);

    
    SELECT country, count(country)
    from ds_salaries
    WHERE country = ''
    group by country
    order by country;

    SELECT country, location
    from ds_salaries
    WHERE COUNTRY = '' AND
    state NOT IN ('AK', 'AL', 'AR', 'AS', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 
    'FL', 'GA', 'GU', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 
    'MD', 'ME', 'MI', 'MN', 'MO', 'MP', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 
    'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'PR', 'RI', 'SC', 'SD', 
    'TN', 'TX', 'UM', 'UT', 'VA', 'VI', 'VT', 'WA', 'WI', 'WV', 'WY');

    -- Make sure that all the values where country is null
    -- are from teh U.S. so that you can add country as U.S.