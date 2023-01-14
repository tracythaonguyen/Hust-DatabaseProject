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
			--INSERT
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

SELECT * FROM product.items; 