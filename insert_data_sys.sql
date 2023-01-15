-- Roles
delete from sys.roles

insert into sys.roles values (0, 'Customer');
insert into sys.roles values (1, 'Product Manager');
insert into sys.roles values (2, 'Sales Manager');

select * from sys.roles;

-- Account
drop procedure sys.new_account

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

call new_account('ktrung1709', '17092002', 2);
call new_account('thaobaymau', 'thao123', 1);
call new_account('dtm', 'minhdo123', 0);

DROP OWNED BY ktrung1709;
drop owned by thaobaymau;
drop user ktrung1709;
drop user thaobaymau;

select * from accounts
delete from accounts

--order