explain SELECT i.serial_code,i.mfg,c.color, c.RAM, c.ROM,(p.list_price+c.extra_charge) total_price
	FROM product.items i 
	JOIN product.products p ON p.product_id= i.product_id
	JOIN product.config c ON c.config_id = i.config_id
	WHERE i.product_id= 3 AND i.availability=TRUE;
create index product_id_item_idx on product.items using btree(product_id);
drop index product.product_id_item_idx;

select * from product.products

explain SELECT p.product_id product_id,
		p.product_name product_name,
		b.brand_name brand_name,
		c.category_name category_name,
		p.model_year,
		p.list_price,
		p.avg_rating,
		p.total_review,
		p.discontinued
	FROM product.products p
		JOIN product.brands b USING (brand_id)
		JOIN product.categories c USING (category_id)
	WHERE p.avg_rating < 3.5;
	
create index avg_rating_product_idx on product.products using btree(avg_rating);
drop index product.avg_rating_product_idx;

create index model_year_product_idx on product.products(model_year);
drop index product.model_year_product_idx;
	
create index list_price_product_idx on product.products using btree(list_price);
drop index product.list_price_product_idx;

where p.list_price > 600 and p.list_price < 1000; 
where p.model_year = '2020';


explain SELECT * FROM product.view_all_product() v WHERE v.product_name ILIKE '%' || 'Samsung' || '%'; 
create index product_name_idx on product.products using hash(product_name);
drop index product.product_name_idx;
explain select * from product.search_product_by_name('Samsung');

explain SELECT p.product_id,
		p.product_name,
		b.brand_name,
		c.category_name,
		p.model_year,
		p.list_price,
		p.avg_rating,
		p.total_review,
		p.discontinued
	FROM product.products p
		JOIN product.brands b USING (brand_id)
		JOIN product.categories c USING (category_id)
	WHERE p.discontinued = false;
	

create index product_name_idx on product.products using btree(product_id, product_name);
create index product_name_idx on product.products(discontinued);
drop index product.product_name_idx;

explain select * from product.products where product_name = 'Vivo V21';
explain select * from product.products where product_id = 46;

explain select * from product.items where serial_code = '4SIZ8MWS';

explain select * from product.stocks where quantity > 50;
create index quantity_idx on product.stocks(quantity);

explain select * from sales.orders where customer_id = 1;
create index customer_idx on sales.orders(customer_id);