CREATE TABLE Competition(
	id SERIAL PRIMARY KEY,
	type_competition varchar(20) NOT NULL,
	city_competition varchar(30) NOT NULL,
    middle_tracks_difficulty varchar(30) NOT NULL,
	climbing_gym varchar(30) NOT NULL,
	date DATE NOT NULL
);
CREATE TABLE Human(
	id SERIAL PRIMARY KEY,
	surname varchar(40) NOT NULL,
	name varchar(40) NOT NULL,
    middle_name varchar(40) NOT NULL
);
CREATE TABLE Take_a_part(
	id_human INTEGER REFERENCES Human NOT NULL, 
	id_competition INTEGER REFERENCES Competition NOT NULL,
	role varchar(20) NOT NULL,
  	CONSTRAINT Human_take_a_part PRIMARY KEY (id_human, id_competition)
);
CREATE TABLE Information(
	id SERIAL PRIMARY KEY,
	id_human INTEGER REFERENCES Human NOT NULL,
	region text NOT NULL,
	sports_category VARCHAR(20) NOT NULL
);
CREATE TABLE Award(
	id SERIAL PRIMARY KEY,
	id_organizer INTEGER REFERENCES Human NOT NULL,
	description varchar(30) NOT NULL
);
CREATE TABLE Total(
	id SERIAL PRIMARY KEY,
	id_competition INTEGER REFERENCES Competition NOT NULL,
	sportsman_place INTEGER NOT NULL,
   	id_sporstman INTEGER REFERENCES Human NOT NULL,
	id_award INTEGER REFERENCES Award
);
CREATE TABLE Track(
	id SERIAL PRIMARY KEY,
	number_of_holds INTEGER NOT NULL,
	number_of_quikdraws INTEGER NOT NULL,
	number_of_meters INTEGER NOT NULL,
    Gender varchar(1) Not NULL,
	id_competition INTEGER REFERENCES Competition NOT NULL
);
CREATE TABLE Traking(
	id SERIAL PRIMARY KEY, 
    id_human INTEGER REFERENCES Human NOT NULL,
    id_track INTEGER REFERENCES Track NOT NULL,
    description text 
);
CREATE TABLE Type_track(
	id_track INTEGER REFERENCES Track NOT NULL, 
	id_director_track INTEGER REFERENCES Human NOT NULL,
	track_difficulty VARCHAR(2) NOT NULL,
	CONSTRAINT T_track PRIMARY KEY (id_track, id_director_track)
);
CREATE TABLE Result(
	id_spotsman INTEGER REFERENCES Human NOT NULL, 
	id_traking INTEGER REFERENCES Traking NOT NULL,
	CONSTRAINT result_of_spotsman PRIMARY KEY (id_spotsman, id_traking),
    Number_of_hold INTEGER NOT NULL,
	place_on_track INTEGER  NOT NULL
);




