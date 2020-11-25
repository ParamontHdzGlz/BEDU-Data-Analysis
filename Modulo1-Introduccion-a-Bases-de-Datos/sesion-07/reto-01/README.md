## Reto 1: Solución  
1.- Definir los campos y tipos de datos para la tabla movies haciendo uso de los archivos movies.dat y README.
   ```sql  
	CREATE TABLE IF NOT EXISTS movies (  
	movie_id INT UNSIGNED,  
	title VARCHAR(80),  
	generos VARCHAR(80),  
	PRIMARY KEY (movie_id)  
	);  
   ```

2.- Crear la tabla movies.  
	Cambiamos los pipes (|) en el campo de géneros por punto y coma (;), posteriormente cambiamos los delimitadores de doble dos puntos (::) por pipes (|). De esta forma, al subir el archivo como .csv, mysql reconocerá los delimitadores.  

3.- Definir los campos y tipos de datos para la tabla ratings haciendo uso de los archivos ratings.dat y README.
   ```sql  
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
   ```

4.- Crear la tabla ratings.  
	Hacemos uso de la herramienta Table Data Import Wizard, en este caso, cambiando los caracteres de boble dos puntos (::) por comas (,) y guardando el documento como .csv.



