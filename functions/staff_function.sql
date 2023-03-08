--Function view staffinfo
DROP FUNCTION IF EXISTS sales.view_staff_info();
CREATE OR REPLACE FUNCTION sales.view_staff_info(in staff_id_input bigint)  
RETURNS TABLE(staff_id BIGINT,first_name VARCHAR(255),last_name VARCHAR(255), phone VARCHAR(255), email VARCHAR(255), street VARCHAR(255), city VARCHAR(255),active boolean,manager_id bigint,account_id bigint, user_name varchar(255),pass_word varchar(255))
LANGUAGE plpgsql
AS $$ 
BEGIN 
	RETURN QUERY  
	SELECT c.*, a.user_name, a.password
	FROM sales.staffs c
	JOIN sys.accounts a ON c.account_id =a.account_id
	where c.staff_id = staff_id_input; 
END;
$$;

-- SELECT * FROM sales.view_staff_info(1);

DROP PROCEDURE IF EXISTS  sales.update_info_staff;

CREATE OR REPLACE PROCEDURE sales.update_info_staff(staff_id_input BIGINT,first_name_inp VARCHAR(255),last_name_inp VARCHAR(255), phone_inp VARCHAR(255), email_inp VARCHAR(255), street_inp VARCHAR(255), city_inp VARCHAR(255), user_name_input varchar(255),pass_word varchar(255))
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE sales.staffs
	SET first_name = first_name_inp,
		last_name = last_name_inp,
		phone = phone_inp,
		email = email_inp,
		street = street_inp,
		city = city_inp
	WHERE staff_id=staff_id_input;
	
	UPDATE sys.accounts
	SET user_name = user_name_input,
		password=pass_word
	WHERE account_id = (SELECT account_id FROM sales.staffs WHERE staff_id=staff_id_input);
END;
$$;

-- Update order status
DROP PROCEDURE IF EXISTS  sales.process_order;
CREATE OR REPLACE PROCEDURE sales.process_order(order_id_input BIGINT, staff_id_input BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	if order_id_input not in (select order_id from sales.orders)
		then raise notice 'There is no such order with that id';
		-- Check if staff active
	elsif staff_id_input is not NULL 
		and (select active from sales.staffs s where s.staff_id = staff_id_input) is FALSE
		then RAISE NOTICE 'Staff no longer works';
	else
	UPDATE sales.orders
	SET order_status = 1,
			staff_id = staff_id_input
	WHERE order_id=order_id_input;
	end if;
END;
$$;

--select * from sales.orders;
--call sales.update_order_status(9,1);
--call sales.update_order_status(10,1);