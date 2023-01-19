-- - View all products.

DROP VIEW IF EXISTS product.view_all_product;
CREATE VIEW product.view_all_product AS
	SELECT p.product_id id,
		p.product_name product_name,
		b.brand_name brand_name,
		c.category_name category_name,
		p.model_year,
		p.list_price,
		p.avg_rating,
		p.total_review
	FROM product.products p
		JOIN product.brands b USING (brand_id)
		JOIN product.categories c USING (category_id);

-- - View some products.

DROP FUNCTION IF EXISTS product.view_product_limit;
CREATE OR REPLACE FUNCTION product.view_product_limit(IN lt BIGINT)  
RETURNS TABLE(product_id BIGINT, product_name VARCHAR(255), brand_name VARCHAR(255), category_name VARCHAR(255), model_year CHAR(4), list_price DECIMAL(10,2), avg_rating DECIMAL(1,1), total_review BIGINT)
LANGUAGE plpgsql
AS $$ 
BEGIN 
	RETURN QUERY  
	SELECT * FROM product.view_all_product ORDER BY avg_rating LIMIT lt; 
END;
$$;

-- - Search product by name

DROP FUNCTION IF EXISTS product.search_product_by_name;
CREATE OR REPLACE FUNCTION product.search_product_by_name(IN name VARCHAR(255))  
RETURNS TABLE(product_id BIGINT, product_name VARCHAR(255), brand_name VARCHAR(255), category_name VARCHAR(255), model_year CHAR(4), list_price DECIMAL(10,2), avg_rating DECIMAL(1,1), total_review BIGINT)
LANGUAGE plpgsql
AS $$ 
BEGIN 
	RETURN QUERY  
	SELECT * FROM product.view_all_product v WHERE v.product_name = name; 
END;
$$;

-- - Search product by brand

DROP FUNCTION IF EXISTS product.search_product_by_brand;
CREATE OR REPLACE FUNCTION product.search_product_by_brand(IN name VARCHAR(255))  
RETURNS TABLE(product_id BIGINT, product_name VARCHAR(255), brand_name VARCHAR(255), category_name VARCHAR(255), model_year CHAR(4), list_price DECIMAL(10,2), avg_rating DECIMAL(1,1), total_review BIGINT)
LANGUAGE plpgsql
AS $$ 
BEGIN 
	RETURN QUERY  
	SELECT * FROM product.view_all_product v WHERE v.brand_name = name; 
END;
$$;

-- - Search product by category.

DROP FUNCTION IF EXISTS product.search_product_by_category;
CREATE OR REPLACE FUNCTION product.search_product_by_category(IN name VARCHAR(255))  
RETURNS TABLE(product_id BIGINT, product_name VARCHAR(255), brand_name VARCHAR(255), category_name VARCHAR(255), model_year CHAR(4), list_price DECIMAL(10,2), avg_rating DECIMAL(1,1), total_review BIGINT)
LANGUAGE plpgsql
AS $$ 
BEGIN 
	RETURN QUERY  
	SELECT * FROM product.view_all_product v WHERE v.category_name = name; 
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

DROP PROCEDURE IF EXISTS product.delete_product;
CREATE PROCEDURE product.delete_product(id BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	ALTER TABLE product.stocks
		DROP CONSTRAINT fk_stock,
		ADD CONSTRAINT fk_stock
    FOREIGN KEY (product_id)
      REFERENCES product.products(product_id) ON DELETE CASCADE;
	DELETE FROM product.products p WHERE p.product_id = id;
END;
$$;

-- còn nhiều, chưa viết hết