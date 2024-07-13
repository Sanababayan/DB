select athlete_id, athlete_name, score, sport_name from (
select athlete.athlete_id as athlete_id, athlete.athlete_name as athlete_name, athlete.score as score, sport.sport_name as sport_name, 
rank() over(
partition by sport.sport_id
order by athlete.score desc 
) rank_a
from sport
inner join athlete on athlete.sport_id = sport.sport_id)
where rank_a = 1;