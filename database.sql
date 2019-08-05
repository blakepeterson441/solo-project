CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	username VARCHAR(20),
	password VARCHAR(64)
);

INSERT INTO users (username, password)
VALUES ('blake', '1234'), ('aRealPerson', '1234'), ('bot', '1234');

CREATE TABLE friends (
	id SERIAL PRIMARY KEY,
	user_id_one int REFERENCES users,
	user_id_two int REFERENCES users,
	approved boolean
);

INSERT INTO friends (user_id_one, user_id_two, approved)
VALUES (1, 2, true);

CREATE TABLE user_games (
	id SERIAL PRIMARY KEY NOT NULL,
	user_id int REFERENCES users,
	game_id int REFERENCES games,
	overall_skill int,
	offensive_skill int,
	defensive_skill int,
	aggression int
);

INSERT INTO user_games ( user_id, game_id, overall_skill, offensive_skill, defensive_skill, aggression)
VALUES (1, 1, 6, 5, 7, 5), (2, 1, 6, 7, 5, 8), (3, 1, 8, 8, 5, 7);

CREATE TABLE games (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80)
);

INSERT INTO games (name)
VALUES ('Rocket League');

CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
	user_id_one int REFERENCES users,
	user_id_two int REFERENCES users,
	message VARCHAR(240)
);

INSERT INTO messages (user_id_one, user_id_two, message)
VALUES (1, 2, 'Hey, lets play!');

SELECT users.username, games.name AS game, user_games.overall_skill AS overall, user_games.offensive_skill AS offense, user_games.defensive_skill AS defense, user_games.aggression AS aggression
FROM games
JOIN user_games ON user_games.game_id = games.id
JOIN users ON users.id = user_games.user_id;

