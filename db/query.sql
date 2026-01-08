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

select file, duration from videos order by rowid desc limit 10;

select changes();

select count(*) from usertags where tag = 'snaketattoo';

-- count usernames by their starting letter
select
	lower(substr(username, 1, 1)) as letter,
	count(*) as cnt
from users
group by letter
order by letter;

-- count longest usernames
select
	length(username) as len,
	username
from users
order by len desc
limit 20;
