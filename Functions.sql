CREATE OR REPLACE PROCEDURE add_new_player(NAME VARCHAR, surname varchar, middle_name VARCHAR, region TEXT, sports VARCHAR)
AS
$$
DECLARE
 human_new int := (SELECT ID+1 FROM human ORDER BY ID DESC LIMIT 1);
BEGIN
  INSERT INTO Human (surname, NAME, middle_name) VALUES(surname, NAME, middle_name) ;
  INSERT INTO Information (id_human, region, sports_category) VALUES(human_new, region, sports);
END;
$$
LANGUAGE 'plpgsql';


CREATE OR REPLACE PROCEDURE add_result(id track int, id_person int, place int, num int)
AS
$$
DECLARE
BEGIN
  INSERT INTO RESULT(id_spotsman, id traking, Number_of_hold, place_on_track) VALUES (id_person, id track, num, place);
END;
$$
LANGUAGE 'plpgsql';


CREATE OR REPLACE FUNCTION show_all_sportsmen(c_id int)
  RETURNS TABLE(
    NAME varchar,
    surname varchar,
    ROLE VARCHAR,
    region TEXT,
    sports_category VARCHAR
)
AS
$$

BEGIN
  RETURN QUERY
  SELECT human.name, human.surname, take_a_part.role, information.region, information.sports_category
  FROM competition JOIN take_a_part ON take_a_part.id_competition = competition.id
  JOIN human ON take_a_part.id_human = human.id
  JOIN information ON information.id_human = human.id
  WHERE competition.id = c_id;
END;
$$
LANGUAGE 'plpgsql';


CREATE OR REPLACE FUNCTION show_all_sudey(t_id int)
  RETURNS TABLE(
    Name_t VARCHAR,
    surname_t VARCHAR
)
AS
$$
BEGIN
  RETURN QUERY
  SELECT human.surname, human.name
  FROM competition JOIN track ON track.id_competition = competition.id
  JOIN traking ON traking.id_track = track.id
  JOIN human ON traking.id_human = human.id
  WHERE competition.id = t_id;
END;
$$
LANGUAGE 'plpgsql';
