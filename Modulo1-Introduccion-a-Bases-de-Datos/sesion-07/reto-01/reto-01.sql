USE bedu_test;

CREATE TABLE IF NOT EXISTS movies (
   movie_id INT UNSIGNED, 
   title VARCHAR(80), 
   generos VARCHAR(80),
   PRIMARY KEY (movie_id)
); 

CREATE TABLE IF NOT EXISTS ratings (
   ratings_id INT UNSIGNED AUTO_INCREMENT,
   user_id INT UNSIGNED, 
   movie_id INT UNSIGNED, 
   rating SMALLINT, 
   time_stamp BIGINT,
   PRIMARY KEY (ratings_id),
   FOREIGN KEY (user_id)
		REFERENCES users(user_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (movie_id)
		REFERENCES movies(movie_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);