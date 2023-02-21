-- - View all products.

-- DROP VIEW IF EXISTS product.view_all_product;
-- CREATE VIEW product.view_all_product AS
-- 	SELECT p.product_id product_id,
-- 		p.product_name product_name,
-- 		b.brand_name brand_name,
-- 		c.category_name category_name,
-- 		p.model_year,
-- 		p.list_price,
-- 		p.avg_rating,
-- 		p.total_review,
-- 		p.discontinued
-- 	FROM product.products p
-- 		JOIN product.brands b USING (brand_id)
-- 		JOIN product.categories c USING (category_id);
		
DROP FUNCTION IF EXISTS product.view_all_product();
CREATE OR REPLACE FUNCTION product.view_all_product()  
RETURNS TABLE(product_id BIGINT, product_name VARCHAR(255), brand_name VARCHAR(255), category_name VARCHAR(255), model_year CHAR(4), list_price DECIMAL(10,2), avg_rating DECIMAL(2,1), total_review BIGINT, discontinued boolean)
LANGUAGE plpgsql
AS $$ 
BEGIN 
	RETURN QUERY  
	SELECT p.product_id product_id,
		p.product_name product_name,
		b.brand_name brand_name,
		c.category_name category_name,
		p.model_year,
		p.list_price,
		p.avg_rating,
		p.total_review,
		p.discontinued
	FROM product.products p
		JOIN product.brands b USING (brand_id)
		JOIN product.categories c USING (category_id); 
END;
$$;

DROP FUNCTION IF EXISTS product.view_active_product();
CREATE OR REPLACE FUNCTION product.view_active_product()  
RETURNS TABLE(product_id BIGINT, product_name VARCHAR(255), brand_name VARCHAR(255), category_name VARCHAR(255), model_year CHAR(4), list_price DECIMAL(10,2), avg_rating DECIMAL(2,1), total_review BIGINT)
LANGUAGE plpgsql
AS $$ 
BEGIN 
	RETURN QUERY  
	SELECT v.product_id ,
		v.product_name ,
		v.brand_name ,
		v.category_name ,
		v.model_year,
		v.list_price,
		v.avg_rating,
		v.total_review
	FROM product.view_all_product() v
	where v.discontinued = false; 
END;
$$;

select * from product.view_active_product();

-- - View some products.

DROP FUNCTION IF EXISTS product.view_top_product;
CREATE OR REPLACE FUNCTION product.view_top_product(IN lt BIGINT)  
RETURNS TABLE(product_id BIGINT, product_name VARCHAR(255), brand_name VARCHAR(255), category_name VARCHAR(255), model_year CHAR(4), list_price DECIMAL(10,2), avg_rating DECIMAL(1,1), total_review BIGINT,discontinued BOOLEAN)
LANGUAGE plpgsql
AS $$ 
BEGIN 
	RETURN QUERY  
	SELECT * FROM product.view_all_product() ORDER BY avg_rating desc LIMIT lt; 
END;
$$;

-- - Search product by name

DROP FUNCTION IF EXISTS product.search_product_by_name;
CREATE OR REPLACE FUNCTION product.search_product_by_name(IN name VARCHAR(255))  
RETURNS TABLE(product_id BIGINT, product_name VARCHAR(255), brand_name VARCHAR(255), category_name VARCHAR(255), model_year CHAR(4), list_price DECIMAL(10,2), avg_rating DECIMAL(1,1), total_review BIGINT,discontinued BOOLEAN)
LANGUAGE plpgsql
AS $$ 
BEGIN 
	RETURN QUERY  
	SELECT * FROM product.view_all_product() v WHERE v.product_name ILIKE '%' || name || '%'; 
END;
$$;

-- - Search product by brand

DROP FUNCTION IF EXISTS product.search_product_by_brand;
CREATE OR REPLACE FUNCTION product.search_product_by_brand(IN name VARCHAR(255))  
RETURNS TABLE(product_id BIGINT, product_name VARCHAR(255), brand_name VARCHAR(255), category_name VARCHAR(255), model_year CHAR(4), list_price DECIMAL(10,2), avg_rating DECIMAL(1,1), total_review BIGINT,discontinued BOOLEAN)
LANGUAGE plpgsql
AS $$ 
BEGIN 
	RETURN QUERY  
	SELECT * FROM product.view_all_product() v WHERE v.brand_name ILIKE '%' || name || '%'; 
END;
$$;

-- - Search product by category.

DROP FUNCTION IF EXISTS product.search_product_by_category;
CREATE OR REPLACE FUNCTION product.search_product_by_category(IN name VARCHAR(255))  
RETURNS TABLE(product_id BIGINT, product_name VARCHAR(255), brand_name VARCHAR(255), category_name VARCHAR(255), model_year CHAR(4), list_price DECIMAL(10,2), avg_rating DECIMAL(1,1), total_review BIGINT,discontinued BOOLEAN)
LANGUAGE plpgsql
AS $$ 
BEGIN 
	RETURN QUERY  
	SELECT * FROM product.view_all_product() v WHERE v.category_name ILIKE '%' || name || '%'; 
END;
$$;

-- - Update product information.

-- Update price

DROP PROCEDURE IF EXISTS product.update_list_price;
CREATE PROCEDURE product.update_list_price(id BIGINT, price DECIMAL(10,2))
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE product.products
	SET list_price = $2
	WHERE product_id = $1;
END;
$$;

-- Delete product

-- DROP PROCEDURE IF EXISTS product.delete_product;
-- CREATE PROCEDURE product.delete_product(id BIGINT)
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
-- 	ALTER TABLE product.stocks
-- 		DROP CONSTRAINT fk_stock,
-- 		ADD CONSTRAINT fk_stock
--     FOREIGN KEY (product_id)
--       REFERENCES product.products(product_id) ON DELETE CASCADE;
-- 	DELETE FROM product.products p WHERE p.product_id = id;
-- END;
-- $$;

DROP PROCEDURE IF EXISTS product.discontinue_product;
CREATE PROCEDURE product.discontinue_product(id BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
-- 	ALTER TABLE product.stocks
-- 		DROP CONSTRAINT fk_stock,
-- 		ADD CONSTRAINT fk_stock
--     FOREIGN KEY (product_id)
--       REFERENCES product.products(product_id) ON DELETE CASCADE;
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
CREATE PROCEDURE product.update_product(product_id BIGINT, product_name VARCHAR(255), brand_name VARCHAR(255), category_name VARCHAR(255), model_year CHAR(4), list_price DECIMAL(10,2))
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
CREATE PROCEDURE product.add_product(product_name VARCHAR(255), brand_name VARCHAR(255), category_name VARCHAR(255), model_year CHAR(4), list_price DECIMAL(10,2))
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
	select  p.product_id ,p.product_name, s.quantity
	from product.products p 
	JOIN product.stocks s ON p.product_id = s.product_id;
END;
$$;

-- SELECT * FROM product.view_stock();


--Function update stock
DROP PROCEDURE IF EXISTS product.update_stock;
CREATE PROCEDURE product.update_stock(id BIGINT, amount bigint)
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE product.stocks
	SET quantity=amount
	WHERE product_id = id;
END;
$$;


--Function view item
DROP FUNCTION IF EXISTS product.view_available_item;
CREATE OR REPLACE FUNCTION product.view_available_item(id bigint)  
RETURNS TABLE(serial_code VARCHAR(255),mfg date,  color VARCHAR(255),RAM VARCHAR(255),ROM VARCHAR(255),total_price numeric(10,2))
LANGUAGE plpgsql
AS $$
BEGIN
	RETURN QUERY
	SELECT i.serial_code,i.mfg,c.color, c.RAM, c.ROM,(p.list_price+c.extra_charge) total_price
	FROM product.items i 
	JOIN product.products p ON p.product_id= i.product_id
	JOIN product.config c ON c.config_id = i.config_id
	WHERE i.product_id= id AND i.availability=TRUE;
END;
$$;


SELECT * FROM product.view_available_item(1);



