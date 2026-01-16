CREATE TABLE IF NOT EXISTS users (
	username TEXT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS tags (
	tag TEXT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS usertags (
	username TEXT,
	tag      TEXT,

	PRIMARY KEY (username, tag),
	FOREIGN KEY (username) REFERENCES users (username) ON DELETE CASCADE,
	FOREIGN KEY (tag) REFERENCES tags (tag) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS videos (
	hash     TEXT PRIMARY KEY,
	file     TEXT,
	username TEXT,
	size     INTEGER,
	duration INTEGER,
	width    INTEGER,
	height   INTEGER,
	metadata TEXT,

	FOREIGN KEY (username) REFERENCES users (username)
);

CREATE TABLE IF NOT EXISTS follows (
	follower TEXT NOT NULL,
	followed TEXT NOT NULL,

	PRIMARY KEY (follower, followed),
	FOREIGN KEY (follower) REFERENCES users (username) on DELETE CASCADE,
	FOREIGN KEY (followed) REFERENCES users (username) on DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_usertags_tag ON usertags (tag);
CREATE INDEX IF NOT EXISTS idx_usertags_username ON usertags (username);
CREATE INDEX IF NOT EXISTS idx_videos_username ON videos (username);
CREATE INDEX IF NOT EXISTS idx_follows_follower ON follows(follower);
CREATE INDEX IF NOT EXISTS idx_follows_followed ON follows(followed);
