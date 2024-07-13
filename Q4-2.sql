create temporary table aps as select athlete.sport_id, avg(athlete.score)
from athlete group by athlete.sport_id 

select * from athlete
inner join sport on athlete.sport_id = sport.sport_id
inner join aps on aps.sport_id = athlete.sport_id
where athlete.score > (select avg(athlete.score) from athlete) and athlete.score < (select avg from aps where aps.sport_id = athlete.sport_id)
order by athlete.athlete_id ;