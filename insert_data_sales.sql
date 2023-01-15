-- PROCEDURE new_staff(first_name,last_name,phone,email,street,city,active,manager_id)
-- Auto generate staff_id
DROP PROCEDURE IF EXISTS sales.new_staff;
CREATE PROCEDURE sales.new_staff(first_name VARCHAR(255),last_name VARCHAR(255), phone VARCHAR(255), email VARCHAR(255), street VARCHAR(255), city VARCHAR(255), active boolean,manager_id bigint)
LANGUAGE plpgsql
AS $$
DECLARE staff_id BIGINT;
BEGIN
      SELECT COUNT(*)+1 INTO staff_id FROM sales.staffs;
	  --INSERT
	  INSERT INTO sales.staffs VALUES (staff_id,first_name,last_name,phone,email,street,city,active,manager_id);
END;
$$;


--Function to random phonenumber
DROP FUNCTION IF EXISTS random_phonenumber;
Create or replace function random_phonenumber() returns varchar as
$$
declare
  chars text[] := '{0,1,2,3,4,5,6,7,8,9}';
  result varchar := '0';
  i integer := 0;
begin
  for i in 1..9 loop
    result := result || chars[1+random()*(array_length(chars, 1)-1)];
  end loop;
  return result;
end;
$$ language plpgsql;

--Function to random serial code
DROP FUNCTION IF EXISTS random_string;
Create or replace function random_string(length integer) returns varchar as
$$
declare
  chars text[] := '{0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z}';
  result varchar := '';
  i integer := 0;
begin
  if length < 0 then
    raise exception 'Given length cannot be less than 0';
  end if;
  for i in 1..length loop
    result := result || chars[1+random()*(array_length(chars, 1)-1)];
  end loop;
  return result;
end;
$$ language plpgsql;

--Function to random lastname
DROP FUNCTION IF EXISTS random_lastname;
Create or replace function random_lastname() returns varchar as
$$
declare
	lastname1 varchar := 'Do';
	lastname2 varchar:='Nguyen';
	lastname3 varchar:= 'Bui';
	lastname4 varchar:='Le';
	lastname5 varchar:='Dao';
	lastname6 varchar:='Tran';
	rand int ;
	 result varchar := '';
begin
	rand= trunc(random()*6+1);
	CASE
    	WHEN rand=1 THEN result= lastname1 ;        
        WHEN rand=2 THEN result= lastname2;   
        WHEN rand=3 THEN result= lastname3;
		WHEN rand=4 THEN result= lastname4;
		WHEN rand=5 THEN result= lastname5;
		WHEN rand=6 THEN result= lastname6;
     END CASE;
	 return result;
end;
$$ language plpgsql;

--Function to random firstname
DROP FUNCTION IF EXISTS random_firstname;
Create or replace function random_firstname() returns varchar as
$$
declare
	firstname1 varchar := 'Minh';
	firstname2 varchar:='Trung';
	firstname3 varchar:= 'Thao';
	firstname4 varchar:= 'Hoang Anh';
	firstname5 varchar:= 'Huy';
	firstname6 varchar:= 'Phuong';
	firstname7 varchar:= 'Quang';
	firstname8 varchar:= 'Duc';
	firstname9 varchar:= 'Hai';
	firstname10 varchar:= 'Chien';
	rand int ;
	 result varchar := '';
begin
	rand= trunc(random()*10+1);
	CASE
    	WHEN rand=1 THEN result= firstname1 ;        
        WHEN rand=2 THEN result= firstname2;   
        WHEN rand=3 THEN result= firstname3;
		WHEN rand=4 THEN result= firstname4;
		WHEN rand=5 THEN result= firstname5;
		WHEN rand=6 THEN result= firstname6;
		WHEN rand=7 THEN result= firstname7;
		WHEN rand=8 THEN result= firstname8;
		WHEN rand=9 THEN result= firstname9;
		WHEN rand=10 THEN result= firstname10;
		
     END CASE;
	 return result;
end;
$$ language plpgsql;

--Function to random city
DROP FUNCTION IF EXISTS random_city;
Create or replace function random_city() returns varchar as
$$
declare
	city1 varchar:= 'Hai Phong';
	city2 varchar:='Ha Noi';
	city3 varchar:= 'HCM';
	rand int ;
	 result varchar := '';
begin
	rand= trunc(random()*3+1);
	CASE
    	WHEN rand=1 THEN result= city1;        
        WHEN rand=2 THEN result= city2;   
        WHEN rand=3 THEN result= city3;
     END CASE;
	 return result;
end;
$$ language plpgsql;

--Function to random city
DROP FUNCTION IF EXISTS random_street;
Create or replace function random_street() returns varchar as
$$
declare
	street1 varchar := 'Ton Duc Thang';
	street2 varchar:='Tran Phu';
	street3 varchar:= 'Nguyen Duc Canh';
	rand int ;
	 result varchar := '';
begin
	rand= trunc(random()*3+1);
	CASE
    	WHEN rand=1 THEN result= street1 ;        
        WHEN rand=2 THEN result= street2;   
        WHEN rand=3 THEN result= street3;
     END CASE;
	 return result;
end;
$$ language plpgsql;

--Function to random city
DROP FUNCTION IF EXISTS random_active;
Create or replace function random_active() returns boolean as
$$
declare
	rand int ;
	 result boolean ;
begin
	rand= trunc(random()*2+1);
	CASE
    	WHEN rand=1 THEN result= 'YES':: boolean;        
        WHEN rand=2 THEN result= 'NO':: boolean;   
     END CASE;
	 return result;
end;
$$ language plpgsql;

--Function to random city
DROP FUNCTION IF EXISTS random_manager;
Create or replace function random_manager() returns bigint as
$$
declare
	rand int ;
	 result bigint ;
begin
	rand= trunc(random()*2+1);
	CASE
    	WHEN rand=1 THEN result= NULL;        
        WHEN rand=2 THEN result= 1; 
     END CASE;
	 return result;
end;
$$ language plpgsql;


DROP PROCEDURE IF EXISTS sales.generate_new_staff;
CREATE PROCEDURE sales.generate_new_staff()
LANGUAGE plpgsql
AS $$
BEGIN
	FOR cnt in 1..50 LOOP
    	CALL sales.new_staff(random_firstname(),random_lastname(),random_phonenumber(),random_string(10)||'@gmail.com',random_street(),random_city(),random_active(),random_manager());
    END LOOP;
END;
$$;

BEGIN;
CALL sales.generate_new_staff();
SELECT * from sales.staffs;
ROLLBACK ;

-- Trung đang làm đoạn này chưa xong thì thấy thảo đần
-- -- PROCEDURE new_customer(first_name,last_name,phone,email,street,city, username, password)
-- -- Auto generate customer_id
-- DROP PROCEDURE IF EXISTS sales.new_customer;
-- CREATE PROCEDURE sales.new_customer(first_name VARCHAR(255),last_name VARCHAR(255), phone VARCHAR(255), email VARCHAR(255), street VARCHAR(255), city VARCHAR(255), user_name varchar(255),pass_word varchar(255))
-- LANGUAGE plpgsql
-- AS $$
-- DECLARE customer_id BIGINT;
-- BEGIN
--       SELECT COUNT(*)+1 INTO staff_id FROM sales.staffs;
-- 	  --INSERT
-- 	  INSERT INTO sales.staffs VALUES (staff_id,first_name,last_name,phone,email,street,city,active,manager_id);
-- END;
-- $$;

