-- This script assigns followed users to a user. Add the users to db/followed.txt first.

-- 0. Disable FK temporarily while creating tables
PRAGMA foreign_keys = OFF;

-- 1. Ensure base table 'users' exists
CREATE TABLE IF NOT EXISTS users (
	username TEXT PRIMARY KEY
);

-- 2. Ensure 'follows' table exists (depends on users)
DROP TABLE IF EXISTS follows;

CREATE TABLE IF NOT EXISTS follows (
	follower TEXT NOT NULL,
	followed TEXT NOT NULL,
	PRIMARY KEY (follower, followed),
	FOREIGN KEY (follower) REFERENCES users (username) ON DELETE CASCADE,
	FOREIGN KEY (followed) REFERENCES users (username) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_follows_follower ON follows (follower);
CREATE INDEX IF NOT EXISTS idx_follows_followed ON follows (followed);

-- 3. Create temp table to import followed list (1 column)
CREATE TEMP TABLE _followed_tmp (
	username TEXT
);

-- 4. Import followed usernames from file (one per line)
.mode csv
.import db/followed.txti _followed_tmp

-- 5. Ensure yourself is in 'users'
INSERT OR IGNORE INTO users (username) VALUES ('rairden');

-- 6. Enable FK before inserting into follows
PRAGMA foreign_keys = ON;

-- 7. Insert all followed users into 'users' table in reverse order
INSERT OR IGNORE INTO users (username)
SELECT username
FROM (SELECT username, ROW_NUMBER() OVER () AS rn
	  FROM _followed_tmp)
ORDER BY rn DESC;

-- 8. Insert into 'follows' table (rairden follows them), reverse order
INSERT OR IGNORE INTO follows (follower, followed)
SELECT 'rairden', username
FROM (SELECT username, ROW_NUMBER() OVER () AS rn
	  FROM _followed_tmp)
ORDER BY rn DESC;

-- 9. Cleanup temp table
DROP TABLE _followed_tmp;
