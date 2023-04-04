create or replace function check_org() returns trigger
    as
    $$
    declare
        org_id int := new.id_organizer;
    begin
        if (select role from take_a_part where take_a_part.id_human = org_id limit 1) != 'Organizator'
            then
                raise exception 'Give award can only Organizators!';
        end if;
        return new;
    end;
    $$
    language 'plpgsql';


create or replace trigger check_org_t
    before insert or update on award
    for each row
    execute function check_org();

create or replace function check_sport() returns trigger
    as
    $$
    declare
        sprt_id int := new.id_spotsman;
    begin
        if (select role from take_a_part where take_a_part.id_human = sprt_id limit 1) != 'Sportsmen'
            then
                raise exception 'This row only for Sportsmen!';
        end if;
        return new;
    end;
    $$
    language 'plpgsql';


create or replace trigger check_sport_t
    before insert or update on result
    for each row
    execute function check_sport();
 
create or replace function check_p() returns trigger
    as
    $$
    declare
        p_id int := new.id_director_track;
    begin
        if (select role from take_a_part where take_a_part.id_human = p_id limit 1) != 'Postanovshik'
            then
                raise exception 'This row only for Postanovshikov!';
        end if;
        return new;
    end;
    $$
    language 'plpgsql';

create or replace trigger check_p_t
    before insert or update on type_track
    for each row
    execute function check_p();

    create or replace function check_s() returns trigger
    as
    $$
    declare
        s_id int := new.id_human;
    begin
        if (select role from take_a_part where take_a_part.id_human = s_id limit 1) != 'Sudya'
            then
                raise exception 'This row only for Sudya!';
        end if;
        return new;
    end;
    $$
    language 'plpgsql';


create or replace trigger check_s_t
    before insert or update on traking 
    for each row
    execute function check_s();
    
    
 
