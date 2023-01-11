-- 
-- Database Script Group 7
-- 
-- 
-- Name: roles; Type: TABLE
-- 
DROP TABLE IF EXISTS roles;

CREATE TABLE roles (
    role_id INT,
    role_name VARCHAR(255),
    PRIMARY KEY (role_id)
);

-- 
-- Name: account; Type: TABLE
-- 

DROP TABLE IF EXISTS account;

CREATE TABLE account (
  account_id BIGSERIAL,
	user_name VARCHAR(255) unique,
	password VARCHAR(255),
	role_id INT,
  PRIMARY KEY (account_id),
  CONSTRAINT fk_role
    FOREIGN KEY (role_id) 
      REFERENCES roles(role_id)
);

-- 
-- Name: customers; Type: TABLE
-- 

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  customer_id BIGSERIAL,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	phone VARCHAR(255) unique,
	email VARCHAR(255) unique,
	street VARCHAR(255),
	city VARCHAR(255),
	zip_code VARCHAR(255),
	account_id BIGINT unique,
  PRIMARY KEY (customer_id),
  CONSTRAINT fk_account
    FOREIGN KEY (account_id) 
      REFERENCES account(account_id)
);

-- 
-- Name: staffs; Type: TABLE
-- 

DROP TABLE IF EXISTS staffs;

CREATE TABLE staffs (
  staff_id BIGSERIAL,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	phone VARCHAR(255) unique,
	email VARCHAR(255) unique,
	street VARCHAR(255),
	city VARCHAR(255),
	zip_code VARCHAR(255),
	account_id BIGINT unique,
	active boolean,
  manager_id BIGINT,
  PRIMARY KEY (staff_id),
  CONSTRAINT fk_account
    FOREIGN KEY (account_id) 
      REFERENCES account(account_id)
);

alter table staffs 
add constraint fk_staff_id 
foreign key (manager_id) references staffs(staff_id);
-- 
-- Name: orders; Type: TABLE
-- 

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
  order_id BIGSERIAL,
	customer_id BIGINT,
	order_status INT,
	order_date DATE,
	staff_id BIGINT,
  CHECK(order_status IN (0, 1, 2)),
  PRIMARY KEY (order_id),
  CONSTRAINT fk_customer
    FOREIGN KEY (customer_id)
      REFERENCES customers(customer_id),
  CONSTRAINT fk_staff
    FOREIGN KEY (staff_id)
      REFERENCES staffs(staff_id) 
);

-- 
-- Name: brands; Type: TABLE
-- 

DROP TABLE IF EXISTS brands;

CREATE TABLE brands (
  brand_id BIGSERIAL,
  brand_name VARCHAR(255),
  PRIMARY KEY (brand_id)
);

-- 
-- Name: categories; Type: TABLE
-- 

DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
  category_id BIGSERIAL,
  category_name VARCHAR(255),
  PRIMARY KEY (category_id)
);

-- 
-- Name: products; Type: TABLE
-- 

DROP TABLE IF EXISTS products;

CREATE TABLE products (
  product_id BIGSERIAL,
	product_name VARCHAR(255),
	brand_id BIGINT,
	category_id BIGINT,
	model_year CHAR(4),
	list_price DECIMAL(10,2),
  PRIMARY KEY (product_id),
  CONSTRAINT fk_brand
    FOREIGN KEY (brand_id)
      REFERENCES brands(brand_id),
  CONSTRAINT fk_category
    FOREIGN KEY (category_id)
      REFERENCES categories(category_id)
);

-- 
-- Name: stocks; Type: TABLE
-- 

DROP TABLE IF EXISTS stocks;

CREATE TABLE stocks (
  product_id BIGINT,
	quantity BIGINT,
  PRIMARY KEY (product_id),
  CONSTRAINT fk_stock
    FOREIGN KEY (product_id)
      REFERENCES products(product_id)
);

-- 
-- Name: items; Type: TABLE
-- 

DROP TABLE IF EXISTS items;

CREATE TABLE items (
	serial_code VARCHAR(255),
	product_id BIGINT,
	MFG DATE,
	color VARCHAR(255),
	RAM VARCHAR(255),
	ROM VARCHAR(255),
  PRIMARY KEY (serial_code),
  CONSTRAINT fk_product
    FOREIGN KEY (product_id)
      REFERENCES products(product_id)
);

-- 
-- Name: order_details; Type: TABLE
-- 

DROP TABLE IF EXISTS order_details;

CREATE TABLE order_details (
  order_detail_id BIGSERIAL,
	order_id BIGINT,
	serial_code VARCHAR(255),
	discount DECIMAL(4,2), check (discount between 0 and 1),
  PRIMARY KEY (order_detail_id),
  CONSTRAINT fk_serial_code
    FOREIGN KEY (serial_code)
      REFERENCES items(serial_code),
  CONSTRAINT fk_order
    FOREIGN KEY (order_id)
      REFERENCES orders(order_id)
);

-- 
-- Name: coverages; Type: TABLE
-- 

DROP TABLE IF EXISTS coverages;

CREATE TABLE coverages (
  coverage_id BIGSERIAL,
  serial_code INT,
  coverages_expired_date date,
  PRIMARY KEY (coverage_id),
  CONSTRAINT fk_coverage
  FOREIGN KEY (serial_code)
  REFERENCES order_details(serial_code)
);

