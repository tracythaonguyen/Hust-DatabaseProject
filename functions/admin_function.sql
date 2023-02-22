-- Account
create or replace procedure sys.new_account(user_name1 varchar(255), pass_word1 varchar (255), role_id1 bigint)
language plpgsql
as $$
begin
	insert into sys.accounts (user_name, password, role_id) values (user_name1, pass_word1, role_id1);
end $$;

