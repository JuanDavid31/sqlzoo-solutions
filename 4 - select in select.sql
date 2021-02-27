-- 1
SELECT name FROM world
WHERE population > (SELECT population FROM world WHERE name='Russia')

-- 2
SELECT name FROM world
WHERE continent = 'Europe'
AND gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom')

-- 3
SELECT name, continent FROM world
WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina','Australia'))
ORDER BY name

-- 4
SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
AND population < (SELECT population FROM world WHERE name = 'Poland')

-- 5
select name, concat(round((population / (select population from world where name = 'Germany')) * 100), '%')
from world
where continent = 'Europe'

-- 6

select name 
from world
where gdp > (select max(gdp)
from world
where continent = 'Europe')

-- 7
select continent, name, area
from world x
where area >= (select max(area)
from world y
where y.continent = x.continent
group by continent)

