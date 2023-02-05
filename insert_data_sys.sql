-- Roles
delete from sys.roles;

insert into sys.roles values (0, 'Customer');
insert into sys.roles values (1, 'Product Manager');
insert into sys.roles values (2, 'Sales Manager');

select * from sys.roles;

-- Account
drop procedure IF EXISTS sys.new_account;

create or replace procedure sys.new_account(user_name1 varchar(255), pass_word1 varchar (255), role_id1 bigint)
language plpgsql
as $$
begin
	execute 'create user ' || user_name1 || ' with PASSWORD ''' || pass_word1 || ''';';
	insert into sys.accounts (user_name, password, role_id) values (user_name1, pass_word1, role_id1);
-- Đoạn này chưa viết xong procedure nên chưa phân quyền tạm để trống

--     if role_id1 = 1 THEN
--         execute 'GRANT SELECT, UPDATE, INSERT ON products TO '|| user_name1 ||';';
-- 		execute 'GRANT SELECT, UPDATE, INSERT ON items TO '|| user_name1 || ';';
-- 	elseif role_id1 = 2 then
-- 		execute 'GRANT SELECT, UPDATE, INSERT ON orders TO '|| user_name1 || ';';
-- 		execute 'GRANT SELECT, UPDATE, INSERT ON order_details TO '|| user_name1 || ';';
-- 		execute 'GRANT SELECT ON ALL TABLES IN SCHEMA "public" TO '|| user_name1 || ';';
--     END if;
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
call sales.new_customer('Minh','Do','090323232','minhdotpc@gmail.com','HBT','HN','minhdo2207','218379273');
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





