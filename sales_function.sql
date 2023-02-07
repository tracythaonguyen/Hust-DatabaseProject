-- PROCEDURE add_to_cart
DROP PROCEDURE IF EXISTS sales.add_to_cart;
CREATE OR REPLACE PROCEDURE sales.add_to_cart(customer_id BIGINT,serial_code VARCHAR(255))
LANGUAGE plpgsql
AS $$
BEGIN
	--INSERT INTO TABLE cart
	INSERT INTO cart(customer_id,serial_code) VALUES (customer_id,serial_code);

END;
$$;

-- procedure view_cart
DROP PROCEDURE IF EXISTS sales.view_cart;
create or replace procedure sales.view_cart(customer_id_input bigint)
language plpgsql
as $$
begin
	select p.product_name, c.serial_code, 
		cf.color, cf.ram, cf.rom, sum(p.list_price + cf.extra_charge) as total_price
	from sales.cart c
	inner join product.items i
		on c.serial_code = i.serial_code
	inner join product.products p
		on i.product_id = p.product_id
	inner join product.config cf
		on cf.config_id = i.config_id
	where c.customer_id = customer_id_input;
end
$$;

-- procedure remove_from_cart
DROP PROCEDURE IF EXISTS sales.remove_from_cart;
create or replace procedure sales.remove_from_cart(customer_id bigint, serial_code varchar(255))
language plpgsql
as $$
begin
	delete from sales.cart c where c.customer_id = customer_id and c.serial_code = serial_code;
end;
$$;

-- PROCEDURE make_order_offline
DROP PROCEDURE IF EXISTS sales.make_order_offline;
CREATE OR REPLACE PROCEDURE sales.make_order_offline(customer_id_input BIGINT,staff_id_input BIGINT)
LANGUAGE plpgsql
AS $$
DECLARE
order_id_input BIGINT ; 
serial_code_input BIGINT ; 
total_amount_input BIGINT ;
item_price BIGINT;
BEGIN
	total_amount_input := 0 ;
	--INSERT INTO TABLE orders
	INSERT INTO sales.orders(customer_id,order_status,order_date,staff_id) VALUES (customer_id_input,0,CURRENT_DATE,staff_id_input);
	
	-- find the latest order
	SELECT order_id INTO order_id_input 
		FROM sales.orders WHERE customer_id=customer_id_input ORDER BY order_id DESC LIMIT 1;
	
	-- insert each item from cart into order_details and remove them from cart
	-- find each item
	SELECT c.serial_code INTO serial_code_input 
		FROM cart c WHERE c.customer_id=customer_id_input order by c.serial_code limit 1;
	--INSERT INTO TABLE order_details
    while serial_code_input is not null loop
		--Caculating money of the item
		SELECT p.list_price +c.extra_charge INTO item_price 
		FROM product.items i
		JOIN product.products p on p.product_id=i.product_id 
		JOIN product.config c on c.config_id=i.config_id 
		WHERE i.serial_code=serial_code_input; 

		total_amount_input=total_amount_input+item_price;
		item_price=0;
		INSERT INTO sales.order_details(order_id,serial_code,discount) 
			VALUES (order_id_input, serial_code_input, 0);
		delete from sales.cart c where c.serial_code = serial_code_input;
	--insert purchased items to coverage
		insert into sales.coverages(serial_code,coverages_expired_date ) 
			values (serial_code_input, CURRENT_DATE + 365);
	--update item to be not available
		UPDATE product.items i set i.availability = false where i.serial_code = serial_code_input;
	--UPDATE stock
				UPDATE product.stocks 
				SET stock= stock-1
				WHERE product_id =(SELECT product_id 
								  FROM product.items
								  WHERE serial_code=serial_code_input);
	--increment next items
	SELECT c.serial_code INTO serial_code_input 
		FROM cart c WHERE c.customer_id=customer_id_input order by c.serial_code limit 1;
	end loop;
	
	-- Update orders
	UPDATE sales.orders
	SET total_amount=total_amount_input
	WHERE order_id=order_id_input;
END;
$$;

-- PROCEDURE make_order_online
DROP PROCEDURE IF EXISTS sales.make_order_online;
CREATE OR REPLACE PROCEDURE sales.make_order_online(customer_id_input BIGINT)
LANGUAGE plpgsql
AS $$
DECLARE
DECLARE
order_id_input BIGINT ; 
serial_code_input BIGINT ; 
total_amount_input BIGINT ;
item_price BIGINT;
BEGIN
	total_amount_input := 0 ;
	--INSERT INTO TABLE orders
	INSERT INTO sales.orders(customer_id,order_status,order_date,staff_id) VALUES (customer_id_input,0,CURRENT_DATE,NULL);
	
	-- find the latest order
	SELECT order_id INTO order_id_input 
		FROM sales.orders WHERE customer_id=customer_id_input ORDER BY order_id DESC LIMIT 1;
	
	-- insert each item from cart into order_details and remove them from cart
	-- find each item
	SELECT c.serial_code INTO serial_code_input 
		FROM cart c WHERE c.customer_id=customer_id_input order by c.serial_code limit 1;
	--INSERT INTO TABLE order_details
    while serial_code_input is not null loop
		--Caculating money of the item
		SELECT p.list_price +c.extra_charge INTO item_price 
		FROM product.items i
		JOIN product.products p on p.product_id=i.product_id 
		JOIN product.config c on c.config_id=i.config_id 
		WHERE i.serial_code=serial_code_input; 

		total_amount_input=total_amount_input+item_price;
		item_price=0;
		INSERT INTO sales.order_details(order_id,serial_code,discount) 
			VALUES (order_id_input, serial_code_input, 0);
		delete from sales.cart c where c.serial_code = serial_code_input;
		--insert purchased items to coverage
		insert into sales.coverages(serial_code,coverages_expired_date ) 
			values (serial_code_input, CURRENT_DATE + 365);
		--update item to be not available
		UPDATE product.items i set i.availability = false where i.serial_code = serial_code_input;
		--UPDATE stock
				UPDATE product.stocks 
				SET stock= stock-1
				WHERE product_id =(SELECT product_id 
								  FROM product.items
								  WHERE serial_code=serial_code_input);
		--increment next items
		SELECT c.serial_code INTO serial_code_input 
		FROM cart c WHERE c.customer_id=customer_id_input order by c.serial_code limit 1;
	end loop;
	
	-- Update orders
	UPDATE sales.orders
	SET total_amount=total_amount_input
	WHERE order_id=order_id_input;
END;
$$;

--procedure cancel order
DROP PROCEDURE IF EXISTS sales.cancel_order; 
CREATE OR REPLACE PROCEDURE sales.cancel_order(order_id_input BIGINT)
LANGUAGE plpgsql
AS $$
DECLARE order_date_inp DATE;
DEClARE serial_code_inp VARCHAR(255); 
BEGIN
	SELECT order_date INTO order_date_inp FROM sales.orders WHERE order_id=order_id_input;
	IF(CURRENT_DATE- order_date_inp <=2)
	THEN 
		BEGIN
			SELECT serial_code INTO serial_code_inp FROM sales.order_details WHERE order_id= order_id_input LIMIT 1;
			while serial_code_inp is not null loop
				-- UPDATE availability of the item
				UPDATE product.items
				SET availability= TRUE
				WHERE serial_code=serial_code_inp;
				--delete coverage 
				DELETE FROM sales.coverages 
				WHERE serial_code=serial_code_inp;
				-- delete item from order_detail
				DELETE FROM sales.order_details 
				WHERE serial_code=serial_code_inp;
				--UPDATE stock
				UPDATE product.stocks 
				SET stock= stock+1
				WHERE product_id =(SELECT product_id 
								  FROM product.items
								  WHERE serial_code=serial_code_inp);
				SELECT serial_code INTO serial_code_inp FROM sales.order_details WHERE order_id= order_id_input LIMIT 1;
			end loop;
		END;
	ELSE
		RAISE NOTICE 'Can not cancel orders after 2 days';
	END IF;
END;
$$;

--Procedure update info
DROP PROCEDURE IF EXISTS sales.update_info; 
CREATE OR REPLACE PROCEDURE sales.update_info(customer_id_input BIGINT,first_name_inp VARCHAR(255),last_name_inp VARCHAR(255), phone_inp VARCHAR(255), email_inp VARCHAR(255), street_inp VARCHAR(255), city_inp VARCHAR(255), user_name_input varchar(255),pass_word varchar(255))
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE sales.customers
	SET first_name = first_name_inp,
		last_name = last_name_inp,
		phone = phone_inp,
		email = email_inp,
		street = street_inp,
		city = city_inp,
		user_name = user_name_input,
		password=pass_word
	WHERE customer_id=customer_id_input;
END;
$$;

--Procedure update info
DROP PROCEDURE IF EXISTS sales.view_order_history; 
CREATE OR REPLACE PROCEDURE sales.view_order_history(customer_id_input BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	SELECT * FROM sales.orders WHERE customer_id =customer_id_input;
END;
$$;

--Procedure view order
DROP PROCEDURE IF EXISTS sales.view_detail_order_history; 
CREATE OR REPLACE PROCEDURE sales.view_detail_order_history(order_id_input BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	SELECT * FROM sales.orders_details WHERE order_id =order_id_input;
END;
$$;

--Procedure search order by id
DROP PROCEDURE IF EXISTS sales.search_order_by_id; 
CREATE OR REPLACE PROCEDURE sales.search_order_by_id(order_id_input BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	SELECT * FROM sales.orders o JOIN sales.order_details od ON o.order_id=od.order_id WHERE order_id =order_id_input;
END;
$$;

--Procedure search order by date
DROP PROCEDURE IF EXISTS sales.search_order_by_date; 
CREATE OR REPLACE PROCEDURE sales.search_order_by_date(order_date_input BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	SELECT * FROM sales.orders o JOIN sales.order_details od ON o.order_id=od.order_id WHERE order_date =order_date_input;
END;
$$;



