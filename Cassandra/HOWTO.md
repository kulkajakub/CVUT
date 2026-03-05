# Návod ke zprovoznění 1. části semestrální práce

Spustení databáze a vložení dat.
.../1 - NoSQL technologie >
	
	docker compose up -d

	docker compose cp data/Sensor.csv cassandra1:/sensors.csv
	docker compose cp data/Water.csv cassandra1:/water.csv
	docker compose cp data/Weather.csv cassandra1:/weather.csv

	docker compose exec cassandra1 bash
	
	
Povolení pro používaní, funkcí, autentizace a autorizace.
root@cassandra1:/#

	sed -i -r 's/user_defined_functions_enabled: false/user_defined_functions_enabled: true/' /etc/cassandra/cassandra.yaml
	sed -i -r 's/authenticator: AllowAllAuthenticator/authenticator: PasswordAuthenticator/' /etc/cassandra/cassandra.yaml
	sed -i -r 's/authorizer: AllowAllAuthorizer/authorizer: CassandraAuthorizer/' /etc/cassandra/cassandra.yaml
	
	cqlsh
	
Vytvoření KEYSPACE, TABULEK a vložení dat. 
cassandra@cqlsh>
	
	CREATE KEYSPACE water_weather_sensors WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 2 };
	USE water_weather_sensors;

	CREATE TABLE sensors ( sensor_name TEXT, sensor_type TEXT, latitude DOUBLE, longitude DOUBLE, all INT, PRIMARY KEY (( all ), sensor_type, sensor_name ));
	COPY sensors ( sensor_name, sensor_type, latitude, longitude, all ) FROM 'sensors.csv' WITH header = true AND null = 'no_name';

	CREATE TABLE water ( beach_name TEXT, water_temperature DOUBLE, turbidity DOUBLE, transducer_depth DOUBLE, wave_height DOUBLE, wave_period DOUBLE, battery_life DOUBLE, time TEXT, month INT, year INT, day INT, PRIMARY KEY (( year ), month, day, time, beach_name ));
	COPY water ( beach_name, water_temperature, turbidity, transducer_depth, wave_height, wave_period, battery_life, year, month, day, time ) FROM 'water.csv' WITH header = true AND null = 'no_name';

	CREATE TABLE weather ( station_name TEXT, measurement_timestamp TIMESTAMP, air_temperature DOUBLE, wet_bulb_temperature DOUBLE, humidity INT, rain_intensity DOUBLE, interval_rain DOUBLE, total_rain DOUBLE, precipitation_type DOUBLE, wind_direction INT, wind_speed DOUBLE, max_wind_speed DOUBLE, barometric_pressure DOUBLE, solar_radiation INT, heading DOUBLE, battery_life DOUBLE, PRIMARY KEY (( station_name ), measurement_timestamp));
	COPY weather ( station_name, measurement_timestamp, air_temperature, wet_bulb_temperature, humidity, rain_intensity, interval_rain, total_rain, precipitation_type, wind_direction, wind_speed, max_wind_speed, barometric_pressure, solar_radiation, heading, battery_life) FROM 'weather.csv' WITH header = true AND null = 'no_name';
	
	SELECT * FROM sensors;
	
	exit
	exit
		

Databáze musí být restartována kvůli změnám v cassandra.yaml. Pak už můžeme pracovat.
.../1 - NoSQL technologie >

	docker compose restart
	docker compose exec cassandra1 bash
	

root@cassandra1:/#
	
	cqlsh -u cassandra -p cassandra
	
	
cassandra@cqlsh>

	USE water_weather_sensors;