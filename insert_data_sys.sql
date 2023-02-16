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
	execute 'grant usage on schema "sys" to '||user_name1 ||';';
	execute 'grant usage on schema "public" to '||user_name1 ||';';
	execute 'grant usage on schema "product" to '||user_name1 ||';';
	execute 'grant usage on schema "sales" to '||user_name1 ||';';
	if role_id1 = 0 then
		execute 'grant execute on all procedures in schema "sales" to '||user_name1 ||';';
--     elseif role_id1 = 1 THEN
-- 	elseif role_id1 = 2 then
    END if;
end $$;

-- PROCEDURE new_customer
CREATE OR REPLACE PROCEDURE sales.new_customer(first_name VARCHAR(255),last_name VARCHAR(255),phone VARCHAR(255),email VARCHAR(255),street VARCHAR(255),city VARCHAR(255),username VARCHAR(255), password VARCHAR(255))
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
call sales.new_customer('Minh','Do','090323232','minhdotpc@gmail.com','HBT','HN','dtm','dtm');
call sales.new_customer('Minh','Do','0123456789','minhdotpc1@gmail.com','HBT','HN','dtm1','dtm1');
select * FROM sales.customers;
select * from sys.accounts;
ROLLBACK;

DROP OWNED BY ktrung1709;
drop owned by thaobaymau;
drop user  IF EXISTS ktrung1709;
drop user IF EXISTS thaobaymau;
DROP OWNED BY dtm; 
drop user IF EXISTS dtm;

select * from accounts
delete from accounts


GRANT SELECT, UPDATE, INSERT ON sys.accounts TO dtm;

grant usage on schema "sys" to dtm;

GRANT SELECT ON all tables IN SCHEMA "sys" TO dtm;


grant select, insert, update, delete on table sales.cart to dtm1;
grant select, insert, update on all tables in schema sales to dtm1;
grant usage on sequence sales.orders_order_id_seq to dtm1;
grant usage on sequence sales.order_details_order_detail_id_seq to dtm1;
grant usage on sequence sales.coverages_coverage_id_seq to dtm1;

grant select, update on all tables in schema product to dtm1;

grant usage on sequence sales.cart_cart_id_seq to dtm1;
grant execute on all functions in schema sales to dtm1;

select sales.view_cart(3);
select * from sales.cart;