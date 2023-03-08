-- Account
create or replace procedure sys.new_account(user_name1 varchar(255), pass_word1 varchar (255), role_id1 bigint)
language plpgsql
as $$
begin
	insert into sys.accounts (user_name, password, role_id) values (user_name1, pass_word1, role_id1);
end $$;

-- PROCEDURE new_staff(first_name,last_name,phone,email,street,city,active,manager_id)
-- Auto generate staff_id
drop procedure IF EXISTS sys.new_staff;
CREATE OR REPLACE PROCEDURE sys.new_staff(first_name VARCHAR(255),last_name VARCHAR(255), phone VARCHAR(255), email VARCHAR(255), street VARCHAR(255), city VARCHAR(255), active boolean,manager_id bigint, user_name_input varchar(255),pass_word varchar(255))
LANGUAGE plpgsql
AS $$
DECLARE account_id_input BIGINT;
BEGIN
	IF user_name_input NOT IN (SELECT user_name FROM sys.accounts)
	THEN 
		BEGIN 
			--INSERT into table accounts (Create an account for customer)
			INSERT INTO sys.accounts(user_name,password,role_id) VALUES(user_name_input,pass_word,3);
			SELECT account_id INTO account_id_input FROM sys.accounts WHERE user_name=user_name_input;
			--INSERT into table staffs
			INSERT INTO sales.staffs(first_name,last_name,phone,email,street,city,active,manager_id,account_id) VALUES (first_name,last_name,phone,email,street,city,active,manager_id,account_id_input);
		END;
	ELSE
			RAISE NOTICE 'Username already been used';
	END IF;
END;
$$;

-- -- PROCEDURE new_customer(first_name,last_name,phone,email,street,city, username, password)
-- -- Auto generate customer_id
drop procedure IF EXISTS sys.new_customer;
CREATE OR REPLACE PROCEDURE sys.new_customer(first_name VARCHAR(255),last_name VARCHAR(255), phone VARCHAR(255), email VARCHAR(255), street VARCHAR(255), city VARCHAR(255), user_name_input varchar(255),pass_word varchar(255))
LANGUAGE plpgsql
AS $$
DECLARE account_id_input BIGINT;
BEGIN
	IF user_name_input NOT IN (SELECT user_name FROM sys.accounts)
	THEN 
		BEGIN 
			--INSERT into table accounts (Create an account for customer)
			INSERT INTO sys.accounts(user_name,password,role_id) VALUES(user_name_input,pass_word,0);
			SELECT account_id INTO account_id_input FROM sys.accounts WHERE user_name=user_name_input;
			--INSERT into table customers
			INSERT INTO sales.customers(first_name,last_name,phone,email,street,city,account_id) VALUES (first_name,last_name,phone,email,street,city,account_id_input);
		END;
	ELSE
			RAISE NOTICE 'Username already been used';
	END IF;
END;
$$;