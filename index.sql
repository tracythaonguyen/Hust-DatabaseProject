create index product_name_idx on product.products using hash(product_name);
create index product_name_idx on product.products using btree(product_id, product_name);
create index product_name_idx on product.products(discontinued);
drop index product.product_name_idx;

explain SELECT * FROM product.view_all_product() v WHERE v.product_name ILIKE '%' || 'Samsung' || '%'; 
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

explain select * from product.products where product_name = 'Vivo V21';
explain select * from product.products where product_id = 46;

explain select * from product.items where serial_code = '4SIZ8MWS';
