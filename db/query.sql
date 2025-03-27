select count(*) from videos;

select username, count(*) as cnt
from videos
group by username
having count(*) > 5
order by count(*) desc;
