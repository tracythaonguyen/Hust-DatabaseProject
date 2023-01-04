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
    CHECK(role_name IN ('admin', 'customer', 'manager')),
    PRIMARY KEY (role_id)
);

-- 
-- Name: account; Type: TABLE
-- 

DROP TABLE IF EXISTS account;

CREATE TABLE account (
  account_id BIGSERIAL,
	user_name VARCHAR(255),
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
	phone VARCHAR(255),
	email VARCHAR(255),
	street VARCHAR(255),
	city VARCHAR(255),
	zip_code VARCHAR(255),
	account_id BIGINT,
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
	phone VARCHAR(255),
	email VARCHAR(255),
	street VARCHAR(255),
	city VARCHAR(255),
	zip_code VARCHAR(255),
	account_id BIGINT,
	active VARCHAR(255),
  manager_id BIGINT,
  PRIMARY KEY (staff_id),
  CONSTRAINT fk_account
    FOREIGN KEY (account_id) 
      REFERENCES account(account_id)
);

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
	discount DECIMAL(4,2),
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

-- CREATE TABLE coverages (
--   coverage_id BIGSERIAL,
-- 	serial_code INT,
-- 	coverages_expired_date INT
--   PRIMARY KEY (coverage_id),
--   CONSTRAINT fk_coverage
--     FOREIGN KEY (serial_code)
--       REFERENCES order_details(serial_code)
-- );

-- CREATE TABLE coverages (
--   coverage_id BIGSERIAL,
-- 	order_id BIGINT,
--   PRIMARY KEY (coverage_id),
--   CONSTRAINT fk_coverage
--     FOREIGN KEY (order_id)
--       REFERENCES orders(order_id)
-- );

-- 
-- Data for Name: roles; Type: TABLE DATA
-- 

INSERT INTO roles (role_id, role_name) VALUES (1, 'admin');
INSERT INTO roles (role_id, role_name) VALUES (2, 'customer');
INSERT INTO roles (role_id, role_name) VALUES (3, 'manager');

-- 
-- Data for Name: account; Type: TABLE DATA
--  100
-- 

INSERT INTO account (user_name, password, role_id) VALUES ('oheathorn0', 'dxF6RkZX', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('aireland1', 'wpSkk3UuZ', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('amurden2', 'RdfhnEgG', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('hmingauld3', '8FZrkrJJ8', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('rbarabich4', 'nvamSywAk63', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('gpoints5', 'gwYThA', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('econdon6', 'X3iOoJec', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('ctolefree7', 'EIksyDdL2AW', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('jbucklan8', 'HM7qKsKFQ', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('cpatmore9', 'FWbUydg', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('cjanusika', 'v35SUTDX0kbB', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('apolamontayneb', 'HmJ41Tnv8sj', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('drubinszteinc', 'VvCmmnsuTsF', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('vharrhyd', 'G14vTeiOLP6', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('fstansfielde', 'sV9BUyS', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('eloydf', '2HaxOziJ6qp', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('cklaisg', 'ZQSbMsM2mU1i', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('lpapaccioh', 'Z3gJOxAo', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('ckabosi', 'fTXJX6EiXM3O', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('gwarehamj', '4oL4fx8eb', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('wrowberryk', 'mM2Xo5cUEPss', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('acaughtl', 'wlXQi0G4Wdp', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('hlovittm', '0BoECT', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('ziwanowiczn', 'fJ4kiBfME', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('gmccaigheyo', 'b4ZJqqBU7X', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('hhallexp', 'fHsdL0v', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('ineevesq', 'sVnV920Mcg', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('acatheriner', 'M7yFiMw', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('rrawdalls', 'ryrmN3k8kGyF', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('bdulwicht', 'dZEYfWW1He', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('ggiberdu', 'RRBZe8', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('hdillicatev', 'u6B1D1z', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('vbenckw', 'Jclr7BfmV6f', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('pdarleyx', 'MhPviZf', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('mcastroy', 'xccIZo', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('cnoadz', 'J1EOhU', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('dciccerale10', 'r4Tc2SX', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('arouth11', 'BtKW0Xobg3E', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('abennellick12', 'XETApNuEYDCt', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('apoynzer13', 'i9SWDiYyvb', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('abudgen14', 'HnI08Nf8lgaO', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('kklamman15', 'uidwtFLc4aH', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('bthomesson16', 'PiR2mgU', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('khessle17', 'KLEj9u', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('cdacey18', '7Lx8WseCe6fD', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('hpoore19', 'qrmuzC64Fsn7', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('mrousell1a', 'hwqwY1U', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('bcrowdson1b', 'NyAQ6Ba1SA', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('bjeandot1c', 'OWn8aIdueXf3', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('mbroddle1d', 'P4dZLF', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('bhynd1e', 'KwSIOp', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('ebreawood1f', 'EMQcBE2qis4', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('geborn1g', '0osJRt1b', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('lplant1h', 'kHOQ20HTZ', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('rtrusse1i', 'XFF8Z57WBLVk', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('rpeto1j', 'AFrmTJmpW', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('rmingo1k', 'jSmcFJFymb9d', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('ibothams1l', 'dFxjwLg0YGGB', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('cfalls1m', 'I0kkJVIwD9', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('fduesberry1n', '3Bpr3Y2lp', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('movill1o', 'YbEMMEcjU6WF', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('dmurrum1p', '99C3Z28x27', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('clowseley1q', 'sfpFsR9H', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('kcarbert1r', 'vPuuWA', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('zgilhool1s', 'QcUYvTg69', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('ebollands1t', 'P7cNUpnvO0R8', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('cfinnigan1u', 'HANFPE4R', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('bthireau1v', '64Xtkpuf', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('rmckinie1w', 'pFS8RbW', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('cbaylay1x', '4OkvR4i4Ds', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('carling1y', '20M8oUVVx', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('lotton1z', 'HTtrF55v', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('rphillp20', '6mUgzvkjkuBD', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('dheinreich21', 'RRN1gLMTM', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('dshama22', 'PFCi8cA', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('cleishman23', 'oPxz8ZOSHPg', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('ewiggans24', 'HjtIyrSF', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('skearford25', 'Ieg7r5HO', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('cgarron26', 'jSzJoRx6Mbdj', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('cbrion27', 'WkjPzj', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('rpickersail28', 'lML72rt9Ltg', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('hchiplin29', 'S5apZf0g', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('mwreford2a', 'gwIMVMU', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('bseine2b', 'jJxcSJvQY94x', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('lperche2c', 'pXMOypkMu', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('zrodenborch2d', 'i9Z06mL', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('arangle2e', 'S9VDhsh0r', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('dgilkison2f', '4yIUTYzM', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('lrushmer2g', '0SBcSnoa9ssY', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('rgavozzi2h', 'rldbgxDAr', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('nspearett2i', 'pSGR5cQc', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('vloudyan2j', 'uhr3f2FlF', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('cdaniello2k', '2strMQ0CtD', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('llarwell2l', 'YIgO0a', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('btomney2m', '38PMuerzsE0M', 3);
INSERT INTO account (user_name, password, role_id) VALUES ('spiddock2n', 'ICgfx6', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('lchannon2o', 'ng7tcdWhh90e', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('qharwood2p', 'u3LtSZDR1gr', 2);
INSERT INTO account (user_name, password, role_id) VALUES ('eromeo2q', 'AG9fQR44R', 1);
INSERT INTO account (user_name, password, role_id) VALUES ('cslarke2r', 'FFx0Vsh', 1);


-- 
-- Data for Name: customers; Type: TABLE DATA
-- 100
-- 

INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Casey', 'Jacobowicz', '884 961 3139', 'cjacobowicz0@studiopress.com', 'Arapahoe', 'Pruchnik', '37-560', 9);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Alvis', 'Georgi', '664 268 4412', 'ageorgi1@scribd.com', 'Sunnyside', 'Pruszków', '05-804', 44);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Florinda', 'Kaming', '189 917 4329', 'fkaming2@ihg.com', 'Calypso', 'Ujmisht', null, 3);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Abagail', 'Boutflour', '495 443 9175', 'aboutflour3@cocolog-nifty.com', 'Cambridge', 'Bolian', null, 23);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Patrice', 'Teaz', '635 780 8303', 'pteaz4@rambler.ru', 'Granby', 'Cienfuegos', null, 7);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Tilly', 'De Mitris', '233 772 6720', 'tdemitris5@smugmug.com', 'Brown', 'Fier', null, 47);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Meagan', 'Critten', '736 157 1030', 'mcritten6@barnesandnoble.com', 'Quincy', 'Lanta Timur', null, 37);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Darsey', 'Piscopo', '583 451 6043', 'dpiscopo7@marriott.com', 'Meadow Valley', 'Kandang Timur', null, 40);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Mellisent', 'Fawke', '648 199 5039', 'mfawke8@gravatar.com', 'Butterfield', 'Pavliš', null, 40);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Fremont', 'Giorgio', '240 793 8023', 'fgiorgio9@google.es', 'Leroy', 'L''Épiphanie', 'J5X', 8);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Krishna', 'Mumbray', '895 750 2724', 'kmumbraya@howstuffworks.com', 'John Wall', 'Huji', null, 8);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Becki', 'Dodimead', '211 530 0142', 'bdodimeadb@com.com', 'Hovde', 'San Cristóbal Verapaz', '21005', 35);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Sky', 'Kerrey', '312 588 3219', 'skerreyc@fda.gov', 'Banding', 'Xiangang', null, 2);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Brigit', 'Trebbett', '984 672 7721', 'btrebbettd@webeden.co.uk', 'Columbus', 'Trondheim', '7404', 37);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Candide', 'Kahen', '864 428 9673', 'ckahene@jalbum.net', 'Fallview', 'Bertioga', '11250-000', 30);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Lancelot', 'Baudain', '144 244 2791', 'lbaudainf@com.com', 'School', 'Пласница', '6539', 15);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Shina', 'Badland', '154 465 0240', 'sbadlandg@elegantthemes.com', 'Spohn', 'Panikian', '4327', 39);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Holden', 'Croasdale', '481 942 8997', 'hcroasdaleh@nps.gov', 'Stone Corner', 'Fier', null, 4);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Lara', 'Dillinton', '104 809 9723', 'ldillintoni@princeton.edu', 'Lawn', 'Berbérati', null, 17);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Flor', 'Gunningham', '424 125 6349', 'fgunninghamj@dot.gov', 'Talmadge', 'Kirkuk', null, 32);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Tyrus', 'Thormwell', '708 356 1988', 'tthormwellk@about.com', 'Nevada', 'Dolo', '1270', 2);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Ediva', 'Druhan', '227 336 6495', 'edruhanl@so-net.ne.jp', 'Sullivan', 'Hejiabao', null, 16);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Gabi', 'Sanderson', '769 680 7886', 'gsandersonm@chronoengine.com', 'Dayton', 'Palhoça', '88130-000', 9);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Opaline', 'Samudio', '931 405 7205', 'osamudion@theatlantic.com', 'La Follette', 'Mailag', '1602', 46);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Aviva', 'Purry', '353 591 1865', 'apurryo@bravesites.com', 'Susan', 'Tianxin', null, 37);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Cherie', 'Collman', '447 650 0373', 'ccollmanp@constantcontact.com', 'Evergreen', 'Frederiksberg', '1950', 27);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Ara', 'Longstaffe', '498 827 1686', 'alongstaffeq@nsw.gov.au', 'Melody', 'Tangyin', null, 25);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Stinky', 'Dummer', '155 151 3766', 'sdummerr@google.com.hk', 'Warbler', 'Myrnyy', null, 2);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Moyna', 'Jeske', '911 256 9935', 'mjeskes@tripadvisor.com', 'Sutherland', 'Beizhang', null, 45);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Barri', 'Deacock', '930 967 2085', 'bdeacockt@nih.gov', 'Lindbergh', 'Thika', null, 17);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Jecho', 'Edgin', '640 311 3381', 'jedginu@eepurl.com', 'Barnett', 'Hanyuan', null, 36);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Harvey', 'Kubasiewicz', '321 713 1692', 'hkubasiewiczv@soundcloud.com', 'Veith', 'Culasian', '6530', 14);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Arv', 'Picknett', '177 385 2843', 'apicknettw@vistaprint.com', 'Clemons', 'Gālīkesh', null, 48);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Tatiania', 'Dennerley', '144 131 4104', 'tdennerleyx@examiner.com', 'Hollow Ridge', 'Molchanovo', '636330', 9);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Orel', 'Flippini', '992 851 0155', 'oflippiniy@github.io', 'Eagan', 'Xinzhai', null, 50);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Shurlocke', 'Putt', '820 511 2419', 'sputtz@altervista.org', 'Lerdahl', 'Tanakbeak Daye', null, 24);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Delores', 'Laxe', '827 501 5899', 'dlaxe10@etsy.com', 'Kennedy', 'Esquipulas', '20706', 19);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Nananne', 'Beran', '499 154 3964', 'nberan11@chicagotribune.com', 'Acker', 'Vänersborg', '462 87', 31);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Karrie', 'Frangello', '834 224 5519', 'kfrangello12@reuters.com', '7th', 'Jiefang', null, 17);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Ivory', 'O''Henehan', '528 277 0297', 'iohenehan13@jugem.jp', 'Northview', 'Lukovë', null, 47);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Larissa', 'Di Maggio', '332 648 1147', 'ldimaggio14@mapy.cz', 'Bowman', 'Coalaque', null, 11);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Ondrea', 'Edwards', '578 312 1112', 'oedwards15@guardian.co.uk', 'Pine View', 'Dún Laoghaire', 'A96', 30);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Ari', 'Paramor', '602 137 7659', 'aparamor16@yelp.com', 'Judy', 'Berģi', null, 24);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Daren', 'Meneer', '620 307 6180', 'dmeneer17@merriam-webster.com', 'Caliangt', 'Dasuk', null, 14);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Carol', 'Roz', '467 499 0039', 'croz18@cdc.gov', 'Gina', 'Xia’ertai', null, 32);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Cecilla', 'Piggin', '726 954 4334', 'cpiggin19@angelfire.com', 'Upham', 'Vallenar', null, 43);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Webb', 'Khoter', '263 865 3990', 'wkhoter1a@printfriendly.com', 'Lakeland', 'Cendagah', null, 37);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Saundra', 'Le - Count', '344 108 6043', 'slecount1b@amazon.de', 'Kedzie', 'Göteborg', '401 24', 36);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Savina', 'Abramski', '349 709 2711', 'sabramski1c@vistaprint.com', 'Bobwhite', 'Proletar', null, 46);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Kass', 'Birtles', '244 715 6247', 'kbirtles1d@aol.com', 'Southridge', 'Sulūq', null, 38);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Nicki', 'Drissell', '267 871 4256', 'ndrissell1e@ow.ly', 'Spenser', 'Edéa', null, 46);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Carie', 'Bee', '753 814 3372', 'cbee1f@diigo.com', 'Utah', 'Ban Talat Bueng', '20170', 8);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Boony', 'Fould', '270 147 4643', 'bfould1g@seesaa.net', 'Mcguire', 'São Mateus do Maranhão', '65470-000', 48);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Baudoin', 'Elverstone', '650 169 6628', 'belverstone1h@amazon.co.jp', 'Bartelt', 'Gucheng', null, 26);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Hussein', 'Leftley', '309 523 2179', 'hleftley1i@tuttocitta.it', 'Grim', 'Orerokpe', null, 47);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Doralynn', 'Lysons', '873 806 7160', 'dlysons1j@google.com.hk', 'Columbus', 'Ust’-Izhora', '196658', 33);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Odey', 'Darthe', '465 322 1306', 'odarthe1k@independent.co.uk', 'Boyd', 'Peimei', null, 50);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Elisha', 'Le Teve', '698 346 7876', 'eleteve1l@ehow.com', 'Anderson', 'Honglu', null, 18);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Brynna', 'Waplington', '834 965 9761', 'bwaplington1m@taobao.com', 'Butternut', 'Galutu', null, 19);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Julian', 'Shambroke', '413 802 6289', 'jshambroke1n@godaddy.com', 'Fuller', 'Gebre Guracha', null, 48);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Carolus', 'Paddle', '519 685 9044', 'cpaddle1o@google.com', 'Melby', 'Tentúgal', '3140-555', 50);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Winona', 'Aubrey', '564 562 2954', 'waubrey1p@deviantart.com', 'Schlimgen', 'Huanza', null, 35);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Annora', 'Chadbourne', '285 146 5331', 'achadbourne1q@1und1.de', 'Buell', 'Kuwait City', null, 6);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Glynis', 'Basso', '953 181 6044', 'gbasso1r@uiuc.edu', 'Larry', 'Agrela', '4580-245', 27);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Alexandra', 'Dykins', '485 827 1726', 'adykins1s@yelp.com', 'Lakewood', 'Pouso Alegre', '37550-000', 38);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Wat', 'Rowney', '554 663 7177', 'wrowney1t@stanford.edu', 'Bobwhite', 'Beregovoy', '644905', 21);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Crosby', 'Fransinelli', '157 323 8418', 'cfransinelli1u@de.vu', 'Buhler', 'Pniv', null, 31);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Jacquelynn', 'Druitt', '246 658 8444', 'jdruitt1v@bloglovin.com', 'Northport', 'Wangjiachang', null, 43);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Bernardo', 'Iacomelli', '325 492 0129', 'biacomelli1w@epa.gov', 'David', 'Taiba', null, 4);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Sig', 'Gillham', '889 921 2425', 'sgillham1x@sina.com.cn', 'Mesta', 'Bảo Lộc', null, 23);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Arv', 'Gounel', '421 875 2136', 'agounel1y@rambler.ru', 'Utah', 'Sydney', '1140', 26);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Tessie', 'Grinsdale', '425 734 8529', 'tgrinsdale1z@youtu.be', 'Vernon', 'Seattle', '98115', 15);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Wilek', 'Gouly', '668 877 3488', 'wgouly20@quantcast.com', 'Darwin', 'Leiyang', null, 33);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Francis', 'Le Brom', '665 669 1277', 'flebrom21@walmart.com', 'Dorton', 'Rungis', '94525 CEDEX 1', 50);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Goldie', 'Jentle', '146 586 1579', 'gjentle22@123-reg.co.uk', 'Del Mar', 'Abbeville', '80104 CEDEX', 2);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Tedmund', 'Henriques', '406 998 2960', 'thenriques23@businessinsider.com', 'Kings', 'Chervonohryhorivka', null, 26);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Fax', 'Roddan', '128 463 3297', 'froddan24@livejournal.com', 'Grover', 'Nangger', null, 9);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Lauree', 'Flescher', '240 520 7890', 'lflescher25@go.com', 'Arizona', 'Älvängen', '446 38', 22);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Jarrett', 'Haslum', '801 501 3915', 'jhaslum26@china.com.cn', 'American Ash', 'Balakhta', '662340', 19);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Aurie', 'Meijer', '354 702 7645', 'ameijer27@shop-pro.jp', 'Warrior', 'Cambas', '6185-175', 44);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Kris', 'Tribe', '720 667 3290', 'ktribe28@booking.com', 'Everett', 'Marcabal', null, 30);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Eric', 'Shera', '613 580 6310', 'eshera29@technorati.com', 'Crownhardt', 'Xidajie', null, 13);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Cristy', 'Hucquart', '854 736 5661', 'chucquart2a@chicagotribune.com', 'Sage', 'Dakoro', null, 23);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Boigie', 'Lawford', '260 385 7000', 'blawford2b@google.nl', 'School', 'Lavradio', '2835-305', 33);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Colline', 'Hinkes', '301 716 5974', 'chinkes2c@elegantthemes.com', 'Brickson Park', 'Bussum', '1404', 36);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Lorant', 'Franiak', '568 667 9057', 'lfraniak2d@merriam-webster.com', 'Dawn', 'Barra de Carrasco', null, 15);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Brook', 'Aysh', '135 258 0548', 'baysh2e@godaddy.com', 'Becker', 'Marcara', null, 40);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Aldridge', 'Febry', '525 865 4945', 'afebry2f@arizona.edu', 'Homewood', 'Candoso', '5360-035', 14);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Hanny', 'Hovel', '345 595 9681', 'hhovel2g@livejournal.com', 'Orin', 'Chacabuco', '2670', 19);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Casi', 'Bissell', '247 354 8319', 'cbissell2h@google.it', 'Pierstorff', 'Urukh', '361366', 26);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Kissie', 'Readwood', '497 185 3280', 'kreadwood2i@last.fm', 'Reindahl', 'Oemollo', null, 27);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Valaree', 'Paz', '607 360 1115', 'vpaz2j@army.mil', 'Heath', 'Klyuchevsk', '623725', 33);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Farley', 'Jaffrey', '367 258 3513', 'fjaffrey2k@mapy.cz', 'Vahlen', 'Las Flores', '38823', 3);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Wheeler', 'Fayer', '551 738 7626', 'wfayer2l@mtv.com', 'Talmadge', 'Putrajawa', null, 35);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Ludvig', 'Glenister', '270 459 0888', 'lglenister2m@ftc.gov', 'Heath', 'Břasy', '338 24', 49);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Amalle', 'Ridett', '922 486 2870', 'aridett2n@1und1.de', 'Menomonie', 'La Courneuve', '93126 CEDEX', 4);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Jasen', 'Scarce', '768 899 3716', 'jscarce2o@forbes.com', 'Cherokee', 'Hualongyan', null, 22);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Kerri', 'Lodden', '194 355 8244', 'klodden2p@taobao.com', 'Glacier Hill', 'Soito', '3460-710', 44);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Mohandas', 'Lerer', '643 433 4415', 'mlerer2q@wp.com', 'Nobel', 'Montes', '2460-825', 33);
INSERT INTO customers (first_name, last_name, phone, email, street, city, zip_code, account_id) VALUES ('Audie', 'Boothby', '497 537 1374', 'aboothby2r@amazon.com', 'Magdeline', 'Haveliān', '22501', 16);

-- 
-- Data for Name: staffs; Type: TABLE DATA
-- 100
-- 

INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Sherm', 'Pillans', '858 446 0547', 'spillans0@hexun.com', 'Itaperuna', '28300-000', 57, false, 3);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Gabriellia', 'Labitt', '867 833 5246', 'glabitt1@walmart.com', 'Gaozhai', null, 77, true, 1);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Arabelle', 'Seifenmacher', '361 894 9210', 'aseifenmacher2@guardian.co.uk', 'Sylhet', '3109', 92, true, 2);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Seward', 'Millican', '114 467 1408', 'smillican3@yellowpages.com', 'Mawu', null, 79, false, 5);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Chrissy', 'Kisar', '272 540 7804', 'ckisar4@instagram.com', 'Banxi', null, 68, true, 3);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Danell', 'Wafer', '281 869 5094', 'dwafer5@hhs.gov', 'Veselynove', null, 66, true, 2);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Costa', 'Dosdale', '710 222 2652', 'cdosdale6@shareasale.com', 'Villaguay', '3240', 94, false, 4);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Duncan', 'Ferrillo', '569 773 1440', 'dferrillo7@youtube.com', 'Gaoqiao', null, 95, false, 3);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Elmo', 'Locke', '921 161 7158', 'elocke8@arstechnica.com', 'Zagoryanskiy', '141143', 62, true, 3);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Berni', 'Lautie', '389 174 1150', 'blautie9@google.it', 'Guataquí', '252827', 95, false, 2);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Rosana', 'Aggas', '807 369 7775', 'raggasa@auda.org.au', 'Santa Luċija', 'SLC', 78, false, 2);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Enos', 'Rosenstock', '293 678 7132', 'erosenstockb@ask.com', 'Stockholm', '103 22', 82, true, 5);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Austine', 'Gronous', '785 715 2628', 'agronousc@jimdo.com', 'Ballinroad', 'D07', 56, true, 5);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Davis', 'Dawidowsky', '581 551 6762', 'ddawidowskyd@shareasale.com', 'Krasnaye', null, 76, false, 3);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Jamill', 'Stockford', '875 268 3839', 'jstockforde@ftc.gov', 'Higashine', '999-3776', 80, true, 1);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Carolee', 'Knowller', '777 539 0437', 'cknowllerf@github.com', 'Huaccana', null, 73, false, 1);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Ezequiel', 'Champerlen', '132 970 6052', 'echamperleng@yahoo.co.jp', 'Árgos', null, 96, false, 3);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Meghann', 'Obern', '615 612 6051', 'mobernh@google.com.br', 'Daji', null, 65, false, 1);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Cybil', 'Elloy', '529 688 4810', 'celloyi@tiny.cc', 'Tralee', 'V92', 77, true, 1);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Bevvy', 'Mitrikhin', '803 431 8573', 'bmitrikhinj@github.io', 'Zhenshan', null, 92, false, 1);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Lowell', 'Tabour', '853 157 1072', 'ltabourk@alexa.com', 'Hamburg Winterhude', '22303', 51, true, 3);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Corinna', 'Buston', '711 853 3518', 'cbustonl@multiply.com', 'Nakhon Chai Si', '40160', 82, true, 4);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Cherise', 'Philipet', '341 305 6159', 'cphilipetm@sourceforge.net', 'Naha-shi', '903-0826', 74, true, 4);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Jordana', 'Tanzig', '399 546 0729', 'jtanzign@reuters.com', 'Kepoh', null, 60, false, 5);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Gwenore', 'August', '406 858 4615', 'gaugusto@squarespace.com', 'Hangzhou', null, 54, true, 3);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Raimondo', 'Ventum', '253 691 0838', 'rventump@ed.gov', 'Dalu', null, 63, true, 3);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Cullin', 'Trump', '658 531 6989', 'ctrumpq@cbsnews.com', 'Remedios', '052828', 56, false, 4);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Renell', 'Scholcroft', '659 922 5413', 'rscholcroftr@accuweather.com', 'Czchów', '32-860', 81, false, 2);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Winifield', 'Mannie', '785 161 0448', 'wmannies@foxnews.com', 'Meizhuang', null, 62, true, 4);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Johnna', 'Halton', '861 902 7397', 'jhaltont@thetimes.co.uk', 'Zamarski', '43-419', 90, true, 3);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Chastity', 'Jiles', '878 308 8886', 'cjilesu@oracle.com', 'Liping', null, 84, false, 2);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Allard', 'Gorcke', '816 205 2477', 'agorckev@latimes.com', 'Shchëkino', '301259', 90, false, 5);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Ronda', 'Mossbee', '772 656 3853', 'rmossbeew@instagram.com', 'Port Saint Lucie', '34985', 73, false, 3);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Cheri', 'Northcliffe', '523 959 6457', 'cnorthcliffex@oakley.com', 'Salantai', '97035', 62, false, 4);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Ulla', 'Duell', '307 664 9268', 'uduelly@ning.com', 'Lidong', null, 78, false, 5);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Leone', 'Busby', '634 939 1956', 'lbusbyz@blogger.com', 'Claresholm', 'V2T', 64, true, 1);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Agna', 'Caldwell', '615 231 3295', 'acaldwell10@columbia.edu', 'Vila Chã do Monte', '3510-868', 71, false, 5);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Nessie', 'MacDuff', '712 987 9036', 'nmacduff11@ovh.net', 'Yuelai', null, 60, false, 4);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Wes', 'Guttridge', '838 328 0291', 'wguttridge12@canalblog.com', 'Guangyubao', null, 60, true, 1);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Rustin', 'Hartridge', '355 956 7017', 'rhartridge13@lycos.com', 'Strelitsa', '397815', 96, false, 4);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Emily', 'Springell', '701 144 4766', 'espringell14@goodreads.com', 'Khlong Yai', '23110', 72, false, 3);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Connor', 'Paye', '807 274 6359', 'cpaye15@businessweek.com', 'Uchaly', '453703', 64, false, 2);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Giles', 'Comelli', '580 932 3540', 'gcomelli16@creativecommons.org', 'Ludvika', '771 24', 58, false, 1);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Chadd', 'Penny', '361 741 8040', 'cpenny17@artisteer.com', 'Rāiwind', '55150', 63, true, 5);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Dalila', 'Terrans', '807 772 6917', 'dterrans18@virginia.edu', 'Dístomo', null, 59, true, 5);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Randall', 'Manach', '629 615 2795', 'rmanach19@freewebs.com', 'Virginia', '9484', 86, true, 2);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Jorie', 'Ledgeway', '109 131 9508', 'jledgeway1a@tripod.com', 'Laval', '53022 CEDEX 9', 85, false, 1);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Elset', 'Biernat', '127 120 5943', 'ebiernat1b@squarespace.com', 'Lyon', '69395 CEDEX 03', 77, true, 3);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Zed', 'Sainer', '752 672 4146', 'zsainer1c@uol.com.br', 'Longxi', null, 92, true, 1);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Elsey', 'Queste', '409 855 1637', 'equeste1d@tmall.com', 'Kuangshan', null, 66, true, 2);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Ingaberg', 'Lochead', '285 892 7025', 'ilochead1e@paypal.com', 'Laholm', '312 31', 86, false, 1);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Riki', 'MacKeever', '854 829 2229', 'rmackeever1f@csmonitor.com', 'Kotingnatagete', null, 69, false, 1);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Fiorenze', 'Kinnear', '453 274 1895', 'fkinnear1e@tinypic.com', 'Sartrouville', '78504 CEDEX', 67, false, 32);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Brinn', 'Hunn', '943 668 1834', 'bhunn1f@mtv.com', 'Neglasari', null, 58, true, 22);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Evita', 'Gullen', '938 605 2380', 'egullen1g@prlog.org', 'Diez de Octubre', null, 83, false, 16);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Felice', 'Bleakman', '107 498 9595', 'fbleakman1h@mtv.com', 'Songjiang', null, 62, false, 23);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Giselbert', 'O''Crevan', '528 635 6432', 'gocrevan1i@ehow.com', 'Khovaling', null, 78, false, 9);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Harvey', 'Ianitti', '416 187 6562', 'hianitti1j@ifeng.com', 'Bergen op Zoom', '4609', 59, true, 48);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Elwira', 'Shafto', '967 947 5566', 'eshafto1k@gravatar.com', 'Santo Aleixo', '7450-227', 81, false, 5);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Cyrille', 'Croci', '758 748 1536', 'ccroci1l@symantec.com', 'Serra de Santa Marinha', '3080-570', 77, true, 49);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Cory', 'Rhubottom', '699 577 9641', 'crhubottom1m@photobucket.com', 'Cibangun Tengah', null, 80, true, 26);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Aleta', 'Lionel', '399 164 4187', 'alionel1n@simplemachines.org', 'Balfour', '2410', 100, true, 49);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Erina', 'Bauldry', '718 783 1731', 'ebauldry1o@auda.org.au', 'Cigaleuh Kulon', null, 76, false, 11);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Lydia', 'Scartifield', '281 898 8415', 'lscartifield1p@macromedia.com', 'Badou', null, 61, false, 21);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Elizabeth', 'Stain', '894 626 8680', 'estain1q@microsoft.com', 'Madrid', '28045', 90, true, 18);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Harlin', 'Bruyet', '512 228 4302', 'hbruyet1r@nymag.com', 'Austin', '78726', 50, true, 15);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Tildy', 'Wingate', '205 103 7790', 'twingate1s@ifeng.com', 'Naukot', '65011', 56, false, 32);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Hillier', 'Malt', '584 310 4595', 'hmalt1t@ycombinator.com', 'Gazimurskiy Zavod', '102213', 75, true, 9);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Daffie', 'Tort', '880 301 0813', 'dtort1u@telegraph.co.uk', 'Dolany', '783 16', 98, true, 16);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Riannon', 'Whiteman', '336 338 5444', 'rwhiteman1v@china.com.cn', 'Don Chedi', '72170', 92, true, 30);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Estrella', 'Izaks', '299 634 3658', 'eizaks1w@sourceforge.net', 'Eskilstuna', '633 42', 88, false, 50);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Cassy', 'McAvaddy', '304 534 6900', 'cmcavaddy1x@guardian.co.uk', 'Lidingö', '181 23', 52, true, 11);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Quintilla', 'Abelwhite', '339 204 3712', 'qabelwhite1y@ucoz.ru', 'Ramanavichy', null, 78, false, 42);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Chicky', 'Wye', '162 187 2869', 'cwye1z@google.com.hk', 'Itajaí', '88300-000', 84, false, 27);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Jessi', 'Netley', '823 345 3436', 'jnetley20@hc360.com', 'Guri i Zi', null, 52, false, 14);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Sammy', 'Dunning', '834 793 3530', 'sdunning21@vinaora.com', 'Siborong-borong', null, 64, false, 22);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Dun', 'Crennan', '343 318 7602', 'dcrennan22@nps.gov', 'Marinhais', '2125-106', 93, false, 48);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Mile', 'Dubery', '174 794 4861', 'mdubery23@ucsd.edu', 'Hřebeč', '571 01', 93, false, 14);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Edna', 'Woodyear', '419 439 1750', 'ewoodyear24@is.gd', 'Tegallega', null, 87, true, 8);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Madelle', 'Rodolf', '953 705 4262', 'mrodolf25@slate.com', 'New Shagunnu', null, 57, false, 7);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Cesaro', 'Benoist', '854 937 9841', 'cbenoist26@upenn.edu', 'Smolensk', '214501', 67, false, 10);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Wakefield', 'Durtnall', '578 667 0381', 'wdurtnall27@people.com.cn', 'Cempaka', null, 95, true, 11);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Asher', 'Hubbucks', '993 262 6328', 'ahubbucks28@vk.com', 'Moroto', null, 84, false, 16);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Ginevra', 'Yitzowitz', '271 278 7455', 'gyitzowitz29@dmoz.org', 'Västra Frölunda', '426 52', 76, false, 31);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Elmira', 'Bloxsome', '538 671 5728', 'ebloxsome2a@yolasite.com', 'Cajueiro', '57770-000', 56, false, 33);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Abe', 'Behling', '893 201 5605', 'abehling2b@godaddy.com', 'As Sūq al Jadīd', null, 94, false, 11);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Norry', 'Handes', '267 206 4045', 'nhandes2c@wikimedia.org', 'Pakong', null, 100, true, 48);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Marshall', 'McClifferty', '964 581 8933', 'mmcclifferty2d@moonfruit.com', 'Onokivtsi', null, 62, true, 46);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Morgan', 'Ravel', '144 781 7556', 'mravel2e@shutterfly.com', 'Daojiang', null, 93, false, 24);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Jerrie', 'Boldt', '235 376 2561', 'jboldt2f@linkedin.com', 'Banjar Kawan', null, 85, true, 17);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Gerda', 'Euston', '983 515 2029', 'geuston2g@twitter.com', 'Pubal', null, 90, true, 48);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Amberly', 'Novotna', '355 366 1957', 'anovotna2h@imgur.com', 'Ḩajjah', null, 77, false, 24);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Roanne', 'Gorick', '590 452 4282', 'rgorick2i@soundcloud.com', 'Wangyi Zhendian', null, 82, true, 7);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Devinne', 'Fetherstone', '932 417 8406', 'dfetherstone2j@xinhuanet.com', 'Torrevieja', '03184', 93, true, 46);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Rozina', 'Aguirrezabala', '994 215 4897', 'raguirrezabala2k@jiathis.com', 'Houzhai', null, 76, true, 16);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Augustina', 'Smogur', '856 358 0948', 'asmogur2l@nifty.com', 'Kiten', '8284', 75, true, 11);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Ingaberg', 'Kern', '773 103 4554', 'ikern2m@sakura.ne.jp', 'Namerikawa', '315-0022', 86, false, 8);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Rozalie', 'Bebbington', '367 875 8051', 'rbebbington2n@microsoft.com', 'Paitan Este', '3315', 91, false, 47);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Vittorio', 'Hallagan', '337 896 7449', 'vhallagan2o@java.com', 'Quchomo', null, 95, false, 37);
INSERT INTO staffs (first_name, last_name, phone, email, city, zip_code, account_id, active, manager_id) VALUES ('Junette', 'Steers', '903 157 2025', 'jsteers2p@ebay.co.uk', 'Noginsk', '601231', 83, false, 33);

-- 
-- Data for Name: orders; Type: TABLE DATA
-- 100
-- 

INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (7, 2, '10/27/2021', 89);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (47, 2, '2/4/2021', 92);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (56, 2, '8/13/2020', 71);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (91, 1, '6/20/2020', 71);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (35, 1, '5/27/2020', 35);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (89, 1, '2/14/2020', 45);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (56, 0, '11/25/2020', 38);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (61, 2, '9/22/2020', 9);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (52, 1, '3/26/2021', 40);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (50, 2, '10/13/2020', 71);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (11, 2, '10/12/2020', 40);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (63, 2, '10/6/2020', 87);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (95, 1, '7/29/2021', 86);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (70, 2, '7/14/2020', 70);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (81, 0, '4/16/2020', 82);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (30, 0, '3/16/2021', 51);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (46, 2, '6/18/2021', 4);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (88, 2, '10/5/2020', 54);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (7, 1, '3/7/2021', 50);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (91, 1, '7/3/2021', 31);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (19, 2, '7/14/2020', 65);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (42, 0, '3/15/2021', 97);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (28, 2, '5/1/2020', 16);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (76, 0, '11/30/2020', 95);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (98, 0, '6/25/2020', 59);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (62, 0, '5/15/2021', 33);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (53, 2, '4/9/2020', 42);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (51, 0, '10/8/2020', 99);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (69, 2, '10/21/2021', 43);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (46, 2, '3/28/2020', 86);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (59, 1, '3/1/2021', 45);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (2, 2, '7/29/2021', 65);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (80, 2, '10/7/2020', 3);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (65, 1, '8/5/2021', 38);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (11, 1, '9/9/2021', 49);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (70, 1, '11/23/2021', 77);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (22, 1, '11/23/2021', 82);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (46, 0, '11/21/2020', 5);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (88, 1, '6/30/2020', 42);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (92, 2, '2/3/2021', 51);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (62, 0, '12/12/2020', 49);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (6, 2, '5/20/2021', 81);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (3, 1, '7/7/2020', 74);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (4, 2, '3/27/2021', 92);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (52, 1, '3/26/2021', 50);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (4, 0, '6/14/2020', 96);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (93, 0, '12/18/2021', 1);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (62, 1, '4/3/2021', 42);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (57, 1, '6/6/2020', 46);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (85, 2, '4/6/2020', 63);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (23, 0, '2/28/2020', 15);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (41, 1, '8/27/2020', 42);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (70, 0, '3/5/2021', 61);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (69, 0, '1/16/2021', 13);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (48, 1, '3/4/2021', 64);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (41, 1, '8/10/2021', 57);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (7, 0, '1/15/2020', 2);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (55, 0, '10/17/2021', 73);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (41, 2, '4/15/2021', 37);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (53, 1, '11/19/2021', 41);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (77, 0, '12/19/2021', 61);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (96, 0, '12/22/2020', 62);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (51, 2, '9/12/2020', 10);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (35, 0, '10/21/2020', 18);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (99, 2, '8/12/2021', 78);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (23, 1, '7/17/2021', 95);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (33, 0, '1/8/2021', 9);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (71, 1, '5/13/2021', 41);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (87, 0, '6/15/2020', 50);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (5, 0, '7/30/2021', 79);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (45, 0, '3/24/2021', 27);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (59, 2, '2/8/2021', 24);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (87, 2, '4/9/2020', 8);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (16, 0, '1/11/2021', 33);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (5, 0, '7/7/2021', 99);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (84, 2, '10/1/2020', 53);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (20, 2, '12/20/2021', 1);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (93, 1, '8/20/2021', 28);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (78, 0, '2/16/2021', 80);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (38, 2, '2/15/2021', 29);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (92, 0, '4/25/2020', 63);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (59, 2, '3/5/2021', 9);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (58, 2, '1/16/2021', 9);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (7, 0, '8/19/2021', 20);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (94, 1, '8/25/2020', 89);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (22, 2, '2/9/2020', 52);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (97, 2, '6/1/2020', 11);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (40, 2, '2/13/2020', 40);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (76, 0, '7/6/2021', 46);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (55, 2, '3/13/2021', 25);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (50, 0, '2/12/2020', 9);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (14, 1, '6/1/2021', 67);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (45, 2, '1/29/2020', 25);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (6, 1, '9/6/2020', 60);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (96, 1, '4/24/2021', 6);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (75, 1, '7/3/2020', 23);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (55, 0, '11/13/2020', 70);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (73, 0, '12/21/2020', 88);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (20, 2, '7/18/2020', 72);
INSERT INTO orders (customer_id, order_status, order_date, staff_id) VALUES (64, 1, '9/14/2021', 49);

-- 
-- Data for Name: brands; Type: TABLE DATA
-- 20
-- 

INSERT INTO brands (brand_name) VALUES ('Samsung');
INSERT INTO brands (brand_name) VALUES ('OPPO');
INSERT INTO brands (brand_name) VALUES ('Xiaomi');
INSERT INTO brands (brand_name) VALUES ('Apple');
INSERT INTO brands (brand_name) VALUES ('Huawei');
INSERT INTO brands (brand_name) VALUES ('Nokia');
INSERT INTO brands (brand_name) VALUES ('Vivo');
INSERT INTO brands (brand_name) VALUES ('OnePlus');
INSERT INTO brands (brand_name) VALUES ('Realme');
INSERT INTO brands (brand_name) VALUES ('Motorola');
INSERT INTO brands (brand_name) VALUES ('Sony');
INSERT INTO brands (brand_name) VALUES ('Panasonic');
INSERT INTO brands (brand_name) VALUES ('Acer');
INSERT INTO brands (brand_name) VALUES ('V-smart');
INSERT INTO brands (brand_name) VALUES ('Alcatel');
INSERT INTO brands (brand_name) VALUES ('MEIZU');
INSERT INTO brands (brand_name) VALUES ('BenQ');
INSERT INTO brands (brand_name) VALUES ('Erisson');
INSERT INTO brands (brand_name) VALUES ('QMobile');
INSERT INTO brands (brand_name) VALUES ('Verizon');

-- 
-- Data for Name: categories; Type: TABLE DATA
-- 10
-- 

INSERT INTO categories (category_name) VALUES ('smartphones');
INSERT INTO categories (category_name) VALUES ('tablets');
INSERT INTO categories (category_name) VALUES ('smartwatches');
INSERT INTO categories (category_name) VALUES ('laptop');
INSERT INTO categories (category_name) VALUES ('accessory');
INSERT INTO categories (category_name) VALUES ('pc');
INSERT INTO categories (category_name) VALUES ('headphone');
INSERT INTO categories (category_name) VALUES ('smart pencil');
INSERT INTO categories (category_name) VALUES ('smart speakers');
INSERT INTO categories (category_name) VALUES ('smart moniter');

-- 
-- Data for Name: products; Type: TABLE DATA
-- 100
-- 

INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Samsung-3D', 1, 6, 2006, 214.47);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Samsung-9Y', 1, 10, 1992, 347.73);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Samsung-02', 1, 5, 1996, 362.0);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Samsung-5U', 1, 3, 2011, 662.37);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Samsung-W7', 1, 8, 2013, 508.36);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Samsung-LP', 1, 3, 1985, 223.45);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Samsung-OT', 1, 5, 1993, 185.52);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Samsung-V1', 1, 5, 1995, 447.04);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Samsung-DS', 1, 3, 2002, 461.15);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Samsung-3R', 1, 4, 1986, 516.01);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('OPPO-VP', 2, 9, 2006, 721.86);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('OPPO-GX', 2, 7, 2007, 347.98);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('OPPO-39', 2, 1, 2001, 112.58);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('OPPO-P8', 2, 7, 2000, 551.79);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('OPPO-EF', 2, 5, 1993, 525.18);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('OPPO-DA', 2, 5, 1994, 907.32);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Xiaomi-W5', 3, 9, 2008, 664.87);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Xiaomi-U4', 3, 5, 2009, 867.39);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Xiaomi-NO', 3, 6, 2010, 868.49);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Xiaomi-IM', 3, 6, 2011, 763.99);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Xiaomi-TS', 3, 10, 2004, 164.82);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Xiaomi-BZ', 3, 10, 2010, 163.43);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Xiaomi-E2', 3, 1, 2010, 636.77);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Xiaomi-5O', 3, 2, 2001, 347.76);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Xiaomi-XH', 3, 9, 2000, 157.63);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Apple-7', 4, 2, 2013, 777.15);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Apple-11', 4, 1, 2020, 273.68);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Apple-5', 4, 8, 2007, 616.86);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Apple-14', 4, 7, 2023, 694.51);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Apple-12', 4, 7, 2020, 566.0);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Apple-7', 4, 5, 2008, 436.8);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Huawei-PC', 5, 6, 2003, 479.0);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Huawei-KY', 5, 1, 2008, 983.9);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Huawei-BV', 5, 1, 2004, 104.07);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Huawei-5Y', 5, 7, 2003, 780.88);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Nokia-AC', 6, 5, 1991, 407.81);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Nokia-R5', 6, 3, 1997, 918.26);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Nokia-RV', 6, 3, 1998, 185.36);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Nokia-1U', 6, 6, 2010, 374.22);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Vivo-3Z', 7, 2, 1998, 118.62);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Vivo-VB', 7, 10, 2000, 272.43);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Vivo-L4', 7, 8, 2006, 885.6);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Vivo-HS', 7, 10, 1998, 295.46);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Vivo-TN', 7, 5, 1993, 284.36);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('OnePlus-RK', 8, 1, 2007, 215.67);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('OnePlus-MX', 8, 7, 2008, 938.99);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('OnePlus-MY', 8, 3, 2007, 417.68);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Realme-BE', 9, 8, 2002, 116.26);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Realme-CM', 9, 10, 2010, 805.31);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Realme-2C', 9, 8, 1998, 295.57);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Realme-12', 9, 6, 1997, 476.03);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Motorola-LP', 10, 4, 1992, 829.95);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Motorola-3Y', 10, 8, 2009, 850.34);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Motorola-BX', 10, 4, 2005, 540.1);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Motorola-XD', 10, 6, 1994, 677.67);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Motorola-G0', 10, 3, 1955, 162.56);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Motorola-TF', 10, 4, 2012, 662.96);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Motorola-7L', 10, 10, 2007, 439.44);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Sony-B1', 11, 8, 2008, 467.42);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Sony-I5', 11, 1, 1994, 887.69);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Sony-PH', 11, 10, 2008, 404.12);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Sony-KL', 11, 6, 1993, 444.23);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Sony-IG', 11, 3, 1994, 952.46);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Panasonic-DY', 12, 2, 2009, 616.79);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Panasonic-1R', 12, 4, 1969, 823.06);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Panasonic-QL', 12, 4, 1992, 331.51);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Acer-2S', 13, 2, 2001, 411.25);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Acer-23', 13, 6, 2010, 488.63);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Acer-FR', 13, 3, 1985, 764.81);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Acer-OS', 13, 10, 1998, 431.54);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('V-smart-35', 14, 10, 2006, 929.5);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('V-smart-MA', 14, 10, 2003, 860.94);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('V-smart-5K', 14, 8, 2000, 340.41);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Alcatel-LW', 15, 2, 1996, 159.09);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Alcatel-7A', 15, 5, 2008, 442.93);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Alcatel-LA', 15, 1, 1994, 525.34);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Alcatel-2K', 15, 1, 2003, 625.5);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('MEIZU-37', 16, 2, 1988, 180.5);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('MEIZU-5A', 16, 1, 1988, 182.95);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('MEIZU-5Q', 16, 7, 1999, 284.75);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('MEIZU-TQ', 16, 2, 2004, 433.48);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('BenQ-76', 17, 2, 2008, 967.43);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('BenQ-NL', 17, 1, 2010, 304.9);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('BenQ-99', 17, 7, 2009, 519.13);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('BenQ-BE', 17, 8, 2000, 464.66);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Erisson-P7', 18, 5, 2001, 637.8);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Erisson-39', 18, 3, 2007, 844.18);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Erisson-PN', 18, 10, 2004, 753.67);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Erisson-NE', 18, 1, 2011, 586.9);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('QMobile-26', 19, 4, 2001, 681.45);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('QMobile-ET', 19, 8, 2008, 349.13);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Verizon-47', 20, 7, 2007, 792.37);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Verizon-EN', 20, 1, 2007, 328.29);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Verizon-2O', 20, 8, 2008, 608.09);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Verizon-YQ', 20, 2, 1993, 322.22);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Verizon-DU', 20, 2, 1998, 325.18);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Verizon-1B', 20, 7, 2009, 280.28);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Verizon-8M', 20, 3, 2011, 888.33);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Verizon-H0', 20, 6, 2003, 752.87);
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price) VALUES ('Verizon-W0', 20, 3, 2012, 495.84);

-- 
-- Data for Name: stocks; Type: TABLE DATA
-- 100
-- 

INSERT INTO stocks (product_id, quantity) VALUES (1, 190);
INSERT INTO stocks (product_id, quantity) VALUES (2, 183);
INSERT INTO stocks (product_id, quantity) VALUES (3, 132);
INSERT INTO stocks (product_id, quantity) VALUES (4, 196);
INSERT INTO stocks (product_id, quantity) VALUES (5, 120);
INSERT INTO stocks (product_id, quantity) VALUES (6, 107);
INSERT INTO stocks (product_id, quantity) VALUES (7, 169);
INSERT INTO stocks (product_id, quantity) VALUES (8, 112);
INSERT INTO stocks (product_id, quantity) VALUES (9, 171);
INSERT INTO stocks (product_id, quantity) VALUES (10, 190);
INSERT INTO stocks (product_id, quantity) VALUES (11, 187);
INSERT INTO stocks (product_id, quantity) VALUES (12, 121);
INSERT INTO stocks (product_id, quantity) VALUES (13, 127);
INSERT INTO stocks (product_id, quantity) VALUES (14, 165);
INSERT INTO stocks (product_id, quantity) VALUES (15, 126);
INSERT INTO stocks (product_id, quantity) VALUES (16, 121);
INSERT INTO stocks (product_id, quantity) VALUES (17, 123);
INSERT INTO stocks (product_id, quantity) VALUES (18, 140);
INSERT INTO stocks (product_id, quantity) VALUES (19, 184);
INSERT INTO stocks (product_id, quantity) VALUES (20, 102);
INSERT INTO stocks (product_id, quantity) VALUES (21, 145);
INSERT INTO stocks (product_id, quantity) VALUES (22, 103);
INSERT INTO stocks (product_id, quantity) VALUES (23, 125);
INSERT INTO stocks (product_id, quantity) VALUES (24, 104);
INSERT INTO stocks (product_id, quantity) VALUES (25, 112);
INSERT INTO stocks (product_id, quantity) VALUES (26, 145);
INSERT INTO stocks (product_id, quantity) VALUES (27, 167);
INSERT INTO stocks (product_id, quantity) VALUES (28, 198);
INSERT INTO stocks (product_id, quantity) VALUES (29, 188);
INSERT INTO stocks (product_id, quantity) VALUES (30, 129);
INSERT INTO stocks (product_id, quantity) VALUES (31, 187);
INSERT INTO stocks (product_id, quantity) VALUES (32, 183);
INSERT INTO stocks (product_id, quantity) VALUES (33, 131);
INSERT INTO stocks (product_id, quantity) VALUES (34, 161);
INSERT INTO stocks (product_id, quantity) VALUES (35, 150);
INSERT INTO stocks (product_id, quantity) VALUES (36, 128);
INSERT INTO stocks (product_id, quantity) VALUES (37, 119);
INSERT INTO stocks (product_id, quantity) VALUES (38, 143);
INSERT INTO stocks (product_id, quantity) VALUES (39, 134);
INSERT INTO stocks (product_id, quantity) VALUES (40, 110);
INSERT INTO stocks (product_id, quantity) VALUES (41, 188);
INSERT INTO stocks (product_id, quantity) VALUES (42, 114);
INSERT INTO stocks (product_id, quantity) VALUES (43, 187);
INSERT INTO stocks (product_id, quantity) VALUES (44, 105);
INSERT INTO stocks (product_id, quantity) VALUES (45, 193);
INSERT INTO stocks (product_id, quantity) VALUES (46, 123);
INSERT INTO stocks (product_id, quantity) VALUES (47, 194);
INSERT INTO stocks (product_id, quantity) VALUES (48, 183);
INSERT INTO stocks (product_id, quantity) VALUES (49, 131);
INSERT INTO stocks (product_id, quantity) VALUES (50, 175);
INSERT INTO stocks (product_id, quantity) VALUES (51, 191);
INSERT INTO stocks (product_id, quantity) VALUES (52, 135);
INSERT INTO stocks (product_id, quantity) VALUES (53, 147);
INSERT INTO stocks (product_id, quantity) VALUES (54, 122);
INSERT INTO stocks (product_id, quantity) VALUES (55, 173);
INSERT INTO stocks (product_id, quantity) VALUES (56, 151);
INSERT INTO stocks (product_id, quantity) VALUES (57, 195);
INSERT INTO stocks (product_id, quantity) VALUES (58, 187);
INSERT INTO stocks (product_id, quantity) VALUES (59, 163);
INSERT INTO stocks (product_id, quantity) VALUES (60, 169);
INSERT INTO stocks (product_id, quantity) VALUES (61, 141);
INSERT INTO stocks (product_id, quantity) VALUES (62, 132);
INSERT INTO stocks (product_id, quantity) VALUES (63, 104);
INSERT INTO stocks (product_id, quantity) VALUES (64, 161);
INSERT INTO stocks (product_id, quantity) VALUES (65, 121);
INSERT INTO stocks (product_id, quantity) VALUES (66, 160);
INSERT INTO stocks (product_id, quantity) VALUES (67, 196);
INSERT INTO stocks (product_id, quantity) VALUES (68, 174);
INSERT INTO stocks (product_id, quantity) VALUES (69, 148);
INSERT INTO stocks (product_id, quantity) VALUES (70, 104);
INSERT INTO stocks (product_id, quantity) VALUES (71, 109);
INSERT INTO stocks (product_id, quantity) VALUES (72, 132);
INSERT INTO stocks (product_id, quantity) VALUES (73, 109);
INSERT INTO stocks (product_id, quantity) VALUES (74, 172);
INSERT INTO stocks (product_id, quantity) VALUES (75, 153);
INSERT INTO stocks (product_id, quantity) VALUES (76, 126);
INSERT INTO stocks (product_id, quantity) VALUES (77, 120);
INSERT INTO stocks (product_id, quantity) VALUES (78, 162);
INSERT INTO stocks (product_id, quantity) VALUES (79, 200);
INSERT INTO stocks (product_id, quantity) VALUES (80, 126);
INSERT INTO stocks (product_id, quantity) VALUES (81, 160);
INSERT INTO stocks (product_id, quantity) VALUES (82, 150);
INSERT INTO stocks (product_id, quantity) VALUES (83, 174);
INSERT INTO stocks (product_id, quantity) VALUES (84, 104);
INSERT INTO stocks (product_id, quantity) VALUES (85, 126);
INSERT INTO stocks (product_id, quantity) VALUES (86, 133);
INSERT INTO stocks (product_id, quantity) VALUES (87, 134);
INSERT INTO stocks (product_id, quantity) VALUES (88, 153);
INSERT INTO stocks (product_id, quantity) VALUES (89, 191);
INSERT INTO stocks (product_id, quantity) VALUES (90, 184);
INSERT INTO stocks (product_id, quantity) VALUES (91, 143);
INSERT INTO stocks (product_id, quantity) VALUES (92, 188);
INSERT INTO stocks (product_id, quantity) VALUES (93, 136);
INSERT INTO stocks (product_id, quantity) VALUES (94, 198);
INSERT INTO stocks (product_id, quantity) VALUES (95, 162);
INSERT INTO stocks (product_id, quantity) VALUES (96, 181);
INSERT INTO stocks (product_id, quantity) VALUES (97, 116);
INSERT INTO stocks (product_id, quantity) VALUES (98, 187);
INSERT INTO stocks (product_id, quantity) VALUES (99, 172);
INSERT INTO stocks (product_id, quantity) VALUES (100, 188);

-- 
-- Data for Name: items; Type: TABLE DATA
-- 400
-- 

INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('7EV-29-2ZK', 84, '1/19/2020', 'Purple', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('C3L-YV-FSO', 70, '7/14/2003', 'Indigo', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('3L7-9Z-CWE', 23, '5/7/2002', 'Puce', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('178-IP-OPX', 5, '10/19/2000', 'Aquamarine', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('UC6-06-JCU', 58, '3/21/2000', 'Maroon', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('ZFR-RE-QHD', 6, '7/11/2017', 'Crimson', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('O8G-ED-S2F', 72, '4/3/2008', 'Turquoise', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('EIZ-WD-9WE', 65, '4/3/2021', 'Goldenrod', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('0EK-2B-L7Y', 95, '9/26/2005', 'Puce', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('BVC-RG-EUI', 69, '7/9/2000', 'Red', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('RPZ-TM-AK4', 36, '10/4/2021', 'Pink', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('H8V-MC-OQA', 79, '5/27/2012', 'Blue', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('J56-2X-2TB', 41, '12/28/2000', 'Purple', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('R4B-0S-NY2', 81, '7/14/2009', 'Aquamarine', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('G0R-95-6AD', 82, '7/6/2018', 'Turquoise', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('KT5-4P-8GE', 1, '9/19/2016', 'Fuscia', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('1FW-7F-1K1', 31, '6/3/2014', 'Teal', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('1W2-QM-OK0', 19, '6/1/2013', 'Pink', '32GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('ZFM-5M-D66', 77, '7/11/2011', 'Orange', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('93J-3N-DYH', 36, '5/6/2018', 'Crimson', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('5E3-YC-1CU', 95, '9/21/2018', 'Indigo', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('T7U-IR-8PG', 77, '9/9/2018', 'Blue', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('RJB-37-WVS', 31, '2/26/2008', 'Green', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('8OL-AJ-01W', 78, '10/3/2015', 'Crimson', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('LSJ-LF-JO2', 59, '11/26/2001', 'Pink', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('C92-2N-TG8', 21, '12/9/2007', 'Indigo', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('SI5-63-SEI', 100, '12/10/2003', 'Maroon', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('DY0-CP-LLP', 6, '4/23/2001', 'Purple', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('TAA-O9-5KH', 36, '2/7/2017', 'Mauv', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('H38-EN-A0Z', 89, '7/23/2002', 'Pink', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('GMU-6M-1FB', 26, '9/12/2012', 'Mauv', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('Q61-W8-IBZ', 53, '11/29/2004', 'Fuscia', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('KPI-2O-40D', 21, '12/26/2012', 'Mauv', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('EJQ-MJ-UZ3', 86, '2/11/2001', 'Mauv', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('QG6-N7-8ZG', 38, '11/21/2008', 'Pink', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('Q97-45-TPQ', 85, '9/13/2022', 'Blue', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('7XZ-SP-5VJ', 99, '1/7/2008', 'Indigo', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('CG4-B9-MWT', 82, '6/11/2008', 'Teal', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('1O1-UT-NRZ', 45, '5/7/2020', 'Aquamarine', '32GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('SOV-L0-10W', 98, '9/11/2014', 'Aquamarine', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('588-F7-4YG', 75, '1/17/2019', 'Blue', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('IZS-BY-3CB', 91, '3/14/2001', 'Puce', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('4QM-XA-P0M', 89, '7/13/2008', 'Mauv', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('PPQ-QH-EJK', 14, '2/10/2019', 'Aquamarine', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('M5T-HW-860', 14, '10/29/2004', 'Puce', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('CK8-7R-TFI', 31, '11/29/2012', 'Purple', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('5AH-K2-8LP', 36, '11/9/2021', 'Orange', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('X8Z-QG-IUR', 11, '7/20/2022', 'Turquoise', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('9H1-CY-A8U', 95, '8/6/2021', 'Yellow', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('YCI-CU-KW4', 58, '6/9/2016', 'Violet', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('XAJ-JR-516', 80, '11/7/2010', 'Turquoise', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('N4I-LX-PR0', 78, '3/15/2022', 'Blue', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('LVZ-W1-VRU', 56, '1/5/2003', 'Mauv', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('SM9-XK-FMI', 97, '8/3/2021', 'Khaki', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('T8C-Q5-BPX', 25, '4/15/2009', 'Green', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('IMH-RQ-QCD', 25, '7/11/2012', 'Orange', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('GD0-AY-TBU', 64, '4/12/2019', 'Khaki', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('JHC-S0-798', 7, '6/1/2021', 'Goldenrod', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('VZ9-P4-0HN', 46, '9/25/2001', 'Khaki', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('4PT-XD-J3X', 3, '3/24/2017', 'Khaki', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('MAS-KT-S2R', 9, '10/2/2007', 'Goldenrod', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('BBK-2U-U4B', 20, '4/21/2011', 'Violet', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('QN6-8H-9N8', 86, '2/11/2012', 'Turquoise', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('TM3-CR-3CP', 29, '6/7/2010', 'Pink', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('LNE-BS-H7C', 18, '3/27/2002', 'Mauv', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('F79-4D-ZKY', 52, '4/19/2006', 'Mauv', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('VES-KD-U1W', 3, '12/14/2021', 'Khaki', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('X7U-I5-EMG', 86, '7/8/2014', 'Khaki', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('6S9-GL-DL1', 75, '9/30/2012', 'Purple', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('Q9D-A9-9R6', 84, '3/11/2019', 'Green', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('IEO-MW-BKI', 81, '9/12/2004', 'Goldenrod', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('9R4-EJ-TRW', 68, '1/29/2022', 'Green', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('09Z-84-98U', 67, '12/22/2004', 'Yellow', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('RX3-X3-3F5', 47, '12/29/2007', 'Khaki', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('QYV-SO-2TY', 88, '5/24/2004', 'Red', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('NBH-NA-87S', 7, '3/15/2003', 'Fuscia', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('XZX-MZ-NJB', 15, '1/16/2017', 'Indigo', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('4LQ-M1-9J3', 10, '9/26/2005', 'Blue', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('Q2Z-NH-UYO', 90, '10/4/2002', 'Turquoise', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('GDN-HM-45F', 4, '3/3/2020', 'Red', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('KYW-NG-EJ6', 1, '3/24/2013', 'Puce', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('O4K-GG-LLG', 50, '8/12/2000', 'Purple', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('EZ8-DA-QVU', 59, '6/24/2002', 'Khaki', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('2N4-1F-1T7', 62, '3/2/2012', 'Red', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('V6V-OT-WMA', 28, '7/10/2010', 'Orange', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('2WG-YT-1KH', 26, '7/26/2014', 'Pink', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('DMY-RV-J1B', 73, '12/16/2001', 'Maroon', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('LQ6-K5-VAP', 42, '7/5/2002', 'Pink', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('BU5-DT-K9S', 75, '11/23/2016', 'Puce', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('3FF-AL-PF4', 81, '10/2/2007', 'Blue', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('035-BY-Z2O', 15, '3/18/2010', 'Puce', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('LRF-11-7W4', 68, '9/25/2004', 'Khaki', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('N8R-L4-TMN', 32, '6/18/2006', 'Khaki', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('H1K-MW-AJE', 93, '4/1/2017', 'Aquamarine', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('OI5-VV-36U', 38, '9/18/2006', 'Green', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('IYG-S1-KQG', 22, '4/28/2005', 'Maroon', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('MUQ-MB-I91', 45, '11/24/2000', 'Khaki', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('3C5-Y8-NDR', 74, '10/28/2015', 'Mauv', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('FQS-54-9O5', 12, '3/21/2016', 'Red', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('0IP-3H-H65', 14, '11/26/2002', 'Indigo', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('2HH-TW-5ZP', 55, '10/31/2001', 'Teal', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('EV5-T0-EHK', 98, '12/25/2001', 'Khaki', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('X5R-HA-8PL', 49, '11/9/2021', 'Turquoise', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('Y18-04-750', 86, '7/31/2010', 'Orange', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('XIM-R4-WP8', 63, '8/25/2000', 'Purple', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('DVO-11-IX1', 3, '7/1/2008', 'Mauv', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('7EU-D2-6B4', 57, '9/23/2002', 'Goldenrod', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('SJN-2E-670', 19, '8/2/2022', 'Aquamarine', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('V7R-NK-918', 8, '8/11/2019', 'Mauv', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('OBJ-G5-WWK', 47, '9/3/2021', 'Aquamarine', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('GFI-WS-XIH', 25, '8/7/2007', 'Goldenrod', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('R6Z-02-46O', 34, '6/7/2015', 'Khaki', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('N5E-Q2-5JR', 11, '4/17/2003', 'Green', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('8ZW-SZ-TY3', 50, '1/4/2006', 'Goldenrod', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('UXN-JR-WZ8', 28, '1/6/2015', 'Blue', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('9D9-4L-05Y', 89, '10/4/2016', 'Maroon', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('NQM-FB-UN0', 88, '6/29/2013', 'Goldenrod', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('4KJ-RT-NOG', 65, '8/6/2015', 'Goldenrod', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('C4U-6N-SEE', 58, '1/23/2005', 'Fuscia', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('LXA-3B-DAF', 100, '3/14/2010', 'Purple', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('0VG-CX-MRG', 100, '1/16/2022', 'Crimson', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('H2W-NR-8EP', 66, '6/9/2009', 'Purple', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('8AF-IX-N3K', 95, '12/22/2008', 'Khaki', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('1Y5-22-K3M', 83, '8/9/2015', 'Teal', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('MF0-DJ-HN3', 85, '7/27/2016', 'Fuscia', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('ZOV-FY-ADH', 60, '4/25/2006', 'Goldenrod', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('DBF-BF-DW9', 32, '2/6/2022', 'Maroon', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('8PE-J5-FMO', 22, '10/9/2021', 'Purple', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('Z8K-Q1-N1C', 49, '3/22/2008', 'Maroon', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('93M-18-OK3', 92, '8/13/2017', 'Mauv', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('1BI-VN-XTW', 35, '4/17/2019', 'Puce', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('Z20-Q8-UG5', 74, '9/25/2021', 'Violet', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('XKT-TO-3Y3', 45, '2/10/2018', 'Turquoise', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('1NF-78-78N', 84, '10/11/2016', 'Green', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('ECB-SX-C94', 61, '11/21/2005', 'Yellow', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('O05-T5-GXG', 95, '12/8/2005', 'Mauv', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('DKN-ZO-GHG', 73, '4/12/2000', 'Mauv', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('HI3-V7-W2F', 42, '3/26/2015', 'Mauv', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('146-UZ-8B0', 82, '6/29/2005', 'Indigo', '64GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('F2P-83-9KF', 1, '6/15/2004', 'Aquamarine', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('K2V-EL-BL4', 58, '5/21/2004', 'Mauv', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('ZO1-PS-4R4', 49, '6/19/2003', 'Khaki', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('QHL-XN-F5V', 81, '2/19/2012', 'Green', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('W0W-QC-4EZ', 17, '4/11/2019', 'Crimson', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('EOY-B6-97T', 24, '7/19/2012', 'Maroon', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('TGS-08-SLX', 45, '7/16/2022', 'Yellow', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('VHT-I9-MML', 84, '5/12/2001', 'Blue', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('JWU-JZ-QJA', 10, '9/17/2015', 'Turquoise', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('PTX-FK-AUV', 96, '10/22/2003', 'Puce', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('TKG-1D-18O', 31, '7/21/2000', 'Purple', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('DY6-R2-LHS', 52, '5/30/2020', 'Indigo', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('77U-GS-1MR', 92, '8/9/2013', 'Teal', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('4DC-E0-KT6', 77, '2/23/2022', 'Goldenrod', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('2S7-NU-DKO', 92, '2/8/2007', 'Red', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('263-1Y-XPN', 9, '9/21/2012', 'Khaki', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('TUW-1F-TXX', 39, '4/24/2009', 'Khaki', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('DN9-EJ-Q52', 68, '2/21/2009', 'Orange', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('JIX-AG-PMF', 4, '8/7/2021', 'Orange', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('NWZ-YS-9RH', 96, '9/22/2000', 'Teal', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('IEG-W9-TWB', 95, '10/27/2009', 'Turquoise', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('9E1-32-F86', 94, '1/24/2020', 'Green', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('CN5-PF-THC', 75, '1/23/2021', 'Yellow', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('DNL-VD-D8C', 64, '8/6/2011', 'Crimson', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('HH7-F6-YW9', 9, '1/2/2017', 'Maroon', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('OHQ-VM-CSQ', 26, '2/10/2003', 'Fuscia', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('UPE-XM-EZV', 99, '11/4/2008', 'Fuscia', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('120-7B-WBE', 30, '2/19/2019', 'Maroon', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('3V2-74-K5G', 1, '4/27/2000', 'Indigo', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('C7O-WD-BOL', 75, '7/8/2021', 'Purple', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('RQZ-16-OMH', 45, '12/25/2005', 'Green', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('A5Q-32-CYP', 53, '1/14/2020', 'Green', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('6NA-5Q-MG2', 15, '4/20/2014', 'Orange', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('UOP-GT-I44', 80, '3/10/2001', 'Crimson', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('99D-18-O02', 46, '10/4/2001', 'Purple', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('PUJ-NM-M3V', 25, '8/5/2016', 'Khaki', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('ER2-RP-QG2', 15, '1/7/2010', 'Khaki', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('VMO-OZ-T1C', 40, '11/3/2011', 'Khaki', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('B3A-WP-FUQ', 48, '12/20/2013', 'Red', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('2RS-14-QHM', 33, '5/3/2022', 'Maroon', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('LYA-6N-6TM', 4, '6/20/2019', 'Green', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('XAU-MK-ARB', 50, '6/4/2005', 'Green', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('4EU-OM-EK2', 91, '11/10/2001', 'Orange', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('MTL-HY-WIO', 8, '10/17/2018', 'Blue', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('JXN-LM-P8K', 64, '2/29/2020', 'Pink', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('W99-C5-NPH', 11, '7/23/2006', 'Turquoise', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('81S-ZH-R7X', 36, '6/1/2017', 'Fuscia', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('KMT-YO-4LE', 66, '3/21/2000', 'Aquamarine', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('4GX-V3-O0M', 35, '11/12/2010', 'Purple', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('A9V-XT-THB', 51, '4/18/2012', 'Pink', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('6A1-9X-375', 19, '11/26/2015', 'Blue', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('OXB-H2-JKA', 16, '6/20/2008', 'Yellow', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('E4F-R0-P1F', 84, '3/18/2004', 'Orange', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('BP5-0P-71U', 39, '11/9/2012', 'Fuscia', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('VIG-WU-XGH', 53, '8/17/2017', 'Pink', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('19T-LC-WQS', 67, '2/20/2007', 'Purple', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('74W-M0-DGN', 100, '3/12/2017', 'Red', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('K2H-0J-WK3', 39, '12/18/2003', 'Maroon', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('UPU-8F-ECX', 8, '2/4/2008', 'Purple', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('TXO-3G-X7X', 27, '3/27/2022', 'Fuscia', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('PXP-U4-B1U', 1, '8/9/2013', 'Pink', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('NLB-IH-ZPS', 85, '8/5/2005', 'Fuscia', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('D9E-WW-ECE', 28, '6/19/2014', 'Orange', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('HYC-SZ-9B9', 32, '1/17/2011', 'Green', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('9JT-81-RG1', 30, '9/29/2003', 'Puce', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('NRN-VG-00U', 74, '1/19/2010', 'Goldenrod', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('3WI-YN-IRN', 34, '6/28/2011', 'Crimson', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('KBJ-1S-L7R', 27, '12/1/2018', 'Violet', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('DA7-P7-EYQ', 61, '10/27/2021', 'Turquoise', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('U8Q-IN-GHB', 40, '3/6/2005', 'Indigo', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('LDE-41-FHO', 80, '8/24/2020', 'Green', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('QLZ-97-RLP', 16, '3/30/2017', 'Goldenrod', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('KOM-6C-BVR', 52, '5/11/2017', 'Indigo', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('ONU-L7-2MU', 33, '6/22/2005', 'Blue', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('WYA-LT-8P4', 22, '12/12/2008', 'Maroon', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('KPX-LF-D9J', 64, '12/10/2015', 'Mauv', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('VDB-LY-X3S', 77, '10/30/2018', 'Mauv', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('IO8-V3-YCD', 62, '2/23/2022', 'Purple', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('JZM-ZX-C3D', 91, '1/5/2020', 'Red', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('HPV-12-IRO', 19, '11/10/2002', 'Blue', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('IBO-1S-BKW', 77, '1/5/2020', 'Puce', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('HEG-SO-X8J', 68, '3/15/2004', 'Mauv', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('35C-56-ESU', 5, '6/16/2007', 'Crimson', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('9RS-TQ-2WB', 100, '9/9/2004', 'Green', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('269-4O-M4K', 69, '3/22/2003', 'Green', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('VDE-F9-6K4', 76, '3/6/2000', 'Goldenrod', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('AXU-9B-VIV', 2, '11/17/2019', 'Goldenrod', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('JVH-GT-BQY', 66, '7/16/2008', 'Violet', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('FRK-8Z-YP4', 71, '3/16/2010', 'Turquoise', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('TI3-OP-E53', 3, '2/27/2002', 'Violet', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('YE7-UB-4TZ', 20, '3/6/2000', 'Crimson', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('2B2-WD-C13', 17, '9/4/2018', 'Teal', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('CXD-YG-YIL', 21, '3/19/2008', 'Green', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('ZZU-KC-5EA', 51, '2/24/2009', 'Purple', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('7NZ-0L-OED', 70, '10/14/2019', 'Orange', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('AXP-Y5-Y5V', 88, '1/9/2018', 'Turquoise', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('41H-97-7TE', 81, '9/24/2006', 'Yellow', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('NFI-YU-9UX', 72, '8/25/2018', 'Violet', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('07A-DP-6X3', 93, '4/27/2016', 'Pink', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('EZ0-J4-0OR', 64, '4/14/2005', 'Purple', '64GB', '128GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('YYZ-CD-GFU', 1, '5/11/2013', 'Purple', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('MWY-RH-962', 36, '10/31/2000', 'Fuscia', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('30F-AB-RNH', 94, '6/25/2020', 'Teal', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('V88-HW-T9N', 15, '3/8/2019', 'Orange', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('C1D-0P-AR5', 1, '5/1/2001', 'Green', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('M0U-56-SFM', 15, '11/25/2004', 'Red', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('Z61-BQ-FSC', 51, '12/17/2022', 'Red', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('NZH-34-GG2', 76, '11/19/2001', 'Crimson', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('HWP-YM-V6R', 1, '5/29/2015', 'Khaki', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('B92-FT-X8G', 1, '6/17/2010', 'Turquoise', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('R47-YN-26S', 94, '12/17/2015', 'Maroon', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('D3A-K3-G0Q', 44, '9/17/2008', 'Yellow', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('GVM-4C-IPX', 33, '7/3/2003', 'Purple', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('LLS-0P-COB', 4, '12/10/2001', 'Khaki', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('YXG-D6-QDF', 6, '4/21/2008', 'Red', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('2CC-BR-1DA', 84, '8/18/2009', 'Blue', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('PV9-2Z-Y46', 1, '6/19/2008', 'Puce', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('KOW-DY-FH6', 71, '12/27/2003', 'Goldenrod', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('KQP-GE-Q9A', 20, '1/2/2007', 'Mauv', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('IAA-4C-RI4', 95, '10/19/2017', 'Orange', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('4BI-4V-LBW', 45, '2/23/2004', 'Teal', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('TEF-08-5P3', 42, '2/8/2013', 'Aquamarine', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('XI2-M8-S7S', 33, '9/26/2002', 'Puce', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('PA5-Q7-QY6', 84, '10/19/2014', 'Blue', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('5R4-EV-RJS', 56, '2/23/2004', 'Goldenrod', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('7L7-GY-VOE', 19, '1/12/2002', 'Yellow', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('REV-GZ-CI2', 19, '10/28/2022', 'Puce', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('EHZ-OZ-3I5', 16, '11/9/2000', 'Turquoise', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('O5C-72-V63', 18, '2/21/2014', 'Yellow', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('MO1-VL-AEP', 52, '8/20/2017', 'Pink', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('LM9-98-XV3', 55, '4/24/2011', 'Pink', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('G06-P1-NNI', 37, '6/10/2013', 'Violet', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('FKE-V2-NOM', 81, '6/17/2008', 'Fuscia', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('TUR-FA-PGR', 53, '7/9/2000', 'Teal', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('IYP-4T-O5J', 53, '11/12/2008', 'Orange', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('PVW-L2-1O7', 17, '4/24/2002', 'Blue', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('ALX-TE-OOA', 53, '3/20/2017', 'Yellow', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('58Z-H3-T4V', 76, '12/4/2002', 'Red', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('1VS-OP-OWD', 9, '1/23/2020', 'Mauv', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('BQB-SQ-6V6', 35, '11/7/2015', 'Turquoise', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('3E7-RR-9CH', 14, '9/16/2002', 'Maroon', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('DRX-9S-40F', 61, '2/14/2019', 'Red', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('1XR-1F-VMY', 57, '10/24/2017', 'Indigo', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('7XP-WZ-77B', 50, '5/28/2000', 'Yellow', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('Q63-TM-ATX', 51, '2/20/2014', 'Goldenrod', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('PCV-J3-0M5', 78, '4/24/2008', 'Purple', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('YYF-3Q-Z54', 91, '12/2/2009', 'Maroon', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('2JD-5Q-JDS', 1, '10/13/2019', 'Crimson', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('MQ8-JV-YE5', 50, '4/19/2012', 'Puce', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('C89-F7-GLY', 14, '6/30/2009', 'Khaki', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('SWP-XW-3XA', 79, '7/31/2017', 'Yellow', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('KAT-WO-9VU', 95, '2/15/2005', 'Violet', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('PGD-MJ-9X7', 43, '1/15/2003', 'Yellow', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('8QK-4N-SHN', 74, '11/17/2009', 'Yellow', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('7KY-4V-XP7', 53, '4/25/2010', 'Indigo', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('RER-L7-1TX', 15, '3/30/2017', 'Khaki', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('CJC-99-XKZ', 31, '4/22/2022', 'Purple', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('05O-GJ-2JU', 18, '6/20/2001', 'Aquamarine', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('H4C-S9-L6J', 34, '3/14/2002', 'Violet', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('75J-4Z-N7H', 85, '5/14/2008', 'Teal', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('4WG-W7-GGC', 75, '12/17/2002', 'Goldenrod', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('CW9-90-6YF', 30, '3/29/2020', 'Green', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('EMB-88-CXS', 88, '2/7/2021', 'Yellow', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('LVY-OK-GIS', 50, '7/3/2022', 'Goldenrod', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('SES-R7-OXF', 22, '4/27/2019', 'Indigo', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('SGJ-IL-JKT', 66, '7/31/2000', 'Puce', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('9DV-Y4-LTX', 45, '10/7/2008', 'Fuscia', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('6O0-ZB-ODI', 99, '5/5/2009', 'Turquoise', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('F3K-CK-WZB', 46, '9/25/2000', 'Goldenrod', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('S02-H3-9AK', 49, '8/26/2013', 'Orange', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('VOA-Z4-MH3', 42, '1/21/2000', 'Violet', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('RQN-MQ-QO9', 7, '11/28/2011', 'Fuscia', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('4SJ-SF-WQ7', 40, '9/23/2009', 'Crimson', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('X3L-L3-11U', 88, '6/22/2009', 'Fuscia', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('0KW-GB-RXJ', 91, '11/28/2002', 'Fuscia', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('556-K4-WLW', 36, '3/26/2010', 'Orange', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('DL7-MK-S9D', 29, '8/21/2022', 'Teal', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('QYL-09-STI', 97, '3/20/2018', 'Fuscia', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('DFL-WY-H7U', 48, '9/29/2019', 'Pink', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('QFY-JX-31W', 4, '10/24/2008', 'Khaki', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('U98-H9-Q7K', 56, '3/25/2009', 'Pink', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('653-U2-84U', 42, '4/10/2022', 'Violet', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('LAZ-38-GII', 81, '2/2/2017', 'Red', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('4FS-EE-4BT', 27, '5/16/2012', 'Green', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('V3J-9T-R9T', 85, '10/24/2013', 'Yellow', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('V5U-7W-R12', 75, '2/17/2017', 'Fuscia', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('8KS-8E-BCT', 8, '1/5/2020', 'Orange', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('E0Y-48-L9Z', 49, '9/26/2022', 'Orange', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('I59-8E-7JN', 46, '11/29/2011', 'Orange', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('DWR-N1-KOV', 74, '12/18/2010', 'Teal', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('F48-2A-KPK', 84, '10/21/2000', 'Mauv', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('W5R-YU-XAP', 8, '4/29/2003', 'Goldenrod', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('DJH-LG-LM7', 13, '12/24/2016', 'Crimson', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('120-IC-CMQ', 5, '4/13/2008', 'Aquamarine', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('PT9-64-SIP', 75, '7/1/2008', 'Teal', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('NUK-1D-1XO', 86, '9/14/2007', 'Red', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('TH8-4S-GV1', 50, '5/26/2010', 'Turquoise', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('8P2-16-F7L', 78, '3/12/2014', 'Blue', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('FS7-0H-3P5', 2, '2/11/2004', 'Yellow', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('O50-UX-T12', 96, '6/20/2008', 'Fuscia', '16GB', '16GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('PG4-Z5-I8W', 35, '8/22/2002', 'Pink', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('IAE-FW-TJ6', 8, '10/27/2019', 'Pink', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('LWW-YG-7J5', 59, '10/24/2020', 'Mauv', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('HKJ-IV-I10', 20, '10/3/2006', 'Goldenrod', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('U0D-YP-SRL', 45, '6/3/2005', 'Blue', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('IMH-93-6U4', 38, '5/1/2010', 'Orange', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('YDZ-RU-M3R', 25, '3/30/2013', 'Aquamarine', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('M1U-WN-IEY', 19, '11/3/2013', 'Red', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('5QA-38-813', 35, '1/12/2002', 'Indigo', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('0HM-4O-Z1R', 73, '9/18/2012', 'Pink', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('LF3-1Q-N1F', 12, '9/27/2015', 'Indigo', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('I4Z-L3-95V', 29, '1/18/2005', 'Yellow', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('TK7-G0-FZG', 95, '3/12/2020', 'Teal', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('26Q-KB-J3J', 46, '8/3/2005', 'Crimson', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('CE2-XH-EAF', 2, '12/20/2018', 'Orange', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('2J1-F7-S9M', 37, '9/22/2003', 'Turquoise', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('OKA-WO-45E', 99, '6/3/2005', 'Orange', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('Q5F-H6-XVS', 72, '6/20/2009', 'Red', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('LRN-3N-71I', 66, '9/9/2013', 'Teal', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('EOP-FM-D78', 82, '11/8/2008', 'Aquamarine', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('H2B-XA-7TJ', 100, '4/19/2011', 'Red', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('PXW-6O-MWN', 55, '4/23/2019', 'Purple', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('AYZ-SZ-V0T', 70, '12/7/2003', 'Teal', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('09X-NM-C0A', 38, '1/29/2008', 'Red', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('8ST-VM-08H', 89, '11/11/2001', 'Pink', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('049-1G-59E', 44, '6/28/2004', 'Mauv', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('0OT-YI-EU9', 78, '11/7/2001', 'Indigo', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('9XH-RN-LZ1', 48, '12/31/2015', 'Purple', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('LHB-Q1-C1O', 41, '9/16/2002', 'Purple', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('E90-0H-3K2', 35, '8/25/2003', 'Fuscia', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('0PH-IW-662', 41, '1/20/2021', 'Yellow', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('IEX-WL-G72', 50, '7/9/2003', 'Orange', '16GB', '32GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('EAE-MF-NN7', 14, '4/6/2001', 'Crimson', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('JKK-U1-6WP', 51, '9/9/2009', 'Crimson', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('VA8-IW-A9W', 53, '6/15/2017', 'Teal', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('Y75-AG-DQP', 55, '9/29/2001', 'Fuscia', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('SV4-1H-PMH', 3, '1/2/2018', 'Orange', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('ONW-S7-YYC', 26, '6/18/2017', 'Aquamarine', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('CK6-XI-XZL', 58, '4/11/2016', 'Crimson', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('LP9-I5-IL3', 99, '9/4/2008', 'Maroon', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('QIZ-JF-4Q1', 84, '9/13/2011', 'Fuscia', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('HF9-SN-3JS', 9, '3/20/2012', 'Maroon', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('3LB-UM-P2F', 58, '11/17/2002', 'Aquamarine', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('6L6-JI-4JS', 72, '5/15/2019', 'Fuscia', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('3SP-ZH-EK9', 14, '9/29/2016', 'Khaki', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('1XZ-X5-YAA', 56, '1/11/2001', 'Crimson', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('J8O-ZC-MGU', 66, '11/14/2001', 'Teal', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('5KH-01-JLV', 59, '3/8/2002', 'Blue', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('AL6-WS-522', 6, '2/15/2013', 'Pink', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('HWW-1S-9OH', 71, '4/27/2007', 'Mauv', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('FON-ZR-3IV', 45, '11/2/2005', 'Yellow', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('698-IC-6JW', 59, '9/18/2009', 'Turquoise', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('OIF-CO-U5X', 69, '6/13/2001', 'Indigo', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('57B-NK-BNC', 61, '8/22/2010', 'Maroon', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('S2E-EG-9GS', 66, '4/8/2009', 'Purple', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('WZK-18-JFB', 77, '11/16/2017', 'Fuscia', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('5W8-CV-ISJ', 17, '1/31/2008', 'Orange', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('9SZ-X7-4IK', 62, '8/31/2011', 'Blue', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('N6G-I4-YIW', 78, '10/20/2021', 'Mauv', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('DA0-84-DJT', 68, '5/21/2007', 'Khaki', '16GB', '64GB');
INSERT INTO items (serial_code, product_id, MFG, color, RAM, ROM) VALUES ('S3U-DU-4FP', 81, '12/23/2016', 'Purple', '16GB', '64GB');

-- 
-- Data for Name: order_details; Type: TABLE DATA
-- 50
-- 

INSERT INTO order_details (order_id, serial_code, discount) VALUES (15, 'S3U-DU-4FP', 2.84);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (91, 'DA0-84-DJT', 2.05);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (34, 'N6G-I4-YIW', 6.43);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (29, '9SZ-X7-4IK', 6.19);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (4, '5W8-CV-ISJ', 4.74);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (60, 'WZK-18-JFB', 2.28);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (88, 'S2E-EG-9GS', 5.37);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (74, '57B-NK-BNC', 2.25);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (80, 'OIF-CO-U5X', 4.06);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (24, 'HF9-SN-3JS', 4.58);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (51, 'QIZ-JF-4Q1', 5.86);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (78, 'ONW-S7-YYC', 2.69);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (32, 'VA8-IW-A9W', 4.75);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (98, 'IEX-WL-G72', 3.98);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (46, 'LHB-Q1-C1O', 8.22);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (76, '049-1G-59E', 4.05);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (4, '09X-NM-C0A', 1.26);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (37, 'PXW-6O-MWN', 1.64);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (98, 'LRN-3N-71I', 7.55);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (66, '2J1-F7-S9M', 5.9);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (64, 'LF3-1Q-N1F', 9.35);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (8, 'YDZ-RU-M3R', 2.09);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (42, 'IMH-93-6U4', 8.69);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (25, 'U0D-YP-SRL', 7.01);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (18, 'HKJ-IV-I10', 6.29);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (89, 'IAE-FW-TJ6', 6.76);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (84, 'PG4-Z5-I8W', 4.78);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (44, 'O50-UX-T12', 1.77);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (92, '8P2-16-F7L', 4.65);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (83, 'NUK-1D-1XO', 6.53);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (50, 'W5R-YU-XAP', 5.28);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (19, 'F48-2A-KPK', 9.59);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (96, 'DWR-N1-KOV', 2.66);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (27, 'V5U-7W-R12', 5.63);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (47, 'LAZ-38-GII', 1.92);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (79, 'U98-H9-Q7K', 4.4);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (5, 'QYL-09-STI', 9.75);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (86, '556-K4-WLW', 2.35);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (84, 'RQN-MQ-QO9', 5.84);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (61, '6O0-ZB-ODI', 4.22);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (95, 'EMB-88-CXS', 2.87);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (93, 'H4C-S9-L6J', 1.96);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (20, 'PGD-MJ-9X7', 7.6);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (98, 'YYF-3Q-Z54', 6.38);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (80, 'ALX-TE-OOA', 1.45);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (10, '2CC-BR-1DA', 3.26);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (79, 'B92-FT-X8G', 1.41);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (48, 'AXU-9B-VIV', 9.74);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (90, 'HPV-12-IRO', 8.72);
INSERT INTO order_details (order_id, serial_code, discount) VALUES (18, 'QLZ-97-RLP', 9.27);

-- 
-- Data for Name: coverages; Type: TABLE DATA
-- 50
-- 

-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('S3U-DU-4FP', 1);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('DA0-84-DJT', 2);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('N6G-I4-YIW', 3);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('9SZ-X7-4IK', 4);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('5W8-CV-ISJ', 5);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('WZK-18-JFB', 6);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('S2E-EG-9GS', 7);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('57B-NK-BNC', 8);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('OIF-CO-U5X', 9);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('HF9-SN-3JS', 10);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('QIZ-JF-4Q1', 11);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('ONW-S7-YYC', 12);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('VA8-IW-A9W', 13);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('IEX-WL-G72', 14);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('LHB-Q1-C1O', 15);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('049-1G-59E', 16);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('09X-NM-C0A', 17);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('PXW-6O-MWN', 18);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('LRN-3N-71I', 19);
-- INSERT INTO coverages (serial_code, coverages_expired_date) VALUES ('2J1-F7-S9M', 20);

-- INSERT INTO coverages (order_id) VALUES (84);
-- INSERT INTO coverages (order_id) VALUES (19);
-- INSERT INTO coverages (order_id) VALUES (14);
-- INSERT INTO coverages (order_id) VALUES (90);
-- INSERT INTO coverages (order_id) VALUES (63);
-- INSERT INTO coverages (order_id) VALUES (32);
-- INSERT INTO coverages (order_id) VALUES (21);
-- INSERT INTO coverages (order_id) VALUES (1);
-- INSERT INTO coverages (order_id) VALUES (7);
-- INSERT INTO coverages (order_id) VALUES (93);
-- INSERT INTO coverages (order_id) VALUES (9);
-- INSERT INTO coverages (order_id) VALUES (58);
-- INSERT INTO coverages (order_id) VALUES (46);
-- INSERT INTO coverages (order_id) VALUES (74);
-- INSERT INTO coverages (order_id) VALUES (1);
-- INSERT INTO coverages (order_id) VALUES (90);
-- INSERT INTO coverages (order_id) VALUES (50);
-- INSERT INTO coverages (order_id) VALUES (60);
-- INSERT INTO coverages (order_id) VALUES (17);
-- INSERT INTO coverages (order_id) VALUES (59);
-- INSERT INTO coverages (order_id) VALUES (48);
-- INSERT INTO coverages (order_id) VALUES (23);
-- INSERT INTO coverages (order_id) VALUES (70);
-- INSERT INTO coverages (order_id) VALUES (18);
-- INSERT INTO coverages (order_id) VALUES (26);
-- INSERT INTO coverages (order_id) VALUES (79);
-- INSERT INTO coverages (order_id) VALUES (12);
-- INSERT INTO coverages (order_id) VALUES (98);
-- INSERT INTO coverages (order_id) VALUES (71);
-- INSERT INTO coverages (order_id) VALUES (90);
-- INSERT INTO coverages (order_id) VALUES (42);
-- INSERT INTO coverages (order_id) VALUES (63);
-- INSERT INTO coverages (order_id) VALUES (16);
-- INSERT INTO coverages (order_id) VALUES (23);
-- INSERT INTO coverages (order_id) VALUES (36);
-- INSERT INTO coverages (order_id) VALUES (3);
-- INSERT INTO coverages (order_id) VALUES (90);
-- INSERT INTO coverages (order_id) VALUES (13);
-- INSERT INTO coverages (order_id) VALUES (57);
-- INSERT INTO coverages (order_id) VALUES (95);
-- INSERT INTO coverages (order_id) VALUES (12);
-- INSERT INTO coverages (order_id) VALUES (46);
-- INSERT INTO coverages (order_id) VALUES (65);
-- INSERT INTO coverages (order_id) VALUES (7);
-- INSERT INTO coverages (order_id) VALUES (74);
-- INSERT INTO coverages (order_id) VALUES (66);
-- INSERT INTO coverages (order_id) VALUES (17);
-- INSERT INTO coverages (order_id) VALUES (40);
-- INSERT INTO coverages (order_id) VALUES (76);
-- INSERT INTO coverages (order_id) VALUES (82);
