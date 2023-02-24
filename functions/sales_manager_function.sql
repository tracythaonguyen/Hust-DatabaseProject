



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

DROP PROCEDURE IF EXISTS  sales.update_order_status;

CREATE OR REPLACE PROCEDURE sales.update_order_status(order_id_input BIGINT, order_status_input int)
LANGUAGE plpgsql
AS $$
BEGIN
	if order_id_input not in (select order_id from sales.orders)
		then raise notice 'There is no such order with that id';
	else
	UPDATE sales.orders
	SET order_status = order_status_input
	WHERE order_id=order_id_input;
	end if;
END;
$$;

--select * from sales.orders;
--call sales.update_order_status(9,1);
--call sales.update_order_status(10,1);


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
