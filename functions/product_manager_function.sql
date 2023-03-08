CREATE OR REPLACE PROCEDURE product.new_brand(brand_name VARCHAR(255))
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO product.brands(brand_name) VALUES (brand_name);
END;
$$;

-- PRECEDURE new_category(category_name)

CREATE OR REPLACE PROCEDURE product.new_category(category_name VARCHAR(255))
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO product.categories(category_name) VALUES (category_name);
END;
$$;

-- PROCEDURE new_product()

CREATE OR REPLACE PROCEDURE product.new_product(product_name VARCHAR(255), brand_id BIGINT, category_id BIGINT, model_year CHAR(4), list_price DECIMAL(10,2))
LANGUAGE plpgsql
AS $$
BEGIN
  --INSERT TO TABLE product
  	INSERT INTO product.products(product_name, brand_id, category_id, model_year, list_price) VALUES (product_name, brand_id, category_id, model_year, list_price);
END;
$$;

-- PROCEDURE new_config(color,RAM,ROM,extra_charge)
CREATE or replace PROCEDURE product.new_config(colour_input VARCHAR(255), RAM_input VARCHAR(255), ROM_input VARCHAR(255), extra_charge decimal(10, 2))
LANGUAGE plpgsql
AS $$
BEGIN
	--INSERT into table config
	INSERT INTO product.config(color, RAM, ROM, extra_charge) VALUES (colour_input,RAM_input,ROM_input, extra_charge);
END;
$$;

-- PROCEDURE new_item(serial_code,product_id,MFG,config_id)
CREATE OR REPLACE PROCEDURE product.new_item(serial_code_input VARCHAR(255),product_id_input bigint,MFG_input date, config_id bigint)
LANGUAGE plpgsql
AS $$
BEGIN
	-- CHECK FOR DUPLICATE serial code and product_id
	IF NOT EXISTS (SELECT * FROM product.items WHERE serial_code = serial_code_input) AND EXISTS (SELECT * FROM product.products  WHERE product_id = product_id_input)
	THEN
			INSERT INTO product.items VALUES (serial_code_input, product_id_input,MFG_input,config_id);
	ELSE
		RAISE NOTICE 'Error.... There is something wrong with your adding data!';
	END IF;
END;
$$;

DROP PROCEDURE IF EXISTS product.discontinue_product;
CREATE PROCEDURE product.discontinue_product(id BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN

	UPDATE product.products
	SET discontinued=TRUE
	WHERE product_id = id;
END;
$$;

CREATE OR REPLACE FUNCTION search_id_brand(brand_name VARCHAR) RETURNS BIGINT
LANGUAGE plpgsql
AS $$
DECLARE brand_id BIGINT;
BEGIN
	SELECT b.brand_id INTO brand_id FROM product.brands b
	WHERE b.brand_name = $1;
	RETURN brand_id;
END;
$$;

CREATE OR REPLACE FUNCTION search_id_category(category_name VARCHAR) RETURNS BIGINT
LANGUAGE plpgsql
AS $$
DECLARE category_id BIGINT;
BEGIN
	SELECT c.category_id INTO category_id FROM product.categories c
	WHERE c.category_name = $1;
	RETURN category_id;
END;
$$;

-- update product
DROP PROCEDURE IF EXISTS product.update_product;
CREATE PROCEDURE product.update_product(product_id BIGINT, product_name VARCHAR(255), brand_name VARCHAR(255), category_name VARCHAR(255), model_year CHAR(4), list_price NUMERIC(10,2))
LANGUAGE plpgsql
AS $$
DECLARE brand_ids BIGINT;
				category_ids BIGINT;
BEGIN
	SELECT search_id_brand($3) INTO brand_ids;
	SELECT search_id_category($4) INTO category_ids;

	IF brand_ids IS NULL
	THEN
		CALL product.new_brand(brand_name);
		SELECT search_id_brand($3) INTO brand_ids;
	END IF;

	IF category_ids IS NULL
	THEN 
		CALL product.new_category(category_name);
		SELECT search_id_category($4) INTO category_ids;
	END IF;

	UPDATE product.products p
	SET product_name = $2, brand_id = brand_ids, category_id = category_ids, model_year = $5, list_price = $6
	WHERE p.product_id = $1;
END;
$$;

-- add product
DROP PROCEDURE IF EXISTS product.add_product;
CREATE PROCEDURE product.add_product(product_name VARCHAR(255), brand_name VARCHAR(255), category_name VARCHAR(255), model_year CHAR(4), list_price NUMERIC(10,2))
LANGUAGE plpgsql
AS $$
DECLARE brand_id BIGINT;
				category_id BIGINT;
BEGIN
	SELECT search_id_brand($2) INTO brand_id;
	SELECT search_id_category($3) INTO category_id;

	IF brand_id IS NULL
	THEN
		CALL product.new_brand(brand_name);
		SELECT search_id_brand($2) INTO brand_id;
	END IF;

	IF category_id IS NULL
	THEN 
		CALL product.new_category(category_name);
		SELECT search_id_category($3) INTO category_id;
	END IF;

	INSERT INTO product.products(product_name, brand_id, category_id, model_year, list_price) VALUES (product_name, brand_id, category_id, model_year, list_price);
END;
$$;


--Warehouse Management Functionalities
-- Function view stock 
DROP FUNCTION IF EXISTS product.view_stock;
CREATE OR REPLACE FUNCTION product.view_stock()  
RETURNS TABLE(product_id bigint,product_name VARCHAR(255), quantity bigint)
LANGUAGE plpgsql
AS $$ 
BEGIN 
	RETURN QUERY  
	select  p.product_id ,p.product_name, p.quantity
	from product.products p;
END;
$$;

-- SELECT * FROM product.view_stock();


--Function update stock
DROP PROCEDURE IF EXISTS product.update_stock;
CREATE PROCEDURE product.update_stock(id BIGINT, amount bigint)
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE product.products
	SET quantity=amount
	WHERE product_id = id;
END;
$$;