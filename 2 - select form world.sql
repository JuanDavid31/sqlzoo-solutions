-- 1
SELECT name, continent, population 
FROM world
-- 2
SELECT name 
FROM world
WHERE population>200000000
-- 3
SELECT name, gdp/population 
FROM world
WHERE population > 200000000
-- 4
SELECT name, population/1000000 
FROM world
WHERE continent = 'South America'
-- 5
SELECT name,population 
FROM world
WHERE name IN ('France','Germany','Italy')
-- 6
SELECT name 
FROM world
WHERE name LIKE '%United%'
-- 7
select name, population, area 
from world
where population > 250000000 or area > 3000000
-- 8
select name, population, area 
from world
where population > 250000000 xor area > 3000000
-- 9
select name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2) 
from world
where continent = 'South America'
-- 10
select name, ROUND(gdp/population,-3) 
from world
where gdp > 1000000000000

-- 11
SELECT name,
CASE WHEN continent='Oceania' THEN 'Australasia'
ELSE continent END
FROM world
WHERE name LIKE 'N%'

--12
SELECT name,
CASE WHEN continent='Europe' or continent='Asia' THEN 'Eurasia'
WHEN continent in ('North America','South America','Caribbean') THEN 'America'   
ELSE continent END
FROM world
WHERE name LIKE 'A%' or name LIKE 'B%'

--13
SELECT name, continent, CASE
WHEN continent = 'Oceania' THEN 'Australasia'
WHEN continent = 'Eurasia' THEN 'Europe/Asia'
WHEN name = 'Turkey' THEN 'Europe/Asia'
WHEN continent = 'Caribbean' AND name LIKE 'B%' then 'North America'
WHEN continent = 'Caribbean' THEN 'South America'    
ELSE continent END
FROM world ORDER BY name