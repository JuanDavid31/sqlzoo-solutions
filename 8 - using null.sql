-- 1
select name
from teacher
where dept is null

-- 2
SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
ON (teacher.dept=dept.id)

-- 3
SELECT teacher.name, dept.name
FROM teacher left JOIN dept
ON (teacher.dept=dept.id)

-- 4
SELECT teacher.name, dept.name
FROM teacher right JOIN dept
ON (teacher.dept=dept.id)

-- 5
 select name, coalesce(mobile, '07986 444 2266')
from teacher

-- 6
SELECT teacher.name, coalesce(dept.name, 'None')
FROM teacher left JOIN dept
ON (teacher.dept=dept.id)

-- 7
SELECT count(teacher.name), count(teacher.mobile)
FROM teacher

-- 8
select dept.name, sum(case when teacher.name is not null then 1 else 0 end)
from dept
left join teacher on dept.id = dept
group by dept.name

-- or

SELECT dept.name, count(teacher.dept)
FROM dept
left join teacher ON dept.id = teacher.dept
group by dept.name

-- 9
select name,
case
    when dept in (1, 2) then 'Sci' else 'Art' end
from teacher

-- 10
select name,
case
    when dept in (1, 2) then 'Sci'
    when dept = 3 then 'Art'
    else 'None' 
end
from teacher