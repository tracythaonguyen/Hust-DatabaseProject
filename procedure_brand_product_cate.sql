-- PROCEDURE new_brand(brand_name)
-- check brand_name, auto generate brand_id

CREATE PROCEDURE new_brand(brand_name VARCHAR(255))
LANGUAGE plpgsql
AS $$
DECLARE brand_id BIGINT;
BEGIN
	IF NOT EXISTS(SELECT * FROM product.brands b WHERE b.brand_name = $1)
	THEN
		BEGIN
      SELECT COUNT(*)+1 INTO brand_id FROM product.brands;
			--INSERT
			INSERT INTO product.brands VALUES (brand_id, brand_name);
		END;
	ELSE
		RAISE NOTICE 'Already have: %', brand_name ;
	END IF;
END;
$$;

-- PRECEDURE new_category(category_name)

CREATE PROCEDURE new_category(category_name VARCHAR(255))
LANGUAGE plpgsql
AS $$
DECLARE category_id BIGINT;
BEGIN
	IF NOT EXISTS(SELECT * FROM product.categories c WHERE c.category_name = $1)
	THEN
		BEGIN
      SELECT COUNT(*)+1 INTO category_id FROM product.categories;
			--INSERT
			INSERT INTO product.categories VALUES (category_id, category_name);
		END;
	ELSE
		RAISE NOTICE 'Already have: %', category_name ;
	END IF;
END;
$$;

-- PROCEDURE new_product()

CREATE PROCEDURE new_product(product_name VARCHAR(255), brand_id BIGINT, category_id BIGINT, model_year CHAR(4), list_price DECIMAL(10,2))
LANGUAGE plpgsql
AS $$
DECLARE product_id BIGINT;
BEGIN
  SELECT COUNT(*)+1 INTO product_id FROM products;
  --INSERT
  INSERT INTO products VALUES (product_id, product_name, brand_id, category_id, model_year, list_price);
END;
$$;


--
-- INSERT DATA --
--

-- brand (100)

CALL new_brand('Samsung');
CALL new_brand('OPPO');
CALL new_brand('Xiaomi');
CALL new_brand('Apple');
CALL new_brand('Huawei');
CALL new_brand('Nokia');
CALL new_brand('Vivo');
CALL new_brand('OnePlus');
CALL new_brand('Realme');
CALL new_brand('Motorola');
CALL new_brand('Sony');
CALL new_brand('Panasonic');
CALL new_brand('Acer');
CALL new_brand('V-smart');
CALL new_brand('Alcatel');
CALL new_brand('MEIZU');
CALL new_brand('BenQ');
CALL new_brand('Erisson');
CALL new_brand('QMobile');
CALL new_brand('Verizon');
CALL new_brand('360');
CALL new_brand('Aermoo');
CALL new_brand('AGM');
CALL new_brand('Allcall');
CALL new_brand('Allview');
CALL new_brand('Amigo');
CALL new_brand('Amoi');
CALL new_brand('Archos');
CALL new_brand('Asus');
CALL new_brand('Axgio');
CALL new_brand('BlackShark');
CALL new_brand('BlackBerry');
CALL new_brand('Blackview');
CALL new_brand('BLU');
CALL new_brand('Bluboo');
CALL new_brand('BQ');
CALL new_brand('Bsimb');
CALL new_brand('Cagabi');
CALL new_brand('Cat');
CALL new_brand('Caterpillar');
CALL new_brand('Centric');
CALL new_brand('Cong');
CALL new_brand('Coolpad');
CALL new_brand('Cubot');
CALL new_brand('Dakele');
CALL new_brand('Doogee');
CALL new_brand('Doopro');
CALL new_brand('E&L');
CALL new_brand('Ecoo');
CALL new_brand('Elephone');
CALL new_brand('Energy');
CALL new_brand('Essential');
CALL new_brand('EStar');
CALL new_brand('Faea');
CALL new_brand('Fairphone');
CALL new_brand('Geotel');
CALL new_brand('Gigabyte');
CALL new_brand('Gigaset');
CALL new_brand('Gionee');
CALL new_brand('Gome');
CALL new_brand('Google');
CALL new_brand('Goophone');
CALL new_brand('Gretel');
CALL new_brand('Hafury');
CALL new_brand('Haier');
CALL new_brand('Hike');
CALL new_brand('HiSense');
CALL new_brand('HP');
CALL new_brand('HTC');
CALL new_brand('Hotwav');
CALL new_brand('iLa');
CALL new_brand('iMan');
CALL new_brand('iNew');
CALL new_brand('Infinix');
CALL new_brand('InFocus');
CALL new_brand('IUNI');
CALL new_brand('Jesy');
CALL new_brand('Jiake');
CALL new_brand('Kazam');
CALL new_brand('Kodak');
CALL new_brand('Lava');
CALL new_brand('Leotec');
CALL new_brand('Ly');
CALL new_brand('Meitu');
CALL new_brand('Maze');
CALL new_brand('Mstar');
CALL new_brand('Neo');
CALL new_brand('Nothing');
CALL new_brand('Palm');
CALL new_brand('POCO');
CALL new_brand('Runbo');
CALL new_brand('Sharp');
CALL new_brand('TCL');
CALL new_brand('VPhone');
CALL new_brand('Xolo');
CALL new_brand('Wiko');
CALL new_brand('YU');
CALL new_brand('Zopo');
CALL new_brand('ZTE');
CALL new_brand('Zuk');

-- category (20)

CALL new_category('tablets');
CALL new_category('laptop');
CALL new_category('pc');
CALL new_category('headphone');
CALL new_category('smart pencil');
CALL new_category('smart speakers');
CALL new_category('smart moniter');
CALL new_category('smart phones');
CALL new_category('smart watches');
CALL new_category('television');
CALL new_category('batteries');
CALL new_category('case');
CALL new_category('charge');
CALL new_category('wire');
CALL new_category('socket');
CALL new_category('stickers');
CALL new_category('bag');
CALL new_category('screen');
CALL new_category('music speaker');
CALL new_category('bluetooth speaker');

-- product (100)

CALL new_product('Samsung Galaxy Z-Fold 3', 1, 8, '2019', 714.47);
CALL new_product('Samsung Galaxy Note 4', 1, 8, '2020', 847.73);
CALL new_product('Samsung Galaxy M33', 1, 8, '2019', 562.0);
CALL new_product('Samsung Galaxy A53', 1, 8, '2021', 662.37);
CALL new_product('Samsung Galaxy S22 Ultra', 1, 8, '2022', 508.36);
CALL new_product('Neo QLED 8k', 1, 10, '2022', 1461.15);
CALL new_product('Neo QLED 4k', 1, 10, '2020', 1516.01);
CALL new_product('QLED 4k', 1, 10, '2021', 1716.01);
CALL new_product('The Frame', 1, 10, '2022', 1816.01);
CALL new_product('Ultra Slim', 1, 19, '2020', 216.01);
CALL new_product('OPPO Find X5 Pro', 2, 8, '2020', 521.86);
CALL new_product('OPPO Find X3 Pro', 2, 8, '2019', 447.98);
CALL new_product('OPPO Reno8 Pro', 2, 8, '2021', 547.98);
CALL new_product('OPPO A96', 2, 8, '2020', 247.98);
CALL new_product('OPPO A95', 2, 8, '2020', 287.98);
CALL new_product('OPPO R11', 2, 20, '2019', 89.98);
CALL new_product('VOCC OPPO', 2, 14, '2020', 49.98);
CALL new_product('CASE CLEAR OPPO', 2, 12, '2019', 49.98);
CALL new_product('Xiaomi Mi Max', 3, 8, '2020', 664.87);
CALL new_product('Mi Note 10 Pro', 3, 8, '2022', 864.87);
CALL new_product('Mi Mix Alpha', 3, 8, '2020', 564.87);
CALL new_product('Xiaomi Redmi', 3, 8, '2022', 364.87);
CALL new_product('Iphone-11', 4, 8, '2020', 773.68);
CALL new_product('Iphone-7', 4, 8, '2019', 316.86);
CALL new_product('Iphone-14', 4, 8, '2023', 1194.51);
CALL new_product('Iphone-12', 4, 8, '2020', 966.0);
CALL new_product('Iphone-10', 4, 8, '2019', 436.8);
CALL new_product('Iphone-XS Max', 4, 8, '2019', 497.8);
CALL new_product('Macbook Pro M2', 4, 5, '2022', 1836.8);
CALL new_product('Macbook Air M2', 4, 2, '2022', 1436.8);
CALL new_product('Macbook Pro M1', 4, 5, '2020', 1536.8);
CALL new_product('Macbook Air M1', 4, 2, '2020', 1236.8);
CALL new_product('Mac Mini', 4, 3, '2020', 1836.8);
CALL new_product('Ipad Pro M1', 4, 1, '2020', 936.8);
CALL new_product('Ipad Pro M2', 4, 1, '2022', 1098.8);
CALL new_product('Ipad Air M1', 4, 1, '2020', 697.8);
CALL new_product('Ipad Mini', 4, 1, '2019', 497.8);
CALL new_product('Apple Watch Ultra', 4, 9, '2019', 397.8);
CALL new_product('Apple Watch Series 8', 4, 9, '2020', 497.8);
CALL new_product('Apple Watch SE', 4, 9, '2021', 502.8);
CALL new_product('Airpods 2nd Generation', 4, 20, '2020', 102.8);
CALL new_product('Airpods 3rd Generation', 4, 20, '2021', 202.8);
CALL new_product('Airpods Max', 4, 20, '2022', 232.8);
CALL new_product('Apple TV 4K', 4, 10, '2021', 2232.8);
CALL new_product('Apple Pencil', 4, 5, '2020', 99.8);
CALL new_product('HUAWEI Mate 30 Pro', 5, 8, '2020', 579.0);
CALL new_product('HUAWEI Mate 20 Pro', 5, 8, '2021', 479.0);
CALL new_product('HUAWEI Mate 20', 5, 1, '2021', 583.9);
CALL new_product('HUAWEI MateBook 14', 5, 2, '2022', 1304.07);
CALL new_product('HUAWEI MateBook D 16', 5, 2, '2021', 1104.07);
CALL new_product('HUAWEI MateBook D 14 AMD', 5, 2, '2021', 974.07);
CALL new_product('HUAWEI MatePad', 5, 1, '2022', 874.07);
CALL new_product('HUAWEI MatePad 11', 5, 1, '2021', 674.07);
CALL new_product('HUAWEI MatePad T 10s', 5, 1, '2020', 574.07);
CALL new_product('HUAWEI MediaPad M5 lite', 5, 1, '2020', 674.07);
CALL new_product('HUAWEI WATCH GT 3 Pro Titanium', 5, 9, '2020', 674.07);
CALL new_product('HUAWEI Band 6', 5, 9, '2020', 674.07);
CALL new_product('HUAWEI WATCH GT 3 SE 6', 5, 9, '2021', 774.07);
CALL new_product('HUAWEI FreeBuds Pro 2', 5, 20, '2021', 174.07);
CALL new_product('HUAWEI FreeBuds SE', 5, 20, '2021', 184.07);
CALL new_product('Mobira Talkman 450', 6, 8, '1982', 407.81);
CALL new_product('Mobira/Nokia Cityman 1320', 6, 8, '1987', 599.81);
CALL new_product('Vivo X70 Pro', 7, 8, '2022', 518.62);
CALL new_product('Vivo V23e', 7, 8, '2020', 418.62);
CALL new_product('Vivo V21', 7, 8, '2019', 318.62);
CALL new_product('One Plus 8T', 8, 8, '2019', 315.67);
CALL new_product('One Plus 9R', 8, 8, '2020', 435.67);
CALL new_product('One Plus 8T Pro', 8, 8, '2019', 415.67);
CALL new_product('Realme 7i', 9, 8, '2020', 316.26);
CALL new_product('Realme 7 Pro', 9, 8, '2020', 416.26);
CALL new_product('Realme 8', 9, 8, '2021', 354.26);
CALL new_product('Moto C.', 10, 8, '2017', 135.95);
CALL new_product('Moto E.', 10, 8, '2018', 124.95);
CALL new_product('Moto E.', 10, 8, '2019', 89.95);
CALL new_product('Moto G.', 10, 8, '2020', 125.95);
CALL new_product('Moto M.', 10, 8, '2017', 123.95);
CALL new_product('Moto X.', 10, 8, '2019', 135.95);
CALL new_product('Sony Bravia XR', 11, 10, '2019', 2667.42);
CALL new_product('Sony Xperia 1', 11, 9, '2020', 667.42);
CALL new_product('Sony Xperia 1 Pro', 11, 9, '2020', 767.42);
CALL new_product('TH-55LX800V', 12, 10, '2019', 1616.79);
CALL new_product('TH-50LX800V', 12, 10, '2019', 16416.79);
CALL new_product('Acer ChromeBook', 13, 2, '2019', 1011.25);
CALL new_product('Acer Aspire', 13, 2, '2020', 911.25);
CALL new_product('Acer Predator', 13, 2, '2021', 1111.25);
CALL new_product('Acer Travel Mate', 13, 2, '2022', 1251.25);
CALL new_product('V-smart-35', 14, 8, '2020', 229.5);
CALL new_product('Alcatel One Touch iDol', 15, 8, '2019', 259.09);
CALL new_product('Alcatel One Touch IDol Mini', 15, 8, '2019', 159.09);
CALL new_product('Alcatel Soleil', 15, 8, '2020', 159.09);
CALL new_product('MEIZU-37', 16, 8, '2019', 180.5);
CALL new_product('MEIZU-5A', 16, 8, '2018', 182.95);
CALL new_product('Erisson C: Cyber-shot', 18, 8, '2019', 1637.8);
CALL new_product('Erisson D: Deutsche Telekom', 18, 8, '2017', 1844.18);
CALL new_product('Erisson F: Fun Phone', 18, 8, '2018', 1203.18);
CALL new_product('Q-mobile Luna Pro', 19, 8, '2019', 381.45);
CALL new_product('Q-Mobile GLAM', 19, 8, '2018', 281.45);
CALL new_product('Q-Mobile Q EDGY', 19, 8, '2019', 181.45);
CALL new_product('Verizon-47', 20, 7, '2019', 792.37);
CALL new_product('Verizon-EN', 20, 1, '2020', 628.29);

