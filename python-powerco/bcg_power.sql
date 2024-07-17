/*
Forage BCG Data Science Class - Analytics Section
Name: Mark Bahr

*/



-- Drop Statement
DROP TABLE IF EXISTS client_data;

--------------------------------------------------------------------------------

CREATE TABLE client_data (
    id varchar,
    channel_sales VARCHAR,
    cons_12m INT,
    cons_gas_12m INT,
    cons_last_month INT,
    date_activ DATE,
    date_end DATE,
    date_modif_prod DATE, 
    date_renewal DATE, 
    forecast_cons_12m NUMERIC,
    forecast_cons_year INT,
    forecast_discount_energy NUMERIC,
    forecast_meter_rent_12m NUMERIC,
    forecast_price_energy_off_peak NUMERIC,
    forecast_price_energy_peak NUMERIC,
    forecast_price_pow_off_peak NUMERIC,
    has_gas CHAR,
    imp_cons NUMERIC,
    margin_gross_pow_ele NUMERIC,
    margin_net_pow_ele NUMERIC,
    nb_prod_act INT,
    net_margin NUMERIC,
    num_years_antig INT,
    origin_up VARCHAR,
    pow_max NUMERIC,
    churn INT
);

--------------------------------------------------------------------------------
/*				                 Import Data           		  		          */
--------------------------------------------------------------------------------

COPY client_data
FROM 'C:\Users\Public\data\client_data.csv'
WITH (FORMAT CSV, HEADER);


-- Talbe Creation for prices

-- Drop Statement
DROP TABLE IF EXISTS price_data;

CREATE TABLE price_data (
id VARCHAR,
price_date date,
price_off_peak_var NUMERIC,
price_peak_var NUMERIC,
price_mid_peak_var NUMERIC,
price_off_peak_fix NUMERIC,
price_peak_fix NUMERIC,
price_mid_peak_fix NUMERIC
);

COPY price_data
FROM 'C:\Users\Public\data\price_data.csv'
WITH (FORMAT CSV, HEADER);


select price_date, avg(price_peak_fix), avg(price_peak_var)
from price_data
group by price_date
order by 2;

-- Select the min and max dates for date_activ
select min(distinct(date_activ)), max(distinct(date_activ))
from client_data
order by 1;

-- Select the customers with end dates between
-- This shows 2757 distince rows
SELECT id, date_end
from client_data
where date_end BETWEEN '2016-01-01' AND '2016-03-31';

-- How many unique customers
-- Client lists 12 months for 14--- customers
-- Price lists 
Select id, min(price_off_peak_var), max(price_off_peak_var), avg(price_off_peak_var), count(distinct(price_off_peak_var))
from price_data
GROUP BY id
order by 4;

Select min(), max(), avg(), count(distinct())
from price_data;

Select min(), max(), avg(), count(distinct())
from price_data;

Select min(), max(), avg(), count(distinct())
from price_data;

Select id, avg(price_off_peak_fix), avg(price_peak_fix)
from price_data
GROUP BY id
having avg(price_peak_fix) > avg(price_off_peak_fix);

select id, price_off_peak_fix, price_peak_fix
from price_data
where price_date = '2015-09-01' AND (price_peak_fix > price_off_peak_fix);
