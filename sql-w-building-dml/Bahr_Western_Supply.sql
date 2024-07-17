/*
    Name: Mark Bahr
    Project: Western Supply Customer Spending
    Skill: Use PostgreSQL to 
        - Import data using simple CREATE TABLE and COPY statements
        - Add new columns and use UPDATE to set values, then drop a column
        - Filter, group and sort data using WHERE, GROUP BY and ORDER BY
*/
--------------------------------------------------------------------
/*	                Create Database	  	                  */
--------------------------------------------------------------------
-- Create databse for Western Cycling
CREATE DATABASE western_supply;

--------------------------------------------------------------------
/*	           Drop Table  		 	                  */
--------------------------------------------------------------------
-- Drop the customer_spending table if it exists.
DROP TABLE IF EXISTS product_sales;

--------------------------------------------------------------------
/*                Table Creation	                          */
--------------------------------------------------------------------

-- Create the table with appropriate data types for the data in the csv file.
CREATE TABLE product_sales (
    transaction_id varchar(8) PRIMARY KEY,
    sale_date date,
    year int,
    month varchar(9),
    gender char(1),
    age int,
    state varchar(150),
    country varchar(100),
    sub_category varchar(100),
    product_category varchar(100),
    quantity int,
    unit_price numeric(16,6),
    unit_cost numeric(16,6),
    revenue numeric(12,2),
    cost numeric(12,2)
);

--------------------------------------------------------------------

--------------------------------------------------------------------
/*	              Import Data      	  		          */
--------------------------------------------------------------------

-- Execute a copy statement to bring the data into the database
COPY product_sales
FROM 'C:\Users\Public\data\product_sales.csv'
WITH (FORMAT CSV, HEADER);

--------------------------------------------------------------------

--------------------------------------------------------------------
/*              Confirm Data Correctly Imported	                  */
--------------------------------------------------------------------
-- Check number of rows. (Should be 69,732)
SELECT COUNT(*) FROM product_sales;

-- Check that we correctly imported the column names with data
SELECT * FROM product_sales limit 10;


--------------------------------------------------------------------
/*	            Query 1: Top Revenue States       	          */
--------------------------------------------------------------------
-- Write a query to return the 5 states that have the highest average revenues.
SELECT state, round(avg(revenue),2) top_sales
FROM product_sales
GROUP BY state
ORDER BY top_sales DESC
LIMIT 5;

--------------------------------------------------------------------
/*                   Query 2: Unit Cost Ranges                    */
--------------------------------------------------------------------
-- Write a query that returns the minimum and maximum unit_price and minimum and maximum unit_cost for each sub_category for the year of 2016.
SELECT sub_category, min(unit_price) min_unit_price, max(unit_price) max_unit_price, 
        min(unit_cost) min_unit_cost, max(unit_cost) max_unit_cost
FROM product_sales
WHERE year = 2016
GROUP BY sub_category
order by sub_category;

--------------------------------------------------------------------
/*	             Query 3: Average Margin     	          */
--------------------------------------------------------------------
-- Write a query that returns a list of sub_categories and their corresponding average revenue, average cost, as well as the difference between these two values (margin) for the year 2015. Organize the results by average margin in descending order.
SELECT  sub_category, 
        round(avg(revenue), 2) avg_revenue, 
        round(avg(cost), 2) avg_cost, 
        round((avg(revenue)-avg(cost)), 2) avg_margin
FROM product_sales
WHERE year = 2016
GROUP BY sub_category
ORDER BY avg_margin DESC;

--------------------------------------------------------------------
/*	         Add & Update unit_margin Column  	         */
--------------------------------------------------------------------

-- Add a margin column
ALTER TABLE product_sales
ADD COLUMN unit_margin NUMERIC(16, 6);

-- Update the values of that margin column
UPDATE product_sales
SET unit_margin = (unit_price - unit_cost);

--------------------------------------------------------------------
/*	            Query 4: Greatest Margin    	          */
--------------------------------------------------------------------

-- Query to see the transactions with greatest unit_margin
SELECT sale_date, sub_category, unit_margin
FROM product_sales
ORDER BY unit_margin DESC
LIMIT 10;

--------------------------------------------------------------------
/*	       	   Add & Update age_category Column	          */
--------------------------------------------------------------------

-- Add a age_category column
ALTER TABLE product_sales
ADD COLUMN age_category VARCHAR(20);

-- UPDATE the values of the age_category column with  categories
-- 65+ are Senior, 45-64 are Middle aged, 30-44 are Adult
-- 20-29 are Young Adult, 19 and under are Adolescent
UPDATE product_sales
SET age_category = CASE
        WHEN age > 64 THEN 'Senior'
        WHEN age BETWEEN 45 AND 64 THEN 'Middle Aged'
        WHEN age BETWEEN 30 AND 44 THEN 'Adult'
        WHEN age < 20 THEN 'Adolescent'
        ELSE 'Young Adult'
        END;

--------------------------------------------------------------------
/*	            Confirm age_category Correct       	          */
--------------------------------------------------------------------

-- Check age categories are correct.
SELECT age_category, min(age) min_age, max(age) max_age
FROM product_sales
GROUP BY age_category
ORDER BY min(age)
limit 10;

--------------------------------------------------------------------
/*       Query 5: unit_margin by age & product categories         */
--------------------------------------------------------------------
-- Write a query to determine the highest unit_margin, lowest unit_mergin, and average unit_margin for each age and product category. Sort the results by age_category and then product_category.
SELECT  age_category, product_category, round(max(unit_margin), 2) high_margin, 
        round(min(unit_margin), 2) low_margin, round(avg(unit_margin), 2) avg_margin
FROM product_sales
GROUP BY age_category, product_category
ORDER BY age_category, product_category;

--------------------------------------------------------------------
/*	   Query 6: Power Tools by Age & Gender		          */
--------------------------------------------------------------------
-- Write a query that returns the total number of buyers for each gender and age category who bought power tools.
SELECT gender, age_category, COUNT(gender)
FROM product_sales
WHERE sub_category = 'Power Tools'
GROUP BY gender, age_category
order by gender, 3;

--------------------------------------------------------------------
/*	                Drop age_category Column       	          */
--------------------------------------------------------------------
-- Drop the age_category column
ALTER TABLE product_sales
DROP COLUMN age_category;

--------------------------------------------------------------------
/*	                Confirm age_category Dropped     	  */
--------------------------------------------------------------------
SELECT * FROM product_sales limit 2;

--------------------------------------------------------------------
/*	            Query 7: Average Cost     		          */
--------------------------------------------------------------------
-- Write a query that returns a list of sub_categories along with their average quantity and average cost, as well as the country. Only include sub_categories that have at least 500 records in the data set. Organize the data by average cost in descending order.
SELECT country, product_category, round(avg(quantity), 2) avg_quantity, round(avg(revenue), 2) avg_revenue, round(avg(cost), 2) avg_cost
FROM product_sales
GROUP BY country, product_category
HAVING count(country) > 500
ORDER BY country, product_category;



