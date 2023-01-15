-- PROCEDURE new_item(serial_code,product_id,MFG,color,RAM,ROM)
DROP PROCEDURE IF EXISTS product.new_item;
CREATE PROCEDURE product.new_item(serial_code_input VARCHAR(255),product_id_input bigint,MFG_input date, colour_input VARCHAR(255), RAM_input VARCHAR(255), ROM_input VARCHAR(255) )
LANGUAGE plpgsql
AS $$
BEGIN
	-- CHECK FOR DUPLICATE serial code and product_id
	IF NOT EXISTS (SELECT * FROM product.items WHERE serial_code = serial_code_input) AND EXISTS (SELECT * FROM product.products  WHERE product_id = product_id_input)
	THEN
		BEGIN
			--INSERT into table items
			INSERT INTO product.items VALUES (serial_code_input, product_id_input,MFG_input,colour_input,RAM_input,ROM_input);
			--Update stock 
			UPDATE product.stocks 
			SET quantity= quantity+1 
			WHERE product_id=product_id_input;
		END;
	ELSE
		RAISE NOTICE 'Error.... There is something wrong with your adding data!';
	END IF;
END;
$$;

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

--Function to random colour
DROP FUNCTION IF EXISTS random_colour;
Create or replace function random_colour() returns varchar as
$$
declare
	white varchar := 'white';
	black varchar:='black';
	grey varchar:= 'grey';
	rand int ;
	 result varchar := '';
begin
	rand= trunc(random()*3+1);
	CASE
    	WHEN rand=1 THEN result= white ;        
        WHEN rand=2 THEN result= black;   
        WHEN rand=3 THEN result= grey;
     END CASE;
	 return result;
end;
$$ language plpgsql;

--function to random date
DROP FUNCTION IF EXISTS random_date;
Create or replace function random_date() returns date as
$$
begin
	 return timestamp '2014-01-10 20:00:00' +
       random() * (NOW() -
                   timestamp '2014-01-10 10:00:00');
end;
$$ language plpgsql;


--function to random data
DROP PROCEDURE IF EXISTS product.generate_new_item;
CREATE PROCEDURE product.generate_new_item()
LANGUAGE plpgsql
AS $$
BEGIN
	FOR product_id_input in 1..10 LOOP
		FOR cnt IN 1..10000 LOOP
    			IF (product_id_input IN (1,2,8))
				THEN 
					BEGIN 
						CALL product.new_item(random_string(8),product_id_input,random_date(),random_colour(),POWER(2,trunc(random()*8))||' '||'GB',POWER(2,trunc(random()*8))||' '||'GB');
					END;
				ELSE 
					BEGIN
						CALL product.new_item(random_string(8),product_id_input,random_date(),random_colour(),NULL,NULL);
					END;
				END IF;
   			END LOOP;
    END LOOP;
END;
$$;

BEGIN ;
CALL product.generate_new_item() ;
SELECT * FROM product.items;
ROLLBACK;