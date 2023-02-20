create database thegioididong;

create schema sys;
create schema sales;
create schema product;

-- Name: roles; Type: TABLE
-- 
DROP TABLE IF EXISTS sys.roles;

CREATE TABLE sys.roles (
    role_id INT,
    role_name VARCHAR(255) unique,
    PRIMARY KEY (role_id)
);

-- 
-- Name: account; Type: TABLE
-- 

DROP TABLE IF EXISTS sys.accounts;

CREATE TABLE sys.accounts (
  account_id BIGSERIAL,
	user_name VARCHAR(255) unique,
	password VARCHAR(255),
	role_id INT,
  PRIMARY KEY (account_id),
  CONSTRAINT fk_role
    FOREIGN KEY (role_id) 
      REFERENCES sys.roles(role_id)
);

-- 
-- Name: customers; Type: TABLE
-- 

DROP TABLE IF EXISTS sales.customers;

CREATE TABLE sales.customers (
  customer_id BIGSERIAL,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	phone VARCHAR(255) unique,
	email VARCHAR(255) unique,
	street VARCHAR(255),
	city VARCHAR(255),
	account_id BIGINT unique,
  PRIMARY KEY (customer_id),
  CONSTRAINT fk_account
    FOREIGN KEY (account_id) 
      REFERENCES sys.accounts(account_id)
);

-- 
-- Name: staffs; Type: TABLE
-- 

DROP TABLE IF EXISTS sales.staffs;

CREATE TABLE sales.staffs (
  	staff_id BIGSERIAL,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	phone VARCHAR(255) unique,
	email VARCHAR(255) unique,
	street VARCHAR(255),
	city VARCHAR(255),
	active boolean,
  manager_id BIGINT,
  PRIMARY KEY (staff_id)
);

alter table sales.staffs 
add constraint fk_staff_id 
foreign key (manager_id) references sales.staffs(staff_id);
-- 
-- Name: orders; Type: TABLE
-- 

DROP TABLE IF EXISTS sales.orders;

CREATE TABLE sales.orders (
  order_id BIGSERIAL,
	customer_id BIGINT,
	order_status INT default 0,
	order_date DATE,
	staff_id BIGINT,
	total_amount decimal(10,2),
  CHECK(order_status IN (0, 1, 2)),
  PRIMARY KEY (order_id),
  CONSTRAINT fk_customer
    FOREIGN KEY (customer_id)
      REFERENCES sales.customers(customer_id),
  CONSTRAINT fk_staff
    FOREIGN KEY (staff_id)
      REFERENCES sales.staffs(staff_id) 
);
-- 
-- Name: brands; Type: TABLE
-- 

DROP TABLE IF EXISTS product.brands;

CREATE TABLE product.brands (
  brand_id BIGSERIAL,
  brand_name VARCHAR(255) unique,
  PRIMARY KEY (brand_id)
);

-- 
-- Name: categories; Type: TABLE
-- 

DROP TABLE IF EXISTS product.categories;

CREATE TABLE product.categories (
  category_id BIGSERIAL,
  category_name VARCHAR(255) unique,
  PRIMARY KEY (category_id)
);

-- 
-- Name: products; Type: TABLE
-- 

DROP TABLE IF EXISTS product.products;

CREATE TABLE product.products (
  	product_id BIGSERIAL,
	product_name VARCHAR(255) unique,
	brand_id BIGINT,
	category_id BIGINT,
	model_year CHAR(4),
	list_price DECIMAL(10,2),
	avg_rating decimal(2,1) default 0,
	total_review bigint default 0,
	discontinued boolean default FALSE,
  PRIMARY KEY (product_id),
  CONSTRAINT fk_brand
    FOREIGN KEY (brand_id)
      REFERENCES product.brands(brand_id),
  CONSTRAINT fk_category
    FOREIGN KEY (category_id)
      REFERENCES product.categories(category_id)
);

ALTER TABLE product.products
  ALTER COLUMN avg_rating TYPE decimal(2,1);
-- 
-- Name: stocks; Type: TABLE
-- 

DROP TABLE IF EXISTS product.stocks;

CREATE TABLE product.stocks (
  product_id BIGINT,
	quantity BIGINT check (quantity >= 0),
  PRIMARY KEY (product_id),
  CONSTRAINT fk_stock
    FOREIGN KEY (product_id)
      REFERENCES product.products(product_id)
);

-- 
-- Name: config; Type: TABLE
-- 

DROP TABLE IF EXISTS product.config;

CREATE TABLE product.config (
	config_id BIGSERIAL,
	color VARCHAR(255),
	RAM VARCHAR(255),
	ROM VARCHAR(255),
	extra_charge decimal(10, 2),
  PRIMARY KEY (config_id)
);

-- 
-- Name: items; Type: TABLE
-- 

DROP TABLE IF EXISTS product.items;

CREATE TABLE product.items (
	serial_code VARCHAR(255),
	product_id BIGINT,
	MFG DATE,
	config_id bigint,
	availability boolean default TRUE,
  PRIMARY KEY (serial_code),
  CONSTRAINT fk_product
    FOREIGN KEY (product_id)
      REFERENCES product.products(product_id),
  CONSTRAINT fk_config
    FOREIGN KEY (config_id)
      REFERENCES product.config(config_id)
);

-- 
-- Name: order_details; Type: TABLE
-- 

DROP TABLE IF EXISTS sales.order_details;

CREATE TABLE sales.order_details (
  order_detail_id BIGSERIAL,
	order_id BIGINT,
	serial_code VARCHAR(255) unique,
	discount DECIMAL(4,2), check (discount between 0 and 1),
  PRIMARY KEY (order_detail_id),
  CONSTRAINT fk_serial_code
    FOREIGN KEY (serial_code)
      REFERENCES product.items(serial_code),
  CONSTRAINT fk_order
    FOREIGN KEY (order_id)
      REFERENCES sales.orders(order_id)
);

-- 
-- Name: coverages; Type: TABLE
-- 

DROP TABLE IF EXISTS sales.coverages;

CREATE TABLE sales.coverages (
  coverage_id BIGSERIAL,
  serial_code varchar(255) unique,
  coverages_expired_date date,
  PRIMARY KEY (coverage_id),
  CONSTRAINT fk_coverage
  FOREIGN KEY (serial_code)
  REFERENCES sales.order_details(serial_code)
);

-- 
-- Name: cart; Type: TABLE
-- 

DROP TABLE IF EXISTS sales.cart;

CREATE TABLE sales.cart (
    cart_id bigserial,
	customer_id bigint,
	serial_code varchar(255),

	primary key(cart_id),
	foreign key (customer_id)
		references sales.customers(customer_id),
	foreign key (serial_code)
		references product.items(serial_code)
);
