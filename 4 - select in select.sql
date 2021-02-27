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

--8
select continent, name
from world x
where
name = (select name from world y where x.continent = y.continent order by name asc limit 1)

--9

select name, continent, population
from world x
where 
(select count(continent) as countries
from world y
where y.continent = x.continent
group by continent)
=
(select count(continent) as countries
from world z
where population <= 25000000
and z.continent = x.continent
group by continent)

-- 10
SELECT name, continent FROM world x
  WHERE population >= ALL(SELECT population*3
                         FROM world y
                         WHERE x.continent = y.continent
                         and y.name != x.name)