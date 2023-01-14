-- PROCEDURE new_item(serial_code,product_id,MFG,color,RAM,ROM)
DROP FUNCTION IF EXISTS check_item;
CREATE OR REPLACE FUNCTION check_item (serial_code_input VARCHAR(255),product_id_input bigint,OUT result int) AS
$BODY$
DECLARE
BEGIN
    SELECT * FROM product.items b WHERE b.serial_code = serial_code_input;
    IF FOUND THEN
        result := 0;
        RETURN;
    end if;
	SELECT * FROM product.products c WHERE c.product_id = product_id_input;
	IF NOT FOUND THEN
        result := 0;
        RETURN;
    end if;
	
	result := 1;
    RETURN;
END
$BODY$ language plpgsql;


DROP PROCEDURE IF EXISTS product.new_item;
CREATE PROCEDURE product.new_item(serial_code VARCHAR(255),product_id bigint,MFG date, colour VARCHAR(255), RAM VARCHAR(255), ROM VARCHAR(255) )
LANGUAGE plpgsql
AS $$
BEGIN
	IF (check_item(serial_code,product_id)=1)
	THEN
		BEGIN
			--INSERT
			INSERT INTO product.items VALUES (serial_code, product_id,MFG,colour,RAM,ROM);
			--Update stock 
			UPDATE product.stocks a
			SET quantity= quantity+1 
			WHERE a.product_id=product_id;
		END;
	ELSE
		RAISE NOTICE 'Error.... There is something wrong with your adding data!';
	END IF;
END;
$$;

BEGIN ;
CALL product.new_item('123123213',1,'12321','hgjhd','hgsajgdsadyg');
ROLLBACK; 