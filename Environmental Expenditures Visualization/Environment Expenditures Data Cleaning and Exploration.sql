-- Data cleaning and exploration for environmental expenditures in SQL

-- Description: To provide properly formatted and applicable data for visualization, 
-- data cleaning will be performed on 4 environmental expenditure related datasets.
-- After cleaning the datasets, queries are used for data exploration to glean relevant information. 
-- The following SQL code is written in PostgreSQL syntax.


-- Environmental Protection Expenditures Dataset

select * from environmental_expenditures

-- Data Cleaning
-- Drop unnecessary columns
alter table environmental_expenditures
drop column "Source",
drop column "CTS_Code",
drop column "CTS_Name",
drop column "CTS_Full_Descriptor";

-- update indicator column to change "n.e.c." to "not elsewhere classified" in the 
-- "Expenditure on environmental protection n.e.c." indicator
Select "Indicator", case when "Indicator" = 'Expenditure on environmental protection n.e.c.' 
THEN 'Environmental expenditure not elsewhere classified' else "Indicator" end
from environmental_expenditures
group by "Indicator";

update environmental_expenditures
set "Indicator" = case when "Indicator" = 'Expenditure on environmental protection n.e.c.' 
THEN 'Environmental expenditure not elsewhere classified' else "Indicator" end;

-- Add column with average annual expenditures, this would likely have been easier to perform in Excel,
-- but to explore the applicability of SQL for data cleaning, the code is provided below
select "Country", "Unit", (coalesce("F1995", 0) + coalesce("F1996", 0) + coalesce("F1997", 0) + coalesce("F1998", 0) + coalesce("F1999", 0) + 
coalesce("F2000", 0) + coalesce("F2001", 0) + coalesce("F2002", 0) + coalesce("F2003", 0) + coalesce("F2004", 0) + 
coalesce("F2005", 0) + coalesce("F2006", 0) + coalesce("F2007", 0) + coalesce("F2008", 0) + coalesce("F2009", 0) + 
coalesce("F2010", 0) + coalesce("F2011", 0) + coalesce("F2012", 0) + coalesce("F2013", 0) + coalesce("F2014", 0) + 
coalesce("F2015", 0) + coalesce("F2016", 0) + coalesce("F2017", 0) + coalesce("F2018", 0) + coalesce("F2019", 0) + 
coalesce("F2020", 0) + coalesce("F2021", 0) + coalesce("F2022", 0)) / nullif(case when "F1995" is null then 0 else 1 end +
case when "F1996" is null then 0 else 1 end + case when "F1997" is null then 0 else 1 end + 
case when "F1998" is null then 0 else 1 end + case when "F1999" is null then 0 else 1 end +
case when "F2000" is null then 0 else 1 end + case when "F2001" is null then 0 else 1 end + 
case when "F2002" is null then 0 else 1 end + case when "F2003" is null then 0 else 1 end +
case when "F2004" is null then 0 else 1 end + case when "F2005" is null then 0 else 1 end + 
case when "F2006" is null then 0 else 1 end + case when "F2007" is null then 0 else 1 end +
case when "F2008" is null then 0 else 1 end + case when "F2009" is null then 0 else 1 end + 
case when "F2010" is null then 0 else 1 end + case when "F2011" is null then 0 else 1 end +
case when "F2012" is null then 0 else 1 end + case when "F2013" is null then 0 else 1 end + 
case when "F2014" is null then 0 else 1 end + case when "F2015" is null then 0 else 1 end +
case when "F2016" is null then 0 else 1 end + case when "F2017" is null then 0 else 1 end + 
case when "F2018" is null then 0 else 1 end + case when "F2019" is null then 0 else 1 end +
case when "F2020" is null then 0 else 1 end + case when "F2021" is null then 0 else 1 end + 
case when "F2022" is null then 0 else 1 end, 0) as average_expenditures
from environmental_expenditures
order by "Unit", "Country";

alter table environmental_expenditures
add average_expenditures DECIMAL(20, 4);

update environmental_expenditures
set average_expenditures = (coalesce("F1995", 0) + coalesce("F1996", 0) + coalesce("F1997", 0) + coalesce("F1998", 0) + coalesce("F1999", 0) + 
coalesce("F2000", 0) + coalesce("F2001", 0) + coalesce("F2002", 0) + coalesce("F2003", 0) + coalesce("F2004", 0) + 
coalesce("F2005", 0) + coalesce("F2006", 0) + coalesce("F2007", 0) + coalesce("F2008", 0) + coalesce("F2009", 0) + 
coalesce("F2010", 0) + coalesce("F2011", 0) + coalesce("F2012", 0) + coalesce("F2013", 0) + coalesce("F2014", 0) + 
coalesce("F2015", 0) + coalesce("F2016", 0) + coalesce("F2017", 0) + coalesce("F2018", 0) + coalesce("F2019", 0) + 
coalesce("F2020", 0) + coalesce("F2021", 0) + coalesce("F2022", 0)) / nullif(case when "F1995" is null then 0 else 1 end +
case when "F1996" is null then 0 else 1 end + case when "F1997" is null then 0 else 1 end + 
case when "F1998" is null then 0 else 1 end + case when "F1999" is null then 0 else 1 end +
case when "F2000" is null then 0 else 1 end + case when "F2001" is null then 0 else 1 end + 
case when "F2002" is null then 0 else 1 end + case when "F2003" is null then 0 else 1 end +
case when "F2004" is null then 0 else 1 end + case when "F2005" is null then 0 else 1 end + 
case when "F2006" is null then 0 else 1 end + case when "F2007" is null then 0 else 1 end +
case when "F2008" is null then 0 else 1 end + case when "F2009" is null then 0 else 1 end + 
case when "F2010" is null then 0 else 1 end + case when "F2011" is null then 0 else 1 end +
case when "F2012" is null then 0 else 1 end + case when "F2013" is null then 0 else 1 end + 
case when "F2014" is null then 0 else 1 end + case when "F2015" is null then 0 else 1 end +
case when "F2016" is null then 0 else 1 end + case when "F2017" is null then 0 else 1 end + 
case when "F2018" is null then 0 else 1 end + case when "F2019" is null then 0 else 1 end +
case when "F2020" is null then 0 else 1 end + case when "F2021" is null then 0 else 1 end + 
case when "F2022" is null then 0 else 1 end, 0);

SELECT "Country", "Indicator", "Unit", average_expenditures 
from environmental_expenditures
order by "Country", "Indicator", "Unit";


-- Data Exploration
-- Identify countries with greatest environmental expenditures in percent of GDP for each indicator 
select "Country", "Indicator", average_expenditures
from environmental_expenditures
where average_expenditures in (SELECT MAX(average_expenditures) 
  from environmental_expenditures
  where "Unit" = 'Percent of GDP'
  group by "Indicator")
order by average_expenditures DESC, "Country";

-- Find number of countries with environmental protection expenditures
SELECT COUNT(DISTINCT "Country") AS "Country Count" 
FROM environmental_expenditures;



-- Environmental Taxes Dataset

select * from taxes;

-- Data Cleaning
-- Drop unnecessary columns
alter TABLE taxes
drop column "Source",
drop column "CTS_Code",
drop column "CTS_Name",
drop column "CTS_Full_Descriptor"; 

-- update indicator column to change "Environmental Taxes" to "Total Environmental Taxes",
-- since the quantitative data reflects the sum of environmental taxes each year
select "Indicator", case when "Indicator" = 'Environmental Taxes' 
then 'Total Environmental Taxes' else "Indicator" end
from taxes;

update taxes
set "Indicator" = case when "Indicator" = 'Environmental Taxes' 
THEN 'Total Environmental Taxes' else "Indicator" end;


-- add column for average annual taxes
select "Country", "Unit", (coalesce("F1995", 0) + coalesce("F1996", 0) + coalesce("F1997", 0) + coalesce("F1998", 0) + coalesce("F1999", 0) + 
coalesce("F2000", 0) + coalesce("F2001", 0) + coalesce("F2002", 0) + coalesce("F2003", 0) + coalesce("F2004", 0) + 
coalesce("F2005", 0) + coalesce("F2006", 0) + coalesce("F2007", 0) + coalesce("F2008", 0) + coalesce("F2009", 0) + 
coalesce("F2010", 0) + coalesce("F2011", 0) + coalesce("F2012", 0) + coalesce("F2013", 0) + coalesce("F2014", 0) + 
coalesce("F2015", 0) + coalesce("F2016", 0) + coalesce("F2017", 0) + coalesce("F2018", 0) + coalesce("F2019", 0) + 
coalesce("F2020", 0) + coalesce("F2021", 0)) / nullif(case when "F1995" is null then 0 else 1 end +
case when "F1996" is null then 0 else 1 end + case when "F1997" is null then 0 else 1 end + 
case when "F1998" is null then 0 else 1 end + case when "F1999" is null then 0 else 1 end +
case when "F2000" is null then 0 else 1 end + case when "F2001" is null then 0 else 1 end + 
case when "F2002" is null then 0 else 1 end + case when "F2003" is null then 0 else 1 end +
case when "F2004" is null then 0 else 1 end + case when "F2005" is null then 0 else 1 end + 
case when "F2006" is null then 0 else 1 end + case when "F2007" is null then 0 else 1 end +
case when "F2008" is null then 0 else 1 end + case when "F2009" is null then 0 else 1 end + 
case when "F2010" is null then 0 else 1 end + case when "F2011" is null then 0 else 1 end +
case when "F2012" is null then 0 else 1 end + case when "F2013" is null then 0 else 1 end + 
case when "F2014" is null then 0 else 1 end + case when "F2015" is null then 0 else 1 end +
case when "F2016" is null then 0 else 1 end + case when "F2017" is null then 0 else 1 end + 
case when "F2018" is null then 0 else 1 end + case when "F2019" is null then 0 else 1 end +
case when "F2020" is null then 0 else 1 end + case when "F2021" is null then 0 else 1 end, 0) as average_taxes
from taxes
order by "Country", "Indicator";

alter table taxes
add average_taxes DECIMAL(20, 4);

update taxes
set average_taxes = (coalesce("F1995", 0) + coalesce("F1996", 0) + coalesce("F1997", 0) + coalesce("F1998", 0) + coalesce("F1999", 0) + 
coalesce("F2000", 0) + coalesce("F2001", 0) + coalesce("F2002", 0) + coalesce("F2003", 0) + coalesce("F2004", 0) + 
coalesce("F2005", 0) + coalesce("F2006", 0) + coalesce("F2007", 0) + coalesce("F2008", 0) + coalesce("F2009", 0) + 
coalesce("F2010", 0) + coalesce("F2011", 0) + coalesce("F2012", 0) + coalesce("F2013", 0) + coalesce("F2014", 0) + 
coalesce("F2015", 0) + coalesce("F2016", 0) + coalesce("F2017", 0) + coalesce("F2018", 0) + coalesce("F2019", 0) + 
coalesce("F2020", 0) + coalesce("F2021", 0)) / nullif(case when "F1995" is null then 0 else 1 end +
case when "F1996" is null then 0 else 1 end + case when "F1997" is null then 0 else 1 end + 
case when "F1998" is null then 0 else 1 end + case when "F1999" is null then 0 else 1 end +
case when "F2000" is null then 0 else 1 end + case when "F2001" is null then 0 else 1 end + 
case when "F2002" is null then 0 else 1 end + case when "F2003" is null then 0 else 1 end +
case when "F2004" is null then 0 else 1 end + case when "F2005" is null then 0 else 1 end + 
case when "F2006" is null then 0 else 1 end + case when "F2007" is null then 0 else 1 end +
case when "F2008" is null then 0 else 1 end + case when "F2009" is null then 0 else 1 end + 
case when "F2010" is null then 0 else 1 end + case when "F2011" is null then 0 else 1 end +
case when "F2012" is null then 0 else 1 end + case when "F2013" is null then 0 else 1 end + 
case when "F2014" is null then 0 else 1 end + case when "F2015" is null then 0 else 1 end +
case when "F2016" is null then 0 else 1 end + case when "F2017" is null then 0 else 1 end + 
case when "F2018" is null then 0 else 1 end + case when "F2019" is null then 0 else 1 end +
case when "F2020" is null then 0 else 1 end + case when "F2021" is null then 0 else 1 end, 0);

SELECT "Country", "Indicator", "Unit", average_taxes 
from taxes
order by "Country", "Indicator", "Unit";


-- Data Exploration
-- Identify the country with highest average environmental taxes in percent of GDP
select "Country", "Indicator", average_taxes
from taxes
where average_taxes in (SELECT MAX(average_taxes) 
  from taxes
  where "Unit" = 'Percent of GDP')
order by average_taxes DESC, "Country";

-- Find number of countries with environmental related taxes
SELECT COUNT(DISTINCT "Country") AS "Country Count" 
FROM taxes;



-- Fossil Fuels Subsidies Dataset
-- The dataset was split into 2 table due to the large file size with the subsidies_usd table containing 
-- the amount of subsidies in USD and the subsidies_gdp table having subsidy amount in percent of GDP

select * from subsidies_usd;

select * from subsidies_gdp;

-- Data Cleaning
-- Drop unnecessary columns
alter TABLE subsidies_usd
drop column "Source",
drop column "CTS_Code",
drop column "CTS_Name",
drop column "CTS_Full_Descriptor"; 

alter TABLE subsidies_gdp
drop column "Source",
drop column "CTS_Code",
drop column "CTS_Name",
drop column "CTS_Full_Descriptor"; 

-- add column for average annual subsidies for the subsidies_gdp dataset
select "Country", "Unit", (coalesce("F2015", 0) + coalesce("F2016", 0) + coalesce("F2017", 0) + coalesce("F2018", 0) + 
coalesce("F2019", 0) + coalesce("F2020", 0) + coalesce("F2021", 0) + coalesce("F2022", 0) + coalesce("F2023", 0) + 
coalesce("F2024", 0)) / nullif(case when "F2015" is null then 0 else 1 end +
case when "F2016" is null then 0 else 1 end + case when "F2017" is null then 0 else 1 end + 
case when "F2018" is null then 0 else 1 end + case when "F2019" is null then 0 else 1 end +
case when "F2020" is null then 0 else 1 end + case when "F2021" is null then 0 else 1 end +
case when "F2022" is null then 0 else 1 end + case when "F2023" is null then 0 else 1 end + 
case when "F2024" is null then 0 else 1 end, 0) as average_subsidies
from subsidies_gdp
order by "Country", "Indicator";

alter table subsidies_gdp
add average_subsidies DECIMAL(20, 4);

update subsidies_gdp
set average_subsidies = (coalesce("F2015", 0) + coalesce("F2016", 0) + coalesce("F2017", 0) + coalesce("F2018", 0) + 
coalesce("F2019", 0) + coalesce("F2020", 0) + coalesce("F2021", 0) + coalesce("F2022", 0) + coalesce("F2023", 0) + 
coalesce("F2024", 0)) / nullif(case when "F2015" is null then 0 else 1 end +
case when "F2016" is null then 0 else 1 end + case when "F2017" is null then 0 else 1 end + 
case when "F2018" is null then 0 else 1 end + case when "F2019" is null then 0 else 1 end +
case when "F2020" is null then 0 else 1 end + case when "F2021" is null then 0 else 1 end +
case when "F2022" is null then 0 else 1 end + case when "F2023" is null then 0 else 1 end + 
case when "F2024" is null then 0 else 1 end, 0);

SELECT "Country", "Indicator", average_subsidies
from subsidies_gdp
order by "Country", "Indicator";


-- Data Exploration
-- Identify countries with greatest fossil fuel subsidies in percent of GDP for each indicator 
select "Country", "Indicator", average_subsidies
from subsidies_gdp
where average_subsidies in (SELECT MAX(average_subsidies) 
  from subsidies_gdp
  group by "Indicator")
order by average_subsidies DESC, "Country";

-- Illustrate change in total fossil fuel subsidies in USD currency 
SELECT sum("F2015") as "2015", sum("F2016") as "2016", sum("F2017") as "2017", sum("F2018") as "2018",
sum("F2019") as "2019", sum("F2020") as "2020", sum("F2021") as "2021", sum("F2022") as "2022",
sum("F2023") as "2023", sum("F2024") as "2024"
from subsidies_usd;

-- Find number of countries with fossil fuel subsidies
SELECT COUNT(DISTINCT "Country") AS "Country Count" 
FROM subsidies_gdp;



-- Climate Disasters Frequency Dataset

select * from disaster_freq;

-- Data Cleaning
-- Drop unnecessary columns
alter TABLE disaster_freq
drop column "Source",
drop column "CTS_Code",
drop column "CTS_Name",
drop column "CTS_Full_Descriptor";

-- update indicator column to rename labels for conciseness
Select "Indicator", case when "Indicator" = 'Climate related disasters frequency, Number of Disasters: Drought' 
THEN 'Drought' when "Indicator" = 'Climate related disasters frequency, Number of Disasters: Extreme temperature' 
then 'Extreme temperature' when "Indicator" = 'Climate related disasters frequency, Number of Disasters: Flood' 
then 'Flood' when "Indicator" = 'Climate related disasters frequency, Number of Disasters: Landslide' 
then 'Landslide' when "Indicator" = 'Climate related disasters frequency, Number of Disasters: Storm' 
then 'Storm' when "Indicator" = 'Climate related disasters frequency, Number of Disasters: Wildfire' 
then 'Wildfire' when "Indicator" = 'Climate related disasters frequency, Number of Disasters: TOTAL' 
then 'Total Climate Disasters' else "Indicator" END
from disaster_freq;

update disaster_freq
set "Indicator" = case when "Indicator" = 'Climate related disasters frequency, Number of Disasters: Drought' 
THEN 'Drought' when "Indicator" = 'Climate related disasters frequency, Number of Disasters: Extreme temperature' 
then 'Extreme temperature' when "Indicator" = 'Climate related disasters frequency, Number of Disasters: Flood' 
then 'Flood' when "Indicator" = 'Climate related disasters frequency, Number of Disasters: Landslide' 
then 'Landslide' when "Indicator" = 'Climate related disasters frequency, Number of Disasters: Storm' 
then 'Storm' when "Indicator" = 'Climate related disasters frequency, Number of Disasters: Wildfire' 
then 'Wildfire' when "Indicator" = 'Climate related disasters frequency, Number of Disasters: TOTAL' 
then 'Total Climate Disasters' else "Indicator" end;

-- Create to new column to contain the sum of climate disaster across the years
select "Country", "Indicator", coalesce("F1980", 0) + coalesce("F1981", 0) + coalesce("F1982", 0) + coalesce("F1983", 0) + coalesce("F1984", 0) + 
coalesce("F1985", 0) + coalesce("F1986", 0) + coalesce("F1987", 0) + coalesce("F1988", 0) + coalesce("F1989", 0) + 
coalesce("F1990", 0) + coalesce("F1991", 0) + coalesce("F1992", 0) + coalesce("F1993", 0) + coalesce("F1994", 0) +
coalesce("F1995", 0) + coalesce("F1996", 0) + coalesce("F1997", 0) + coalesce("F1998", 0) + coalesce("F1999", 0) + 
coalesce("F2000", 0) + coalesce("F2001", 0) + coalesce("F2002", 0) + coalesce("F2003", 0) + coalesce("F2004", 0) + 
coalesce("F2005", 0) + coalesce("F2006", 0) + coalesce("F2007", 0) + coalesce("F2008", 0) + coalesce("F2009", 0) + 
coalesce("F2010", 0) + coalesce("F2011", 0) + coalesce("F2012", 0) + coalesce("F2013", 0) + coalesce("F2014", 0) + 
coalesce("F2015", 0) + coalesce("F2016", 0) + coalesce("F2017", 0) + coalesce("F2018", 0) + coalesce("F2019", 0) + 
coalesce("F2020", 0) + coalesce("F2021", 0) + coalesce("F2022", 0) as disaster_sum
from disaster_freq;

alter table disaster_freq
add total_since_1980 SMALLINT;

update disaster_freq
set total_since_1980 = coalesce("F1980", 0) + coalesce("F1981", 0) + coalesce("F1982", 0) + coalesce("F1983", 0) + coalesce("F1984", 0) + 
coalesce("F1985", 0) + coalesce("F1986", 0) + coalesce("F1987", 0) + coalesce("F1988", 0) + coalesce("F1989", 0) + 
coalesce("F1990", 0) + coalesce("F1991", 0) + coalesce("F1992", 0) + coalesce("F1993", 0) + coalesce("F1994", 0) +
coalesce("F1995", 0) + coalesce("F1996", 0) + coalesce("F1997", 0) + coalesce("F1998", 0) + coalesce("F1999", 0) + 
coalesce("F2000", 0) + coalesce("F2001", 0) + coalesce("F2002", 0) + coalesce("F2003", 0) + coalesce("F2004", 0) + 
coalesce("F2005", 0) + coalesce("F2006", 0) + coalesce("F2007", 0) + coalesce("F2008", 0) + coalesce("F2009", 0) + 
coalesce("F2010", 0) + coalesce("F2011", 0) + coalesce("F2012", 0) + coalesce("F2013", 0) + coalesce("F2014", 0) + 
coalesce("F2015", 0) + coalesce("F2016", 0) + coalesce("F2017", 0) + coalesce("F2018", 0) + coalesce("F2019", 0) + 
coalesce("F2020", 0) + coalesce("F2021", 0) + coalesce("F2022", 0);

SELECT "Country", "Indicator", total_since_1980 from disaster_freq;


-- Data Exploration
-- Identify the top 10 countries in total climate disasters
select "Country", total_since_1980, RANK () OVER (ORDER BY total_since_1980 desc) rank_number
from disaster_freq
where "Indicator" = 'Total Climate Disasters'
order by total_since_1980 DESC, "Country"
fetch FIRST 10 ROWS ONLY;

-- Display comparision between total number of climate disasters since 1980 
-- and total fossil fuel subsidies in percent of GDP by Country
select d."Country", total_since_1980, average_subsidies
from disaster_freq d join subsidies_gdp s
on d."Country" = s."Country"
where d."Indicator" = 'Total Climate Disasters' 
AND s."Indicator" = 'Fossil Fuel Subsidies - Total Implicit and Explicit';

