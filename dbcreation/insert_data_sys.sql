BEGIN ;
call sys.new_account('ktrung1709', '17092002', 2);
call sys.new_account('thaobaymau', 'thao123', 1);
call sys.new_account('dtm', 'minhdo123', 0);
call sys.new_customer('Minh','Do','090323232','minhdotpc@gmail.com','HBT','HN','dtm','dtm');
call sys.new_customer('Minh','Do','0123456787','minhdotpc12@gmail.com','HBT','HN','dtm2','dtm2');
-- select * FROM sales.customers;
-- select * from sys.accounts;
ROLLBACK;

-- DROP OWNED BY ktrung1709;
-- drop owned by thaobaymau;
-- drop user  IF EXISTS ktrung1709;
-- drop user IF EXISTS thaobaymau;
-- DROP OWNED BY dtm; 
-- drop user IF EXISTS dtm;