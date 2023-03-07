-- PROCEDURE add_to_cart
DROP PROCEDURE IF EXISTS  sales.add_to_cart;
CREATE OR REPLACE PROCEDURE sales.add_to_cart(customer_id_input BIGINT,serial_code_input VARCHAR(255))
LANGUAGE plpgsql
AS $$
BEGIN
	if (select availability from product.items i where i.serial_code = serial_code_input) = false
		then RAISE NOTICE 'Item no longer exists';
	--INSERT INTO TABLE cart
	else
		INSERT INTO sales.cart(customer_id,serial_code) VALUES (customer_id_input,serial_code_input);
	end if;
END;
$$;

--call sales.add_to_cart(1,'XK652W3M');

--function view_cart
DROP FUNCTION IF EXISTS  sales.view_cart;

CREATE OR REPLACE FUNCTION sales.view_cart(in customer_id_input bigint)  
RETURNS TABLE(product_name VARCHAR(255), serial_code VARCHAR(255), color VARCHAR(255), ram VARCHAR(255), rom VARCHAR(255),
			  total_price DECIMAL(10,2))
LANGUAGE plpgsql
AS $$ 
BEGIN 
	RETURN QUERY  
	select  p.product_name, c.serial_code, 
		cf.color, cf.ram, cf.rom, (p.list_price+ cf.extra_charge) total_price
	from sales.cart c
	inner join product.items i
		on c.serial_code = i.serial_code
	inner join product.products p
		on i.product_id = p.product_id
	inner join product.config cf
		on cf.config_id = i.config_id
	where c.customer_id = customer_id_input; 
END;
$$;

-- SELECT * FROM sales.view_cart(1);
-- procedure remove_from_cart
DROP PROCEDURE IF EXISTS  sales.remove_from_cart;

create or replace procedure sales.remove_from_cart(customer_id_input bigint, serial_code_input varchar(255))
language plpgsql
as $$
begin
	delete from sales.cart c where c.customer_id = customer_id_input and c.serial_code = serial_code_input;
end;
$$;





DROP PROCEDURE IF EXISTS  sales.remove_from_cart_by_id;

create or replace procedure sales.remove_from_cart_by_id(customer_id_input bigint)
language plpgsql
as $$
begin
	delete from sales.cart c where c.customer_id = customer_id_input ;
end;
$$;


-- make order offline
DROP PROCEDURE IF EXISTS  sales.make_order_offline;

CREATE OR REPLACE PROCEDURE sales.make_order_offline(customer_id_input BIGINT, staff_id_input BIGINT)
LANGUAGE plpgsql
AS $$
DECLARE
order_id_input BIGINT ; 
serial_code_input varchar(255) ; 
total_amount_input decimal(10, 2) := 0;
item_price decimal(10, 2);
BEGIN
	-- Check if staff active
	if staff_id_input is not NULL 
	and (select active from sales.staffs s where s.staff_id = staff_id_input) is FALSE
		then RAISE NOTICE 'Staff no longer works';
	-- Check for empty cart
	elsif NOT EXISTS (select cart_id from sales.cart c where c.customer_id = customer_id_input) 
		then RAISE NOTICE 'Nothing in the cart, can not make order';	
	else
	begin

	INSERT INTO sales.orders(customer_id,order_status,order_date,staff_id) VALUES (customer_id_input,0,CURRENT_DATE,staff_id_input);
	
	-- find the latest order
	SELECT order_id INTO order_id_input 
		FROM sales.orders WHERE customer_id=customer_id_input ORDER BY order_id DESC LIMIT 1;
	
	-- insert each item from cart into order_details and remove them from cart
	-- find each item
	SELECT c.serial_code INTO serial_code_input 
		FROM sales.cart c WHERE c.customer_id=customer_id_input order by c.serial_code limit 1;
	--INSERT INTO TABLE order_details
    while serial_code_input is not null loop
		--Caculating money of the item
		SELECT p.list_price +c.extra_charge INTO item_price 
		FROM product.items i
		JOIN product.products p on p.product_id=i.product_id 
		JOIN product.config c on c.config_id=i.config_id 
		WHERE i.serial_code=serial_code_input; 

		total_amount_input=total_amount_input+item_price;
		--discount=0;
		INSERT INTO sales.order_details(order_id,serial_code,discount,coverages_expired_date) 
			VALUES (order_id_input, serial_code_input, 0, CURRENT_DATE + 365);
		delete from sales.cart c where c.serial_code = serial_code_input;
		--update item to be not available
		UPDATE product.items set availability = false where serial_code = serial_code_input;
		--UPDATE stock
				UPDATE product.products 
				SET quantity= quantity-1
				WHERE product_id =(SELECT product_id 
								  FROM product.items
								  WHERE serial_code=serial_code_input);
		--increment next items
		SELECT c.serial_code INTO serial_code_input 
		FROM sales.cart c WHERE c.customer_id=customer_id_input order by c.serial_code limit 1;
	end loop;
	
	-- Update orders
	UPDATE sales.orders
	SET total_amount=total_amount_input
	WHERE order_id=order_id_input;
	end;
	end if;
END;
$$;

--select * from sales.staffs;

--call sales.add_to_cart(3, '4HX6QQR4');
--call sales.add_to_cart(1, '4HX6QQR4');
--call sales.make_order_online(1);

-- PROCEDURE make_order_online
DROP PROCEDURE IF EXISTS  sales.make_order_online;

CREATE OR REPLACE PROCEDURE sales.make_order_online(customer_id_input BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	call sales.make_order_offline(customer_id_input, NULL);
END;
$$;

--BEGIN ; 
--call sales.make_order_offline(1, NULL);
--select * From sales.orders;
--ROLLBACK;

--select * from sales.orders;
--select * from sales.order_details where order_id = 16;
--select * from sales.cart;
--select * from product.items where serial_code = '4HX6QQR4';

--select product_id from product.items i
--	inner join sales.order_details d on i.serial_code = d.serial_code;

-- procedure cancel order
DROP PROCEDURE IF EXISTS sales.cancel_order;
CREATE OR REPLACE PROCEDURE sales.cancel_order(customer_id_input BIGINT, order_id_input BIGINT)
LANGUAGE plpgsql
AS $$
DECLARE order_status_inp INT;
DEClARE serial_code_inp VARCHAR(255); 
BEGIN
if customer_id_input not in (select customer_id from sales.customers)
  then RAISE NOTICE 'There is no such customer';
elsif order_id_input not in (select order_id from sales.orders)
  then RAISE NOTICE 'There is no such order';
elsif (SELECT customer_id FROM sales.orders WHERE order_id=order_id_input) != customer_id_input
  then RAISE NOTICE 'You did not order this order, can not cancel order';
else
  begin
  SELECT order_status INTO order_status_inp FROM sales.orders WHERE order_id=order_id_input;
  IF(order_status_inp = 0)
  THEN 
    BEGIN
      SELECT serial_code INTO serial_code_inp FROM sales.order_details WHERE order_id= order_id_input LIMIT 1;
      while serial_code_inp is not null loop
        -- UPDATE availability of the item
        UPDATE product.items
        SET availability= TRUE
        WHERE serial_code=serial_code_inp;
        -- delete item from order_detail
        DELETE FROM sales.order_details 
        WHERE serial_code=serial_code_inp;
        --UPDATE stock
        UPDATE product.products 
        SET quantity= quantity+1
        WHERE product_id =(SELECT product_id 
                  FROM product.items
                  WHERE serial_code=serial_code_inp);
        SELECT serial_code INTO serial_code_inp FROM sales.order_details WHERE order_id= order_id_input LIMIT 1;
      end loop;
      UPDATE sales.orders
      set order_status = 2 where order_id = order_id_input;   
    END;
  ELSIF (order_status_inp = 1)
    then RAISE NOTICE 'Order already processed, can not cancel';
  else
    RAISE NOTICE 'Order already canceled';
  END IF;
  end;
end if;
END;
$$;


--call sales.cancel_order(1, 16);
--Function view customerinfo
DROP FUNCTION IF EXISTS sales.view_customer_info();
CREATE OR REPLACE FUNCTION sales.view_customer_info()  
RETURNS TABLE(customer_id BIGINT,first_name VARCHAR(255),last_name VARCHAR(255), phone VARCHAR(255), email VARCHAR(255), street VARCHAR(255), city VARCHAR(255),account_id bigint, user_name varchar(255),pass_word varchar(255))
LANGUAGE plpgsql
AS $$ 
BEGIN 
	RETURN QUERY  
	SELECT c.*, a.user_name, a.password
	FROM sales.customers c
	JOIN sys.accounts a ON c.account_id =a.account_id; 
		 
END;
$$;

--SELECT * FROM sales.view_customer_info();


--Procedure update info 
DROP PROCEDURE IF EXISTS  sales.update_info;

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
		city = city_inp
	WHERE customer_id=customer_id_input;
	
	UPDATE sys.accounts
	SET user_name = user_name_input,
		password=pass_word
	WHERE account_id = (SELECT account_id FROM sales.customers WHERE customer_id=customer_id_input);
END;
$$;
-- CALL sales.update_info(1,'Minh','Do','0865943283','minhdotpc@gmail.com','Tran Nguyen Han','Hai Phong','minhdo','220702');
-- select * from sales.view_customer_info() WHERE customer_id=2;
-- select * from sys.accounts;
--Function view_order_history
DROP function IF EXISTS  sales.view_order_history;

CREATE OR REPLACE function sales.view_order_history(customer_id_input BIGINT)
RETURNS TABLE(order_id bigint, order_status text, order_date date, 
			  staff_id bigint,total_amount DECIMAL(10,2))
LANGUAGE plpgsql
AS $$
BEGIN
	return query 
	SELECT o.order_id, 
		case
		when o.order_status = 0 then 'Pending'
		when o.order_status = 1 then 'Processed'
		when o.order_status = 2 then 'Canceled'
		end order_status,
		o.order_date, o.staff_id, o.total_amount
	FROM sales.orders o WHERE o.customer_id = customer_id_input;
END;
$$;

--select * from sales.view_order_history(3);
--select * from sales.orders;

--function view order detail
--Input phải có customer_id để lọc nếu ko 1 khách hàng có thể xem đơn hàng của khách hàng khác
DROP FUNCTION IF EXISTS  sales.view_detail_order_history;

CREATE OR REPLACE function sales.view_detail_order_history(customer_id_input BIGINT,order_id_input BIGINT)
RETURNS TABLE(product_name VARCHAR(255), serial_code VARCHAR(255), color VARCHAR(255), ram VARCHAR(255), rom VARCHAR(255),
			  list_price DECIMAL(10,2), extra_charge DECIMAL(10,2))
LANGUAGE plpgsql
AS $$
BEGIN
	if (SELECT customer_id FROM sales.orders WHERE order_id=order_id_input) != customer_id_input
		then RAISE NOTICE 'You did not order this order, can not view order detail';
	else
	RETURN QUERY  
	select  p.product_name, d.serial_code, 
		cf.color, cf.ram, cf.rom, p.list_price , cf.extra_charge
	from sales.order_details d
	inner join product.items i
		on d.serial_code = i.serial_code
	inner join product.products p
		on i.product_id = p.product_id
	inner join product.config cf
		on cf.config_id = i.config_id
	where d.order_id = order_id_input;
	end if;
END;
$$;

--select * from sales.orders;
--select * from sales.view_detail_order_history(1,15);

--function search order by date
DROP FUNCTION IF EXISTS  sales.search_order_by_date;

CREATE OR REPLACE function sales.search_order_by_date(customer_id_input BIGINT, order_date_input date)
RETURNS TABLE(order_id bigint, order_status text,order_date date ,staff_id bigint,total_amount DECIMAL(10,2))
LANGUAGE plpgsql
AS $$
BEGIN
	return query 
	select o.order_id, o.order_status,o.order_date ,o.staff_id, o.total_amount
	from sales.view_order_history(customer_id_input) o
	WHERE o.order_date = order_date_input;
END;
$$;

--select * from sales.search_order_by_date(3, '2023-02-16');
--select * from sales.orders;

-- lịch sử sản phẩm của từng khách hàng sẽ hay dùng nên t lập 1 view tổng hợp

create view sales.product_bought_history as
select o.customer_id, i.product_id, count(od.serial_code) total_bought
from sales.orders o
inner join sales.order_details od on o.order_id = od.order_id
inner join product.items i on i.serial_code = od.serial_code 
group by o.customer_id, i.product_id;

--select * from sales.order_details;

DROP PROCEDURE IF EXISTS  sales.rate_product;

CREATE OR REPLACE PROCEDURE sales.rate_product(customer_id_input BIGINT, product_id_input BIGINT, score DECIMAL(2,1))
LANGUAGE plpgsql
AS $$
declare 
avg_rating_var decimal(2,1);
total_review_var bigint;

BEGIN
	if (select customer_id from sales.product_bought_history 
		where customer_id = customer_id_input and product_id = product_id_input) is null
		then raise notice 'You have not order this product yet, can not rate';
	else 
		begin 
			select avg_rating, total_review into avg_rating_var, total_review_var 
				from product.products where product_id = product_id_input;
			
			UPDATE product.products
			SET avg_rating = (avg_rating_var * total_review_var + score)/(total_review_var+1)
				,total_review = total_review_var + 1
			where product_id = product_id_input;
		end;
	end if;
END;
$$;

--select * from sales.product_bought_history;
--call sales.rate_product(1, 1, 5.0);
-- select * from product.products;
-- call sales.rate_product(1, 1, 4.0);


-- SALE ANALYSIS FUNCTION
-- số lượng bán ra của từng sản phẩm
DROP FUNCTION IF EXISTS  sales.product_total_sold;

CREATE OR REPLACE function sales.product_total_sold()
RETURNS TABLE(product_id bigint, product_name varchar(255), total_sold bigint)
LANGUAGE plpgsql
AS $$
BEGIN
	return query 
	select pb.product_id, p.product_name, sum(pb.total_bought)::bigint total_sold
	from sales.product_bought_history pb
	inner join product.products p on p.product_id = pb.product_id
	group by pb.product_id, p.product_name
	order by total_sold desc;
END;
$$;

--select * from sales.product_total_sold();
--select * from sales.product_bought_history;

-- doanh thu của từng sản phẩm
DROP function IF EXISTS  sales.product_revenue;

CREATE OR REPLACE function sales.product_revenue()
RETURNS TABLE(product_id bigint, product_name varchar(255), total_revenue decimal(10,2))
LANGUAGE plpgsql
AS $$
BEGIN
	return query 
	select p.product_id, p.product_name, sum(p.list_price + c.extra_charge) total_revenue
	from sales.order_details od
	inner join product.items i on od.serial_code = i.serial_code
	inner join product.products p on i.product_id = p.product_id
	inner join product.config c on c.config_id = i.config_id
	group by p.product_id, p.product_name
	order by total_revenue desc;
END;
$$;

--select * from sales.order_details;
--select * from product.products;
--select * from sales.product_revenue();

DROP function IF EXISTS  sales.customer_revenue;

CREATE OR REPLACE function sales.customer_revenue()
RETURNS TABLE(customer_id bigint, customer_name text, total_revenue decimal(10,2))
LANGUAGE plpgsql
AS $$
BEGIN
	return query 
	select c.customer_id, c.first_name || ' ' || c.last_name fullname, sum (total_amount) as total_revenue
	from sales.customers c
	inner join sales.orders o on c.customer_id = o.customer_id
	where o.order_status != 2
	group by c.customer_id, c.first_name, c.last_name
	order by total_revenue desc;
END;
$$;

--select * from sales.customer_revenue();

DROP function IF EXISTS  sales.staff_revenue;

CREATE OR REPLACE function sales.staff_revenue()
RETURNS TABLE(staff_id bigint, staff_name text, total_revenue decimal(10,2))
LANGUAGE plpgsql
AS $$
BEGIN
	return query 
	select s.staff_id, s.first_name || ' ' || s.last_name fullname, sum (total_amount) as total_revenue
	from sales.staffs s
	inner join sales.orders o on s.staff_id = o.staff_id
	where o.order_status != 2
	group by s.staff_id, s.first_name, s.last_name
	order by total_revenue desc;
END;
$$;

---select * from sales.orders;
--select * from sales.staff_revenue();


--Function get Customer By Id
DROP function IF EXISTS  sales.get_customer_by_account_id;

CREATE OR REPLACE function sales.get_customer_by_account_id(id bigint)
RETURNS TABLE(customer_id BIGINT,first_name VARCHAR(255),last_name VARCHAR(255), phone VARCHAR(255), email VARCHAR(255), street VARCHAR(255), city VARCHAR(255),account_id bigint)
LANGUAGE plpgsql
AS $$
BEGIN
	return query 
	select * 
	FROM sales.customers c
	WHERE c.account_id = id;
END;
$$;

-- SELECT * FROM sales.get_customer_by_account_id(2);
