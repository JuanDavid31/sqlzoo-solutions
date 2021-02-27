--  1
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950
-- 2
SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'Literature'
-- 3
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'
-- 4
SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000
-- 5
SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989
(in MySQL BETWEEN is inclusive.. this is not always the case)
-- 6
SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter')
-- 7
SELECT winner FROM nobel
WHERE winner LIKE 'JOHN %'
-- 8
SELECT * FROM nobel
WHERE yr = 1980 AND subject = 'Physics'
OR yr = 1984 AND subject = 'Chemistry'
-- 9
SELECT * FROM nobel
WHERE yr = 1980
AND subject NOT IN ('Chemistry','Medicine')
-- 10
SELECT * FROM nobel
WHERE yr < 1910 AND subject = 'Medicine'
OR yr >= 2004 AND subject = 'Literature'
-- 11
SELECT * FROM nobel
WHERE winner = 'Peter Grünberg'
-- 12
SELECT * FROM nobel
WHERE winner = 'Eugene O''Neill'
-- 13
SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir %'
ORDER BY yr DESC, winner
-- 14
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject in ('Chemistry','Physics'), subject, winner