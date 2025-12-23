-- Use “World” Database to solve the following questions 
-- (Hint : World Database is inbuilt in SQL Workbench so use code “use world;” to make use of the database)
USE world;

-- Question 1 : Count how many cities are there in each country?
SELECT country.Name, COUNT(city.ID) AS Total_Cities FROM country
LEFT JOIN city ON country.Code = city.CountryCode 
GROUP BY country.Name;


-- Question 2 : Display all continents having more than 30 countries.
SELECT country.Continent, COUNT(country.Name) AS Total_Countries FROM country
GROUP BY country.Continent
HAVING COUNT(country.Name) > 30;


-- Question 3 : List regions whose total population exceeds 200 million.
SELECT country.Region, SUM(country.Population) AS Population_By_Region FROM country
GROUP BY country.Region
HAVING SUM(country.Population) > 200000000; 


-- Question 4 : Find the top 5 continents by average GNP per country.
SELECT country.Continent, AVG(country.GNP) AS avg_GNP_per_country FROM country
GROUP BY country.Continent
ORDER BY AVG(country.GNP) DESC
LIMIT 5; 


-- Question 5 : Find the total number of official languages spoken in each continent.
SELECT c.Continent, COUNT(cl.Language) AS total_official_lang FROM country AS c
LEFT JOIN countrylanguage AS cl ON c.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY c.Continent;


-- Question 6 : Find the maximum and minimum GNP for each continent.
SELECT country.Continent, MAX(IFNULL(country.GNP,0)) AS max_GNP, MIN(IFNULL(country.GNP,0)) AS min_GNP FROM country
GROUP BY country.Continent; 


-- Question 7 : Find the country with the highest average city population.
SELECT country.Name, AVG(city.Population) AS avg_city_Population FROM country
LEFT JOIN city ON country.Code = city.CountryCode 
GROUP BY country.Name
ORDER BY AVG(city.Population) DESC 
LIMIT 1; 


-- Question 8 : List continents where the average city population is greater than 200,000.
SELECT country.Continent, AVG(city.Population) AS avg_city_Population FROM country
LEFT JOIN city ON country.Code = city.CountryCode 
GROUP BY country.Continent
HAVING 200000 < AVG(city.Population); 


-- Question 9 : Find the total population and average life expectancy for each continent, ordered by average life expectancy descending.
SELECT country.Continent, SUM(country.Population) AS total_Population, AVG(country.LifeExpectancy) AS avg_life_expectancy FROM country
GROUP BY country.Continent
ORDER BY AVG(country.LifeExpectancy) DESC; 


-- Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million. 
SELECT country.Continent, AVG(country.LifeExpectancy) AS avg_life_expectancy FROM country
GROUP BY country.Continent
HAVING SUM(country.Population) > 200000000
ORDER BY AVG(country.LifeExpectancy) DESC
LIMIT 3;
