-- Roles
delete from sys.roles;

insert into sys.roles values (0, 'Customer');
insert into sys.roles values (1, 'Product Manager');
insert into sys.roles values (2, 'Sales Manager');

select * from sys.roles;

-- Account
create or replace procedure sys.new_account(user_name1 varchar(255), pass_word1 varchar (255), role_id1 bigint)
language plpgsql
as $$
begin
	execute 'create user ' || user_name1 || ' with PASSWORD ''' || pass_word1 || ''';';
	insert into sys.accounts (user_name, password, role_id) values (user_name1, pass_word1, role_id1);
-- 	execute 'grant usage on schema "sys" to '||user_name1 ||';';
-- 	execute 'grant usage on schema "public" to '||user_name1 ||';';
	execute 'grant usage on schema "product" to '||user_name1 ||';';
	execute 'grant usage on schema "sales" to '||user_name1 ||';';
	execute 'grant usage on ALL SEQUENCES IN SCHEMA "product" to '||user_name1 ||';';
	execute 'grant usage on ALL SEQUENCES IN SCHEMA "sales" to '||user_name1 ||';';
	if role_id1 = 0 then
		begin
			execute 'grant execute on all functions in schema "product" to '||user_name1 ||';';
			execute 'grant select, update on all tables in schema "product" to '||user_name1 ||';';
			
			execute 'GRANT EXECUTE ON PROCEDURE sales.add_to_cart(IN customer_id_input bigint, IN serial_code_input character varying) TO '||user_name1 ||';';
			execute 'GRANT EXECUTE ON PROCEDURE sales.cancel_order(IN customer_id_input bigint, IN order_id_input bigint) TO ' ||user_name1 ||';';
			execute 'GRANT EXECUTE ON PROCEDURE sales.make_order_offline(IN customer_id_input bigint, IN staff_id_input bigint) TO ' ||user_name1 ||';';
			execute 'GRANT EXECUTE ON PROCEDURE sales.make_order_online(IN customer_id_input bigint) TO ' ||user_name1 ||';';
			execute 'GRANT EXECUTE ON PROCEDURE sales.rate_product(IN customer_id_input bigint, IN product_id_input bigint, IN score numeric) TO '||user_name1 ||';';
			execute 'GRANT EXECUTE ON PROCEDURE sales.remove_from_cart(IN customer_id_input bigint, IN serial_code_input character varying) TO ' ||user_name1 ||';';

			execute 'GRANT EXECUTE ON FUNCTION sales.search_order_by_date(customer_id_input bigint, order_date_input date) TO '||user_name1 ||';';
			execute 'GRANT EXECUTE ON FUNCTION sales.view_cart(customer_id_input bigint) TO '||user_name1 ||';';
			execute 'GRANT EXECUTE ON FUNCTION sales.view_detail_order_history(customer_id_input bigint, order_id_input bigint) TO '||user_name1 ||';';
			execute 'GRANT EXECUTE ON FUNCTION sales.view_order_history(customer_id_input bigint) TO '||user_name1 ||';';
			
			execute 'grant select, insert, update, delete on all tables in schema "sales" to '||user_name1 ||';';
		end;
    elseif role_id1 = 1 THEN
		begin
			execute 'grant execute on all procedures in schema "product" to '||user_name1 ||';';
			execute 'grant execute on all functions in schema "product" to '||user_name1 ||';';
			execute 'grant select, insert, update, delete on all tables in schema "product" to '||user_name1 ||';';
		end;
 	elseif role_id1 = 2 then
		begin
			
			-- function
			execute 'GRANT EXECUTE ON FUNCTION sales.customer_revenue() TO '||user_name1 ||';';
			execute 'GRANT EXECUTE ON FUNCTION sales.product_revenue() TO '||user_name1 ||';';
			execute 'GRANT EXECUTE ON FUNCTION sales.product_total_sold() TO '||user_name1 ||';';
			execute 'GRANT EXECUTE ON FUNCTION sales.staff_revenue() TO '||user_name1 ||';';
			
			-- procedure
			execute 'GRANT EXECUTE ON PROCEDURE sales.new_staff(IN first_name character varying, 
			IN last_name character varying, IN phone character varying, IN email character varying, 
			IN street character varying, IN city character varying, IN active boolean, IN manager_id bigint) TO '||user_name1 ||';';
			execute 'GRANT EXECUTE ON PROCEDURE sales.update_order_status(IN order_id_input bigint, 
			IN order_status_input integer) TO '||user_name1 ||';';
			
			execute 'grant select, insert, update, delete on all tables in schema "sales" to '||user_name1 ||';';
			execute 'grant select on all tables in schema "product" to '||user_name1 ||';';
		end;
    END if;
end $$;

-- PROCEDURE new_customer
CREATE OR REPLACE PROCEDURE sys.new_customer(first_name VARCHAR(255),last_name VARCHAR(255),phone VARCHAR(255),email VARCHAR(255),street VARCHAR(255),city VARCHAR(255),username VARCHAR(255), password VARCHAR(255))
LANGUAGE plpgsql
AS $$
DECLARE account_id1 BIGINT ; 
BEGIN
	--INSERT INTO TABLE accounts
	CALL sys.new_account(username,password,0);
	SELECT account_id INTO account_id1 FROM sys.accounts WHERE user_name=username;
	-- INSERT INTO TABLE customer
	INSERT INTO sales.customers(first_name,last_name,phone,email,street,city,account_id) VALUES (first_name,last_name,phone,email,street,city,account_id1);

END;
$$;



BEGIN ;
call sys.new_account('ktrung1709', '17092002', 2);
call sys.new_account('thaobaymau', 'thao123', 1);
call sys.new_account('dtm', 'minhdo123', 0);
call sys.new_customer('Minh','Do','090323232','minhdotpc@gmail.com','HBT','HN','dtm','dtm');
call sys.new_customer('Minh','Do','0123456787','minhdotpc12@gmail.com','HBT','HN','dtm2','dtm2');
select * FROM sales.customers;
select * from sys.accounts;
ROLLBACK;

DROP OWNED BY ktrung1709;
drop owned by thaobaymau;
drop user  IF EXISTS ktrung1709;
drop user IF EXISTS thaobaymau;
DROP OWNED BY dtm; 
drop user IF EXISTS dtm;