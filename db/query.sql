select * from videos;
select * from users limit 5;
select count(*) from videos;

-- number of users
select count(distinct username) from videos;

-- case insensitive regex
select * from videos where username regexp '(?i)Bunny.*';

-- count videos per user
select username, count(*) as cnt
from videos
group by username
having count(*) > 5
order by count(*) desc;

-- count videos per user
select u.username, count(v.hash) as videoCnt
from users u
	join videos v on u.username = v.username
group by u.username
order by videoCnt desc;

-- count distinct usernames with height < 1080
select username, height, count(*) as videoCnt
from videos
where height < 1080
group by username, width
order by videoCnt desc;

select file from videos v
	join users u on u.username = v.username
where note = 'foo';

select * from users where note = 'snaketattoo' limit 5;

select count(*) from videos v
    join users u on u.username = v.username
where u.note = 'snaketattoo';

select * from users
where note not NULL;
