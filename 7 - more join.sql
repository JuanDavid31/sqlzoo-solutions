-- 1
SELECT id, title
 FROM movie
 WHERE yr=1962

 -- 2
 select yr
from movie
where title = 'Citizen Kane'

-- 3
select id, title, yr
from movie
where title like '%Star Trek%'
order by yr

-- 4
select id
from actor
where name = 'Glenn Close'

-- 5
select id
from movie
where title = 'Casablanca'

-- 6
select name
from actor
join casting on id = actorid
where movieid = 11768

-- 7
select name
from actor
join casting on id = actorid
join movie on movie.id = casting.movieid
where title = 'Alien'

-- 8
select title
from actor
join casting on id = actorid
join movie on movie.id = casting.movieid
where actor.name = 'Harrison Ford'

-- 9
select title
from actor
join casting on id = actorid
join movie on movie.id = casting.movieid
where actor.name = 'Harrison Ford'
and ord <> 1

-- 10
select title, actor.name
from actor
join casting on id = actorid
join movie on movie.id = casting.movieid
where yr = 1962
and ord = 1

-- 11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12
select movie.title, actor.name
from actor
join casting on id = actorid
join movie on movie.id = casting.movieid 
where movie.id in
(select movie.id
from actor
join casting on id = actorid
join movie on movie.id = casting.movieid
where actor.name = 'Julie Andrews')
and ord = 1

-- 13
SELECT actor.name
FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
where ord = 1
group by actor.name
having count(movie.title) >= 15
order by actor.name


-- 14
SELECT movie.title, count(actor.name)
FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
where yr = 1978
group by movie.title
order by count(actor.name) desc, movie.title    

-- 15
select actor.name
from actor
join casting on id = actorid
join movie on movie.id = casting.movieid 
where movie.id in
(select movie.id
from actor
join casting on id = actorid
join movie on movie.id = casting.movieid
where actor.name = 'Art Garfunkel')
and actor.name <> 'Art Garfunkel'