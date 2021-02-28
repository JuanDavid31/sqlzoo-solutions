-- 1
select count(*)
from stops

-- 2
select id
from stops where name = 'Craiglockhart'

-- 3
select id, name
from stops
join route on id = stop
where num = '4'
and company = 'LRT'

-- 4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
having count(*) > 1

-- 5
SELECT a.company, a.num, a.stop, b.stop
FROM route 
a JOIN route b ON a.company = b.company AND a.num = b.num
WHERE a.stop = (SELECT id FROM stops WHERE name = 'Craiglockhart')
AND b.stop = (SELECT id FROM stops WHERE name = 'London Road')

-- 6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a 
JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
and stopb.name = 'London Road'

-- 7
SELECT distinct a.company, a.num  
FROM route a, route b
WHERE a.num = b.num AND (a.stop = 115 AND b.stop = 137)

-- 8
SELECT a.company, a.num
FROM route a
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart'
AND stopb.name = 'Tollcross'

-- 9
SELECT DISTINCT name, a.company, a.num
FROM route a
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN stops ON a.stop = stops.id
WHERE b.stop = 53;

