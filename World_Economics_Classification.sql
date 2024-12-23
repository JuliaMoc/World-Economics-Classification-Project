-- Create a table 
CREATE TABLE world_economics_class (
	country_name VARCHAR (100) PRIMARY KEY,
	un_class_2014 VARCHAR (50),
	imf_class_2023 VARCHAR (50),
	g7 VARCHAR (50),
	eu_member VARCHAR (50),
	fuel_exp_country VARCHAR (50),
	wealth_rank	text,
	gdp_ppp_2022 text,
	gdp_pc_2022 text
);

-- Export and check data
SELECT *
FROM world_economics_class;

-- Check for null values
SELECT *
FROM world_economics_class
WHERE gdp_pc_2022 = 'N/A';

-- Change N/A values to 0
UPDATE world_economics_class
SET gdp_pc_2022 = '0'
WHERE gdp_pc_2022 = 'N/A';

-- Check data
SELECT *
FROM world_economics_class
WHERE gdp_pc_2022 = '0';

-- Change N/A values to 0 for all 
UPDATE world_economics_class
SET gdp_ppp_2022 = '0'
WHERE gdp_ppp_2022 = 'N/A';

UPDATE world_economics_class
SET wealth_rank = '0'
WHERE wealth_rank = 'N/A';

UPDATE world_economics_class
SET un_class_2014 = '0'
WHERE un_class_2014 = 'N/A';

UPDATE world_economics_class
SET imf_class_2023 = '0'
WHERE imf_class_2023 = 'N/A';

-- Change data type for gdp_ppp_2022, gdp_pc_2022, wealth_rank into numeric/int
ALTER TABLE world_economics_class
ALTER COLUMN gdp_ppp_2022 TYPE numeric
USING gdp_ppp_2022::numeric;

ALTER TABLE world_economics_class
ALTER COLUMN gdp_pc_2022 TYPE numeric
USING gdp_pc_2022::numeric;

ALTER TABLE world_economics_class
ALTER COLUMN wealth_rank TYPE int
USING wealth_rank::int;

-- Create a new column continents for a more detailed visualisation
ALTER TABLE world_economics_class
ADD continents VARCHAR(100);

-- Add europe
UPDATE world_economics_class
SET continents = 'Europe'
WHERE country_name in ('Luxembourg', 'Ireland', 'Norway', 'Switzerland', 'Denmark', 'Netherlands', 'Iceland', 'Austria', 'Belgium', 'Sweden', 'Germany', 'Finland', 'Malta', 'France', 'United Kingdom', 'Italy', 'Slovenia', 'Czech Republic', 'Cyprus', 'Lithuania', 'Estonia', 'Spain', 'Poland', 'Hungary', 'Romania', 'Portugal', 'Croatia', 'Latvia', 'Slovakia', 'Greece', 'Bulgaria', 'Montenegro', 'Serbia', 'Belarus', 'Bosnia and Herzegovina', 'Macedonia', 'Georgia', 'Albania', 'Moldova', 'Ukraine', 'Lichtenstein', 'Monaco', 'San Marino', 'Andorra', 'Channel Islands', 'Faroe Islands', 'Isle of Man');

-- Add africa
UPDATE world_economics_class
SET continents = 'Africa'
WHERE country_name in ('Mauritius', 'Libya', 'Botswana', 'Equitorial Guinea', 'Gabon', 'South Africa', 'Egypt', 'Algeria', 'Tunisia', 'Namibia', 'Morocco', 'Cabo Verde', 'Angola', 'Côte d’Ivoire', 'Ghana', 'Mauritania', 'Nigeria', 'Kenya', 'Sao Tome and Prinicipe', 'Cameroon', 'Sudan', 'Senegal', 'Benin', 'Zambia', 'Comoros', 'Congo', 'Guinea', 'Tanzania', 'Ethiopia', 'Rwanda', 'Lesotho', 'Uganda', 'Togo', 'Burkina Faso', 'Zimbabwe', 'Mali', 'Gambia', 'Guinea-Bissau', 'Sierra Leone', 'Madagascar', 'Malawi', 'Liberia', 'Chad', 'Niger', 'Mozambique', 'Democratic Republic of Congo', 'Central African Republic', 'Burundi', 'Djibouti', 'Eritrea', 'Somalia', 'South Sudan', 'Seychelles', 'Eswatini');

-- Add asia
UPDATE world_economics_class
SET continents = 'Asia'
WHERE country_name in ('Singapore', 'Qatar', 'United Arab Emirates (UAE)', 'Brunei Darussalam', 'Hong Kong SAR', 'Bahrain', 'Saudi Arabia', 'Kuwait', 'Macao SAR', 'South Korea', 'Israel', 'Japan', 'Oman', 'Türkiye (Turkey)', 'Russian Federation (Russia)', 'Malaysia', 'Kazakhstan', 'China', 'Thailand', 'Armenia', 'Iran (Islamic Republic of)', 'Azerbijan', 'Indonesia', 'Sri Lanka', 'Mongolia', 'Viet Nam (Vietnam)', 'Jordan', 'Iraq', 'Philippines', 'Uzbekistan', 'India', 'Bangladesh', 'Pakistan', 'Kyrgyzstan', 'Tajikistan','Myanmar', 'Timor-Leste', 'Nepal', 'Turkmenistan', 'Lebanon', 'Syrian Arab Republic (Syria)', 'Taiwan', 'Yemen', 'Lao P.D.R. (Laos)', 'Palestine (State Of)', 'Afghanistan', 'Bhutan', 'Maldives');

-- Add oceania
UPDATE world_economics_class
SET continents = 'Oceania'
WHERE country_name in ('Australia', 'Aoeteroa (New Zealand)', 'Papua New Guinea', 'Northern Mariana Islands', 'Palau', 'Fiji', 'Samoa', 'Tuvalu', 'Vanuatu', 'Solomon Islands', 'Kiribati', 'Nauru', 'Marshall Islands', 'Micronesia', 'American Samoa', 'Guam');

-- Add north america
UPDATE world_economics_class
SET continents = 'North America'
WHERE country_name in ('United States', 'Canada', 'Panama', 'Costa Rica', 'Dominican Republic', 'Mexico', 'Barbados', 'Jamaica', 'El Salvador', 'Guatemala', 'Nicaragua', 'Honduras', 'Haiti', 'Cuba', 'Puerto Rico (US)', 'Bahamas', 'St. Kitts and Nevis', 'Antigua and Barbuda', 'St. Lucia', 'St. Vincent and the Grenadines', 'Dominica', 'Belize', 'Grenada', 'Bermuda', 'Cayman Islands', 'Greenland');

-- Add south america
UPDATE world_economics_class
SET continents = 'South America'
WHERE country_name in ('Guyana', 'Chile', 'Uruguay', 'Trinidad and Tobago', 'Argentina', 'Colombia', 'Brazil', 'Paraguay', 'Peru', 'Ecuador', 'Bolivia (Plurinational State of)', 'Venezuela (Bolivarian Republic of)', 'Suriname', 'Aruba');

-- Check table
SELECT *
FROM world_economics_class;

-- Simple aggregate functions and data exploratory 

-- Max. per capita
SELECT MAX(gdp_pc_2022) max_per_capita
FROM world_economics_class;

-- Min. per capita
SELECT MIN(gdp_pc_2022) min_per_capita
FROM world_economics_class
WHERE gdp_pc_2022 > 0;

-- Avg. per capita
SELECT ROUND(AVG(gdp_pc_2022), 2) avg_per_capita
FROM world_economics_class;

-- Per capita per continent
SELECT continents,
	SUM(gdp_pc_2022) total_per_capita
FROM world_economics_class
GROUP BY continents;

-- Count of none eu member
SELECT COUNT (eu_member) count_none_eu_member
FROM world_economics_class
WHERE eu_member = 'No';

-- Count of eu member
SELECT COUNT (eu_member) count_eu_member
FROM world_economics_class
WHERE eu_member = 'Yes';

-- Check count of g7
SELECT COUNT (g7) check_g7
FROM world_economics_class
WHERE g7 = 'Yes';

-- Count of advanced country's by imf_class_2023
SELECT COUNT (imf_class_2023) imf_advanced
FROM world_economics_class
WHERE imf_class_2023 = 'Advanced';

-- All developed and advanced country's
SELECT *
FROM world_economics_class
WHERE un_class_2014 = 'Developed' AND imf_class_2023 = 'Advanced';

-- All developed country's
SELECT *
FROM world_economics_class
WHERE un_class_2014 LIKE 'Developed';

-- Window functions and subquerys

-- Country with highest per capita
SELECT *
FROM (
	SELECT 
		country_name, 
		gdp_pc_2022,
		MAX (gdp_pc_2022) OVER () highest_per_capita
	FROM world_economics_class
)t WHERE gdp_pc_2022 = highest_per_capita;

-- Country with the highest per capita
SELECT 
	country_name, 
	gdp_pc_2022,
	RANK () OVER (ORDER BY gdp_pc_2022 DESC) rank_per_capita 
FROM world_economics_class;

-- Rank per capita by continent
SELECT 
	country_name, 
	gdp_pc_2022,
	continents,
	RANK () OVER (PARTITION BY continents ORDER BY gdp_pc_2022 DESC) rank_per_capita_by_continent
FROM world_economics_class;

-- Rank per capita by continent only top 1
SELECT *
FROM (
	SELECT 
		country_name, 
		gdp_pc_2022,
		continents,
		RANK () OVER (PARTITION BY continents ORDER BY gdp_pc_2022 DESC) per_capita_top_1_by_continent
	FROM world_economics_class
)t WHERE per_capita_top_1_by_continent = 1;

-- Avergage overview per country and continent
SELECT
	country_name,
	continents,
	gdp_pc_2022,
	AVG (gdp_pc_2022) OVER () avg_per_capita,
	AVG (gdp_pc_2022) OVER (PARTITION BY continents) avg_per_capita_continents
FROM world_economics_class;

-- Countrys with per capita above average 
SELECT *
FROM(
	SELECT
		country_name,
		gdp_pc_2022,
		AVG (gdp_pc_2022) OVER () avg_per_capita
	FROM world_economics_class
)t WHERE gdp_pc_2022 > avg_per_capita;

-- Country with the highest gdp ppp
SELECT 
	country_name, 
	gdp_ppp_2022,
	RANK () OVER (ORDER BY gdp_ppp_2022 DESC) rank_gdp_ppp
FROM world_economics_class;

-- EU member wealth rank 
SELECT 
	country_name,
	RANK () OVER (ORDER BY wealth_rank) rank_wealth_eu_member 
FROM world_economics_class
WHERE eu_member = 'Yes';

-- Fuel export rank by per capita
SELECT 
	country_name,
	gdp_pc_2022,
	RANK () OVER (ORDER BY gdp_pc_2022 DESC) rank_fuel_exp 
FROM world_economics_class
WHERE fuel_exp_country = 'Yes';

-- See g7 country's ranked by per capita
SELECT 
	country_name,
	gdp_pc_2022,
	RANK () OVER (ORDER BY gdp_pc_2022 DESC) rank_g7 
FROM world_economics_class
WHERE g7 = 'Yes';

-- Per capita per continent with detailed list of per capita by country
SELECT
	continents,
	country_name,
	gdp_pc_2022,
	SUM(gdp_pc_2022) OVER (PARTITION BY continents) total_pc_by_continent
FROM world_economics_class;

-- Create 3 categories: high, medium, low per capita
SELECT *,
CASE WHEN category = 1 THEN 'High Per Capita'
	 WHEN category = 2 THEN 'Medium Per Capita'
	 WHEN category = 3 THEN 'Low Per Capita'
END per_capita_categories
FROM (
	SELECT
		country_name,
		gdp_pc_2022,
		NTILE(3) OVER (ORDER BY gdp_pc_2022 DESC) category
	FROM world_economics_class
)t;

-- Highest 20% per capita rank
SELECT *,
CONCAT (top_20 * 100, '%') top_20_percentage
FROM (
	SELECT
		country_name,
		gdp_pc_2022,
		CUME_DIST() OVER (ORDER BY gdp_pc_2022 DESC) top_20
	FROM world_economics_class
)t WHERE top_20 <= 0.2;

-- Deleting countrys with '0' gdp per capita
DELETE FROM world_economics_class
WHERE country_name IN ('Afghanistan', 'American Samoa', 'Aruba', 'Bermuda', 'Bhutan', 'Cayman Islands', 'Channel Islands', 'Cuba', 'Djibouti', 'Eritrea', 'Faroe Islands', 'Greenland', 'Guam', 'Isle of Man', 'Lebanon', 'Lichtenstein', 'Monaco', 'Nauru', 'Northern Mariana Islands', 'Palau', 'Puerto Rico (US)', 'San Marino', 'Somalia', 'South Sudan', 'Syrian Arab Republic (Syria)', 'Taiwan', 'Turkmenistan', 'Venezuela (Bolivarian Republic of)', 'Yemen');