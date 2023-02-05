-- PROCEDURE add_to_cart
CREATE OR REPLACE PROCEDURE sales.add_to_cart(customer_id BIGINT,serial_code VARCHAR(255))
LANGUAGE plpgsql
AS $$
BEGIN
	--INSERT INTO TABLE cart
	INSERT INTO cart(customer_id,serial_code) VALUES (customer_id,serial_code);

END;
$$;

-- procedure view_cart
create or replace procedure sales.view_cart(customer_id bigint)
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
	where c.customer_id = customer_id;
end
$$;

-- procedure remove_from_cart
create or replace procedure sales.remove_from_cart(customer_id bigint, serial_code varchar(255))
language plpgsql
as $$
begin
	delete from sales.cart c where c.customer_id = customer_id and c.serial_code = serial_code
end
$$;

-- PROCEDURE make_order
CREATE OR REPLACE PROCEDURE sales.make_order(customer_id_input BIGINT,staff_id_input BIGINT)
LANGUAGE plpgsql
AS $$
DECLARE
order_id BIGINT ; 
serial_code BIGINT ; 
BEGIN
	--INSERT INTO TABLE orders
	INSERT INTO sales.orders(customer_id,order_date,staff_id) VALUES (customer_id_input,CURRENT_DATE,staff_id_input);
	
	-- find the latest order
	SELECT order_id INTO order_id 
		FROM sales.orders WHERE customer_id=customer_id_input ORDER BY order_id DESC LIMIT 1;
	
	-- insert each item from cart into order_details and remove them from cart
	-- find each item
	SELECT c.serial_code INTO serial_code 
		FROM cart c WHERE c.customer_id=customer_id_input order by c.serial_code limit 1;
	--INSERT INTO TABLE order_details
    while serial_code is not null loop
		INSERT INTO sales.order_details(order_id,serial_code,discount) 
			VALUES (order_id, serial_code, 0);
		delete from sales.cart c where c.serial_code = serial_code;
	--insert purchased items to coverage
		insert into sales.coverages(serial_code,coverages_expired_date ) 
			values (serial_code, CURRENT_DATE + 365)
	--update item to be not available
		alter table product.items i set i.availability = false where i.serial_code = serial_code;
	--increment next items
	SELECT c.serial_code INTO serial_code 
		FROM cart c WHERE c.customer_id=customer_id_input order by c.serial_code limit 1;
	end loop;
	
	-- Đoạn này thiếu phần:
	-- tính lại tổng tiền đơn hàng và insert vào bảng order
END;
$$;