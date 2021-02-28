-- 1
SELECT matchid, player FROM goal 
WHERE teamid = 'Ger'

-- 2
select id, stadium, team1, team2
from goal
inner join game on matchid = game.id
where matchid = 1012
limit 1

-- 3
SELECT player, teamid, stadium, mdate
FROM game 
JOIN goal ON (id=matchid)
where teamid = 'GER'

-- 4
select game.team1, game.team2, goal.player
from game 
inner join goal on id = matchid
where player like 'Mario%'

-- 5
SELECT player, teamid, coach, gtime
FROM goal 
goal JOIN eteam on teamid=id
WHERE gtime<=10

-- 6
select mdate, teamname
from eteam
join game on team1 = eteam.id
where coach = 'Fernando Santos'

-- 7
select player
from game
join goal on id = matchid
where stadium = 'National Stadium, Warsaw'

-- 8
SELECT distinct player
FROM game 
JOIN goal ON matchid = id
where teamid <> 'GER'
and (team1 = 'GER' OR team2 = 'GER')

-- 9
SELECT teamname, count(teamname)
FROM eteam 
JOIN goal ON id=teamid
group BY teamname

-- 10
select stadium, count(stadium)
from game
join goal on id = matchid
group by stadium

-- 11
SELECT matchid, mdate, count(mdate)
FROM game 
JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
group by mdate, matchid
order by matchid

-- 12
SELECT matchid, mdate, count(mdate)
FROM game 
JOIN goal ON matchid = id 
WHERE teamid = 'GER'
group by mdate, matchid
order by matchid