
-- INSERT DATA --
--
-- brand (100)

CALL product.new_brand('Samsung');
CALL product.new_brand('OPPO');
CALL product.new_brand('Xiaomi');
CALL product.new_brand('Apple');
CALL product.new_brand('Huawei');
CALL product.new_brand('Nokia');
CALL product.new_brand('Vivo');
CALL product.new_brand('OnePlus');
CALL product.new_brand('Realme');
CALL product.new_brand('Motorola');
CALL product.new_brand('Sony');
CALL product.new_brand('Panasonic');
CALL product.new_brand('Acer');
CALL product.new_brand('V-smart');
CALL product.new_brand('Alcatel');
CALL product.new_brand('MEIZU');
CALL product.new_brand('BenQ');
CALL product.new_brand('Erisson');
CALL product.new_brand('QMobile');
CALL product.new_brand('Verizon');

CALL product.new_category('tablets');
CALL product.new_category('laptop');
CALL product.new_category('pc');
CALL product.new_category('headphone');
CALL product.new_category('smart pencil');
CALL product.new_category('smart speakers');
CALL product.new_category('smart moniter');
CALL product.new_category('smart phones');
CALL product.new_category('smart watches');
CALL product.new_category('television');
CALL product.new_category('batteries');
CALL product.new_category('case');
CALL product.new_category('charge');
CALL product.new_category('wire');
CALL product.new_category('socket');
CALL product.new_category('stickers');
CALL product.new_category('bag');
CALL product.new_category('screen');
CALL product.new_category('music speaker');
CALL product.new_category('bluetooth speaker');

-- 300 products
CALL product.new_product('Samsung Galaxy Z-Fold 3', 1, 8, '2019', 714.47);
CALL product.new_product('Samsung Galaxy Note 4', 1, 8, '2020', 847.73);
CALL product.new_product('Samsung Galaxy M33', 1, 8, '2019', 562.0);
CALL product.new_product('Samsung Galaxy A53', 1, 8, '2021', 662.37);
CALL product.new_product('Samsung Galaxy S22 Ultra', 1, 8, '2022', 508.36);
CALL product.new_product('Neo QLED 8k', 1, 10, '2022', 1461.15);
CALL product.new_product('Neo QLED 4k', 1, 10, '2020', 1516.01);
CALL product.new_product('QLED 4k', 1, 10, '2021', 1716.01);
CALL product.new_product('The Frame', 1, 10, '2022', 1816.01);
CALL product.new_product('Ultra Slim', 1, 19, '2020', 216.01);
CALL product.new_product('OPPO Find X5 Pro', 2, 8, '2020', 521.86);
CALL product.new_product('OPPO Find X3 Pro', 2, 8, '2019', 447.98);
CALL product.new_product('OPPO Reno8 Pro', 2, 8, '2021', 547.98);
CALL product.new_product('OPPO A96', 2, 8, '2020', 247.98);
CALL product.new_product('OPPO A95', 2, 8, '2020', 287.98);
CALL product.new_product('OPPO R11', 2, 20, '2019', 89.98);
CALL product.new_product('VOCC OPPO', 2, 14, '2020', 49.98);
CALL product.new_product('CASE CLEAR OPPO', 2, 12, '2019', 49.98);
CALL product.new_product('Xiaomi Mi Max', 3, 8, '2020', 664.87);
CALL product.new_product('Mi Note 10 Pro', 3, 8, '2022', 864.87);
CALL product.new_product('Mi Mix Alpha', 3, 8, '2020', 564.87);
CALL product.new_product('Xiaomi Redmi', 3, 8, '2022', 364.87);
CALL product.new_product('Iphone-11', 4, 8, '2020', 773.68);
CALL product.new_product('Iphone-7', 4, 8, '2019', 316.86);
CALL product.new_product('Iphone-14', 4, 8, '2023', 1194.51);
CALL product.new_product('Iphone-12', 4, 8, '2020', 966.0);
CALL product.new_product('Iphone-10', 4, 8, '2019', 436.8);
CALL product.new_product('Iphone-XS Max', 4, 8, '2019', 497.8);
CALL product.new_product('Macbook Pro M2', 4, 5, '2022', 1836.8);
CALL product.new_product('Macbook Air M2', 4, 2, '2022', 1436.8);
CALL product.new_product('Macbook Pro M1', 4, 5, '2020', 1536.8);
CALL product.new_product('Macbook Air M1', 4, 2, '2020', 1236.8);
CALL product.new_product('Mac Mini', 4, 3, '2020', 1836.8);
CALL product.new_product('Ipad Pro M1', 4, 1, '2020', 936.8);
CALL product.new_product('Ipad Pro M2', 4, 1, '2022', 1098.8);
CALL product.new_product('Ipad Air M1', 4, 1, '2020', 697.8);
CALL product.new_product('Ipad Mini', 4, 1, '2019', 497.8);
CALL product.new_product('Apple Watch Ultra', 4, 9, '2019', 397.8);
CALL product.new_product('Apple Watch Series 8', 4, 9, '2020', 497.8);
CALL product.new_product('Apple Watch SE', 4, 9, '2021', 502.8);
CALL product.new_product('Airpods 2nd Generation', 4, 20, '2020', 102.8);
CALL product.new_product('Airpods 3rd Generation', 4, 20, '2021', 202.8);
CALL product.new_product('Airpods Max', 4, 20, '2022', 232.8);
CALL product.new_product('Apple TV 4K', 4, 10, '2021', 2232.8);
CALL product.new_product('Apple Pencil', 4, 5, '2020', 99.8);
CALL product.new_product('HUAWEI Mate 30 Pro', 5, 8, '2020', 579.0);
CALL product.new_product('HUAWEI Mate 20 Pro', 5, 8, '2021', 479.0);
CALL product.new_product('HUAWEI Mate 20', 5, 1, '2021', 583.9);
CALL product.new_product('HUAWEI MateBook 14', 5, 2, '2022', 1304.07);
CALL product.new_product('HUAWEI MateBook D 16', 5, 2, '2021', 1104.07);
CALL product.new_product('HUAWEI MateBook D 14 AMD', 5, 2, '2021', 974.07);
CALL product.new_product('HUAWEI MatePad', 5, 1, '2022', 874.07);
CALL product.new_product('HUAWEI MatePad 11', 5, 1, '2021', 674.07);
CALL product.new_product('HUAWEI MatePad T 10s', 5, 1, '2020', 574.07);
CALL product.new_product('HUAWEI MediaPad M5 lite', 5, 1, '2020', 674.07);
CALL product.new_product('HUAWEI WATCH GT 3 Pro Titanium', 5, 9, '2020', 674.07);
CALL product.new_product('HUAWEI Band 6', 5, 9, '2020', 674.07);
CALL product.new_product('HUAWEI WATCH GT 3 SE 6', 5, 9, '2021', 774.07);
CALL product.new_product('HUAWEI FreeBuds Pro 2', 5, 20, '2021', 174.07);
CALL product.new_product('HUAWEI FreeBuds SE', 5, 20, '2021', 184.07);
CALL product.new_product('Mobira Talkman 450', 6, 8, '1982', 407.81);
CALL product.new_product('Mobira/Nokia Cityman 1320', 6, 8, '1987', 599.81);
CALL product.new_product('Vivo X70 Pro', 7, 8, '2022', 518.62);
CALL product.new_product('Vivo V23e', 7, 8, '2020', 418.62);
CALL product.new_product('Vivo V21', 7, 8, '2019', 318.62);
CALL product.new_product('One Plus 8T', 8, 8, '2019', 315.67);
CALL product.new_product('One Plus 9R', 8, 8, '2020', 435.67);
CALL product.new_product('One Plus 8T Pro', 8, 8, '2019', 415.67);
CALL product.new_product('Realme 7i', 9, 8, '2020', 316.26);
CALL product.new_product('Realme 7 Pro', 9, 8, '2020', 416.26);
CALL product.new_product('Realme 8', 9, 8, '2021', 354.26);
CALL product.new_product('Moto C.', 10, 8, '2017', 135.95);
CALL product.new_product('Moto E. (2018)', 10, 8, '2018', 124.95);
CALL product.new_product('Moto E. (2019)', 10, 8, '2019', 89.95);
CALL product.new_product('Moto G.', 10, 8, '2020', 125.95);
CALL product.new_product('Moto M.', 10, 8, '2017', 123.95);
CALL product.new_product('Moto X.', 10, 8, '2019', 135.95);
CALL product.new_product('Sony Bravia XR', 11, 10, '2019', 2667.42);
CALL product.new_product('Sony Xperia 1', 11, 9, '2020', 667.42);
CALL product.new_product('Sony Xperia 1 Pro', 11, 9, '2020', 767.42);
CALL product.new_product('TH-55LX800V', 12, 10, '2019', 1616.79);
CALL product.new_product('TH-50LX800V', 12, 10, '2019', 16416.79);
CALL product.new_product('Acer ChromeBook', 13, 2, '2019', 1011.25);
CALL product.new_product('Acer Aspire', 13, 2, '2020', 911.25);
CALL product.new_product('Acer Predator', 13, 2, '2021', 1111.25);
CALL product.new_product('Acer Travel Mate', 13, 2, '2022', 1251.25);
CALL product.new_product('V-smart-35', 14, 8, '2020', 229.5);
CALL product.new_product('Alcatel One Touch iDol', 15, 8, '2019', 259.09);
CALL product.new_product('Alcatel One Touch IDol Mini', 15, 8, '2019', 159.09);
CALL product.new_product('Alcatel Soleil', 15, 8, '2020', 159.09);
CALL product.new_product('MEIZU-37', 16, 8, '2019', 180.5);
CALL product.new_product('MEIZU-5A', 16, 8, '2018', 182.95);
CALL product.new_product('Erisson C: Cyber-shot', 18, 8, '2019', 1637.8);
CALL product.new_product('Erisson D: Deutsche Telekom', 18, 8, '2017', 1844.18);
CALL product.new_product('Erisson F: Fun Phone', 18, 8, '2018', 1203.18);
CALL product.new_product('Q-mobile Luna Pro', 19, 8, '2019', 381.45);
CALL product.new_product('Q-Mobile GLAM', 19, 8, '2018', 281.45);
CALL product.new_product('Q-Mobile Q EDGY', 19, 8, '2019', 181.45);
CALL product.new_product('Verizon-47', 20, 7, '2019', 792.37);
CALL product.new_product('Verizon-EN', 20, 1, '2020', 628.29);
CALL product.new_product('Samsung Galaxy Z-Fold 2', 1, 8, '2018', 714.47);
CALL product.new_product('Samsung Galaxy Note 1', 1, 8, '2021', 847.73);
CALL product.new_product('Samsung Galaxy M3', 1, 8, '2014', 562.0);
CALL product.new_product('Samsung Galaxy A532', 1, 8, '2025', 662.37);
CALL product.new_product('Samsung Galaxy S21 Ultra', 1, 8, '2021', 508.36);
CALL product.new_product('Neo QLED 7k', 1, 10, '2021', 1461.15);
CALL product.new_product('Neo QLED 3k', 1, 10, '2022', 1516.01);
CALL product.new_product('QLED 3k', 1, 10, '2020', 1716.01);
CALL product.new_product('The Frame Plus', 1, 10, '2024', 1816.01);
CALL product.new_product('Ultra Slim V', 1, 19, '2020', 216.01);
CALL product.new_product('OPPO Find X4 Pro', 2, 8, '2020', 521.86);
CALL product.new_product('OPPO Find X9 Pro', 2, 8, '2019', 447.98);
CALL product.new_product('OPPO Reno7 Pro', 2, 8, '2021', 547.98);
CALL product.new_product('OPPO A93', 2, 8, '2020', 247.98);
CALL product.new_product('OPPO A95a', 2, 8, '2020', 287.98);
CALL product.new_product('OPPO R12', 2, 20, '2019', 89.98);
CALL product.new_product('VOCC OPPO 7', 2, 14, '2020', 49.98);
CALL product.new_product('CASE CLEAR OPPO 3', 2, 12, '2019', 49.98);
CALL product.new_product('Xiaomi Mi Max 2', 3, 8, '2020', 664.87);
CALL product.new_product('Mi Note 10 Pro 6', 3, 8, '2022', 864.87);
CALL product.new_product('Mi Mix Alpha 3', 3, 8, '2020', 564.87);
CALL product.new_product('Xiaomi Redmi 6', 3, 8, '2022', 364.87);
CALL product.new_product('Iphone-11a', 4, 8, '2020', 773.68);
CALL product.new_product('Iphone-7b', 4, 8, '2019', 316.86);
CALL product.new_product('Iphone-14a', 4, 8, '2023', 1194.51);
CALL product.new_product('Iphone-12x', 4, 8, '2020', 966.0);
CALL product.new_product('Iphone-10x', 4, 8, '2019', 436.8);
CALL product.new_product('Iphone-XS Max Plus', 4, 8, '2019', 497.8);
CALL product.new_product('Macbook Pro M2a', 4, 5, '2022', 1836.8);
CALL product.new_product('Macbook Air M2b', 4, 2, '2022', 1436.8);
CALL product.new_product('Macbook Pro M1c', 4, 5, '2020', 1536.8);
CALL product.new_product('Macbook Air M1a', 4, 2, '2020', 1236.8);
CALL product.new_product('Mac Mini 2', 4, 3, '2020', 1836.8);
CALL product.new_product('Ipad Pro M1a', 4, 1, '2020', 936.8);
CALL product.new_product('Ipad Pro M2b', 4, 1, '2022', 1098.8);
CALL product.new_product('Ipad Air M1s', 4, 1, '2020', 697.8);
CALL product.new_product('Ipad Minia', 4, 1, '2019', 497.8);
CALL product.new_product('Apple Watch Ultra 3', 4, 9, '2019', 397.8);
CALL product.new_product('Apple Watch Series 7', 4, 9, '2020', 497.8);
CALL product.new_product('Apple Watch SE 2', 4, 9, '2021', 502.8);
CALL product.new_product('Airpods 2nd Generationa', 4, 20, '2020', 102.8);
CALL product.new_product('Airpods 3rd Generationb', 4, 20, '2021', 202.8);
CALL product.new_product('Airpods Max 4', 4, 20, '2022', 232.8);
CALL product.new_product('Apple TV 4K 3', 4, 10, '2021', 2232.8);
CALL product.new_product('Apple Pencil 2', 4, 5, '2020', 99.8);
CALL product.new_product('HUAWEI Mate 30 Pro 2', 5, 8, '2020', 579.0);
CALL product.new_product('HUAWEI Mate 20 Pro 3', 5, 8, '2021', 479.0);
CALL product.new_product('HUAWEI Mate 20a', 5, 1, '2021', 583.9);
CALL product.new_product('HUAWEI MateBook 14v', 5, 2, '2022', 1304.07);
CALL product.new_product('HUAWEI MateBook D 16m', 5, 2, '2021', 1104.07);
CALL product.new_product('HUAWEI MateBook D 14 AMDd', 5, 2, '2021', 974.07);
CALL product.new_product('HUAWEI MatePada', 5, 1, '2022', 874.07);
CALL product.new_product('HUAWEI MatePad 11a', 5, 1, '2021', 674.07);
CALL product.new_product('HUAWEI MatePad T 10sb', 5, 1, '2020', 574.07);
CALL product.new_product('HUAWEI MediaPad M5 litea', 5, 1, '2020', 674.07);
CALL product.new_product('HUAWEI WATCH GT 3 Pro Titaniuma', 5, 9, '2020', 674.07);
CALL product.new_product('HUAWEI Band 6a', 5, 9, '2020', 674.07);
CALL product.new_product('HUAWEI WATCH GT 3 SE 6a', 5, 9, '2021', 774.07);
CALL product.new_product('HUAWEI FreeBuds Pro 2a', 5, 20, '2021', 174.07);
CALL product.new_product('HUAWEI FreeBuds SEa', 5, 20, '2021', 184.07);
CALL product.new_product('Mobira Talkman 450a', 6, 8, '1982', 407.81);
CALL product.new_product('Mobira/Nokia Cityman 1320a', 6, 8, '1987', 599.81);
CALL product.new_product('Vivo X70 Proa', 7, 8, '2022', 518.62);
CALL product.new_product('Vivo V23ea', 7, 8, '2020', 418.62);
CALL product.new_product('Vivo V21g', 7, 8, '2019', 318.62);
CALL product.new_product('One Plus 8T2', 8, 8, '2019', 315.67);
CALL product.new_product('One Plus 9R2', 8, 8, '2020', 435.67);
CALL product.new_product('One Plus 8T Prox', 8, 8, '2019', 415.67);
CALL product.new_product('Realme 7i5', 9, 8, '2020', 316.26);
CALL product.new_product('Realme 7 Pro3', 9, 8, '2020', 416.26);
CALL product.new_product('Realme 82', 9, 8, '2021', 354.26);
CALL product.new_product('Moto C.2', 10, 8, '2017', 135.95);
CALL product.new_product('Moto E. (2018)5', 10, 8, '2018', 124.95);
CALL product.new_product('Moto E. (2019)5', 10, 8, '2019', 89.95);
CALL product.new_product('Moto G.2', 10, 8, '2020', 125.95);
CALL product.new_product('Moto M.5', 10, 8, '2017', 123.95);
CALL product.new_product('Moto X.7', 10, 8, '2019', 135.95);
CALL product.new_product('Sony Bravia XRa', 11, 10, '2019', 2667.42);
CALL product.new_product('Sony Xperia 1b', 11, 9, '2020', 667.42);
CALL product.new_product('Sony Xperia 1 Prox', 11, 9, '2020', 767.42);
CALL product.new_product('TH-55LX800Vv', 12, 10, '2019', 1616.79);
CALL product.new_product('TH-50LX800Vv', 12, 10, '2019', 16416.79);
CALL product.new_product('Acer ChromeBook2', 13, 2, '2019', 1011.25);
CALL product.new_product('Acer Aspire2', 13, 2, '2020', 911.25);
CALL product.new_product('Acer Predator2', 13, 2, '2021', 1111.25);
CALL product.new_product('Acer Travel Mate2', 13, 2, '2022', 1251.25);
CALL product.new_product('V-smart-354', 14, 8, '2020', 229.5);
CALL product.new_product('Alcatel One Touch iDolx', 15, 8, '2019', 259.09);
CALL product.new_product('Alcatel One Touch IDol Minix', 15, 8, '2019', 159.09);
CALL product.new_product('Alcatel Soleila', 15, 8, '2020', 159.09);
CALL product.new_product('MEIZU-37x', 16, 8, '2019', 180.5);
CALL product.new_product('MEIZU-5Ax', 16, 8, '2018', 182.95);
CALL product.new_product('Erisson C: Cyber-shota', 18, 8, '2019', 1637.8);
CALL product.new_product('Erisson D: Deutsche Telekomx', 18, 8, '2017', 1844.18);
CALL product.new_product('Erisson F: Fun Phonex', 18, 8, '2018', 1203.18);
CALL product.new_product('Q-mobile Luna Prox', 19, 8, '2019', 381.45);
CALL product.new_product('Q-Mobile GLAMx', 19, 8, '2018', 281.45);
CALL product.new_product('Q-Mobile Q EDGY3', 19, 8, '2019', 181.45);
CALL product.new_product('Verizon-47x', 20, 7, '2019', 792.37);
CALL product.new_product('Verizon-EN3', 20, 1, '2020', 628.29);
CALL product.new_product('Samsung Galaxy Z-Fold 2a', 1, 8, '2018', 714.47);
CALL product.new_product('Samsung Galaxy Note 1b', 1, 8, '2021', 847.73);
CALL product.new_product('Samsung Galaxy M3g', 1, 8, '2014', 562.0);
CALL product.new_product('Samsung Galaxy A532s', 1, 8, '2025', 662.37);
CALL product.new_product('Samsung Galaxy S21 Ultrad', 1, 8, '2021', 508.36);
CALL product.new_product('Neo QLED 7kd', 1, 10, '2021', 1461.15);
CALL product.new_product('Neo QLED 3kd', 1, 10, '2022', 1516.01);
CALL product.new_product('QLED 3kh', 1, 10, '2020', 1716.01);
CALL product.new_product('The Frame Plusr', 1, 10, '2024', 1816.01);
CALL product.new_product('Ultra Slim Vf', 1, 19, '2020', 216.01);
CALL product.new_product('OPPO Find X4 Proh', 2, 8, '2020', 521.86);
CALL product.new_product('OPPO Find X9 Proe', 2, 8, '2019', 447.98);
CALL product.new_product('OPPO Reno7 Prof', 2, 8, '2021', 547.98);
CALL product.new_product('OPPO A93d', 2, 8, '2020', 247.98);
CALL product.new_product('OPPO A95ah', 2, 8, '2020', 287.98);
CALL product.new_product('OPPO R12r', 2, 20, '2019', 89.98);
CALL product.new_product('VOCC OPPO 7c', 2, 14, '2020', 49.98);
CALL product.new_product('CASE CLEAR OPPO 3e', 2, 12, '2019', 49.98);
CALL product.new_product('Xiaomi Mi Max 2f', 3, 8, '2020', 664.87);
CALL product.new_product('Mi Note 10 Pro 6d', 3, 8, '2022', 864.87);
CALL product.new_product('Mi Mix Alpha 3v', 3, 8, '2020', 564.87);
CALL product.new_product('Xiaomi Redmi 6f', 3, 8, '2022', 364.87);
CALL product.new_product('Iphone-11af', 4, 8, '2020', 773.68);
CALL product.new_product('Iphone-7bh', 4, 8, '2019', 316.86);
CALL product.new_product('Iphone-14af', 4, 8, '2023', 1194.51);
CALL product.new_product('Iphone-12xd', 4, 8, '2020', 966.0);
CALL product.new_product('Iphone-10xd', 4, 8, '2019', 436.8);
CALL product.new_product('Iphone-XS Max Plusw', 4, 8, '2019', 497.8);
CALL product.new_product('Macbook Pro M2ad', 4, 5, '2022', 1836.8);
CALL product.new_product('Macbook Air M2bd', 4, 2, '2022', 1436.8);
CALL product.new_product('Macbook Pro M1cd', 4, 5, '2020', 1536.8);
CALL product.new_product('Macbook Air M1af', 4, 2, '2020', 1236.8);
CALL product.new_product('Mac Mini 2g', 4, 3, '2020', 1836.8);
CALL product.new_product('Ipad Pro M1af', 4, 1, '2020', 936.8);
CALL product.new_product('Ipad Pro M2bd', 4, 1, '2022', 1098.8);
CALL product.new_product('Ipad Air M1sf', 4, 1, '2020', 697.8);
CALL product.new_product('Ipad Minias', 4, 1, '2019', 497.8);
CALL product.new_product('Apple Watch Ultra 3d', 4, 9, '2019', 397.8);
CALL product.new_product('Apple Watch Series 7d', 4, 9, '2020', 497.8);
CALL product.new_product('Apple Watch SE 2f', 4, 9, '2021', 502.8);
CALL product.new_product('Airpods 2nd Generationaf', 4, 20, '2020', 102.8);
CALL product.new_product('Airpods 3rd Generationbf', 4, 20, '2021', 202.8);
CALL product.new_product('Airpods Max 4h', 4, 20, '2022', 232.8);
CALL product.new_product('Apple TV 4K 3f', 4, 10, '2021', 2232.8);
CALL product.new_product('Apple Pencil 2f', 4, 5, '2020', 99.8);
CALL product.new_product('HUAWEI Mate 30 Pro 2f', 5, 8, '2020', 579.0);
CALL product.new_product('HUAWEI Mate 20 Pro 3f', 5, 8, '2021', 479.0);
CALL product.new_product('HUAWEI Mate 20ad', 5, 1, '2021', 583.9);
CALL product.new_product('HUAWEI MateBook 14vf', 5, 2, '2022', 1304.07);
CALL product.new_product('HUAWEI MateBook D 16mf', 5, 2, '2021', 1104.07);
CALL product.new_product('HUAWEI MateBook D 14 AMDdf', 5, 2, '2021', 974.07);
CALL product.new_product('HUAWEI MatePadah', 5, 1, '2022', 874.07);
CALL product.new_product('HUAWEI MatePad 11af', 5, 1, '2021', 674.07);
CALL product.new_product('HUAWEI MatePad T 10sbn', 5, 1, '2020', 574.07);
CALL product.new_product('HUAWEI MediaPad M5 liteas', 5, 1, '2020', 674.07);
CALL product.new_product('HUAWEI WATCH GT 3 Pro Titaniumad', 5, 9, '2020', 674.07);
CALL product.new_product('HUAWEI Band 6aa', 5, 9, '2020', 674.07);
CALL product.new_product('HUAWEI WATCH GT 3 SE 6aa', 5, 9, '2021', 774.07);
CALL product.new_product('HUAWEI FreeBuds Pro 2ag', 5, 20, '2021', 174.07);
CALL product.new_product('HUAWEI FreeBuds SEaf', 5, 20, '2021', 184.07);
CALL product.new_product('Mobira Talkman 450ad', 6, 8, '1982', 407.81);
CALL product.new_product('Mobira/Nokia Cityman 1320af', 6, 8, '1987', 599.81);
CALL product.new_product('Vivo X70 Proag', 7, 8, '2022', 518.62);
CALL product.new_product('Vivo V23eag', 7, 8, '2020', 418.62);
CALL product.new_product('Vivo V21gg', 7, 8, '2019', 318.62);
CALL product.new_product('One Plus 8T2f', 8, 8, '2019', 315.67);
CALL product.new_product('One Plus 9R2d', 8, 8, '2020', 435.67);
CALL product.new_product('One Plus 8T Proxf', 8, 8, '2019', 415.67);
CALL product.new_product('Realme 7i5g', 9, 8, '2020', 316.26);
CALL product.new_product('Realme 7 Pro3f', 9, 8, '2020', 416.26);
CALL product.new_product('Realme 82g', 9, 8, '2021', 354.26);
CALL product.new_product('Moto C.2f', 10, 8, '2017', 135.95);
CALL product.new_product('Moto E. (2018)5g', 10, 8, '2018', 124.95);
CALL product.new_product('Moto E. (2019)5g', 10, 8, '2019', 89.95);
CALL product.new_product('Moto G.2g', 10, 8, '2020', 125.95);
CALL product.new_product('Moto M.5g', 10, 8, '2017', 123.95);
CALL product.new_product('Moto X.7h', 10, 8, '2019', 135.95);
CALL product.new_product('Sony Bravia XRad', 11, 10, '2019', 2667.42);
CALL product.new_product('Sony Xperia 1bf', 11, 9, '2020', 667.42);
CALL product.new_product('Sony Xperia 1 Proxd', 11, 9, '2020', 767.42);
CALL product.new_product('TH-55LX800Vvr', 12, 10, '2019', 1616.79);
CALL product.new_product('TH-50LX800Vvd', 12, 10, '2019', 16416.79);
CALL product.new_product('Acer ChromeBook2h', 13, 2, '2019', 1011.25);
CALL product.new_product('Acer Aspire2c', 13, 2, '2020', 911.25);
CALL product.new_product('Acer Predator2h', 13, 2, '2021', 1111.25);
CALL product.new_product('Acer Travel Mate2f', 13, 2, '2022', 1251.25);
CALL product.new_product('V-smart-354g', 14, 8, '2020', 229.5);
CALL product.new_product('Alcatel One Touch iDolxv', 15, 8, '2019', 259.09);
CALL product.new_product('Alcatel One Touch IDol Minixv', 15, 8, '2019', 159.09);
CALL product.new_product('Alcatel Soleilag', 15, 8, '2020', 159.09);
CALL product.new_product('MEIZU-37xr', 16, 8, '2019', 180.5);
CALL product.new_product('MEIZU-5Axg', 16, 8, '2018', 182.95);
CALL product.new_product('Erisson C: Cyber-shotag', 18, 8, '2019', 1637.8);
CALL product.new_product('Erisson D: Deutsche Telekomxg', 18, 8, '2017', 1844.18);
CALL product.new_product('Erisson F: Fun Phonexf', 18, 8, '2018', 1203.18);
CALL product.new_product('Q-mobile Luna Proxd', 19, 8, '2019', 381.45);
CALL product.new_product('Q-Mobile GLAMxe', 19, 8, '2018', 281.45);
CALL product.new_product('Q-Mobile Q EDGY3f', 19, 8, '2019', 181.45);
CALL product.new_product('Verizon-47xg', 20, 7, '2019', 792.37);
CALL product.new_product('Verizon-EN3g', 20, 1, '2020', 628.29);

--delete from product.products;


-- select * from product.products;
-- select * from product.brands;
-- select * from product.categories;


--Function to random colour
Create or replace function random_colour() returns varchar as
$$
declare
	white varchar := 'white';
	black varchar:='black';
	grey varchar:= 'grey';
	rand int ;
	 result varchar := '';
begin
	rand= trunc(random()*3+1);
	CASE
    	WHEN rand=1 THEN result= white ;        
        WHEN rand=2 THEN result= black;   
        WHEN rand=3 THEN result= grey;
     END CASE;
	 return result;
end;
$$ language plpgsql;

--Function to random extra charge
-- floor(random()* (high-low + 1) + low);
Create or replace function random_extra() returns decimal(10,2) as
$$
begin
	return random()* (50-1 + 1) + 1;
end;
$$ language plpgsql;

CREATE OR REPLACE PROCEDURE product.generate_new_config()
LANGUAGE plpgsql
AS $$
BEGIN
	FOR cnt IN 1..50 LOOP
		CALL product.new_config(random_colour(),POWER(2,trunc(random()*8))||' '||'GB',POWER(2,trunc(random()*8))||' '||'GB',random_extra());
	END LOOP;
	FOR cnt IN 51..100 LOOP
		CALL product.new_config(random_colour(),NULL,NULL, random_extra());
	END LOOP;
END;
$$;

-- generate 500 configs
CALL product.generate_new_config();
CALL product.generate_new_config();
CALL product.generate_new_config();
CALL product.generate_new_config();
CALL product.generate_new_config();

-- select * from product.config;

-- SELECT * FROM product.items i
-- JOIN product.config c on i.config_id=c.config_id
-- WHERE i.product_id =4;

-- item

--Function to random serial code
Create or replace function random_string(length integer) returns varchar as
$$
declare
  chars text[] := '{0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z}';
  result varchar := '';
  i integer := 0;
begin
  if length < 0 then
    raise exception 'Given length cannot be less than 0';
  end if;
  for i in 1..length loop
    result := result || chars[1+random()*(array_length(chars, 1)-1)];
  end loop;
  return result;
end;
$$ language plpgsql;



--function to random date
Create or replace function random_date() returns date as
$$
begin
	 return timestamp '2014-01-10 20:00:00' +
       random() * (NOW() -
                   timestamp '2014-01-10 10:00:00');
end;
$$ language plpgsql;


DROP FUNCTION IF EXISTS return_id_category(bigint);
CREATE OR REPLACE FUNCTION return_id_category(product_ids BIGINT) RETURNS BIGINT
LANGUAGE plpgsql
AS $$
DECLARE category_ids BIGINT;
BEGIN
	SELECT p.category_id INTO category_ids
	FROM product.products p
	WHERE p.product_id = product_ids;
	RETURN category_ids;
END;
$$;

--function to random data
-- 5000 items are generated each time
DROP PROCEDURE IF EXISTS product.generate_new_item;
CREATE OR REPLACE PROCEDURE product.generate_new_item(from_intput int, to_input int)
LANGUAGE plpgsql
AS $$
DECLARE category_ids BIGINT;
	from_input int:=$1;
	to_input int:=$2;
BEGIN
	FOR product_id_input IN from_input..to_input LOOP
		SELECT * FROM return_id_category(product_id_input) INTO category_ids;
		IF (category_ids IN (1,2,3,8))
		THEN 
			FOR config_id_input IN 1..50 LOOP
			BEGIN 
				CALL product.new_item(random_string(8),product_id_input,random_date(),config_id_input);
			END;
			END LOOP;
		ELSE 
			FOR config_id_input IN 51..100 LOOP
				BEGIN
					CALL product.new_item(random_string(8),product_id_input,random_date(),config_id_input);
				END;
			END LOOP;
		END IF;
	END LOOP;
END;
$$;

-- generate 5000*9 items each times
CALL product.generate_new_item(1,100);
CALL product.generate_new_item(1,100);
CALL product.generate_new_item(1,100);
CALL product.generate_new_item(101,200);
CALL product.generate_new_item(101,200);
CALL product.generate_new_item(101,200);
CALL product.generate_new_item(201,300);
CALL product.generate_new_item(201,300);
CALL product.generate_new_item(201,300);

-- SELECT * FROM product.items;

CREATE OR REPLACE FUNCTION random_between(low INT ,high INT) 
RETURNS INT AS
$$
BEGIN
RETURN floor(random()* (high-low + 1) + low);
END;
$$ language 'plpgsql' STRICT;

-- add to cart (5000 items, 1000 customer moi nguoi 5 san pham trong cart)
CREATE OR REPLACE PROCEDURE sales.generate_add_cart()
LANGUAGE plpgsql
AS $$
DECLARE 
	serial_code_ids VARCHAR(255);
	num_stock BIGINT;
BEGIN
	SELECT quantity INTO num_stock FROM product.products LIMIT 1 OFFSET 1;

	FOR customer_id_input IN 1..1000 LOOP
		FOR num IN 0..4 LOOP
			BEGIN 
				SELECT serial_code INTO serial_code_ids FROM product.items LIMIT 1 OFFSET (customer_id_input+num*num_stock);
				CALL sales.add_to_cart(customer_id_input, serial_code_ids);
			END;
		END LOOP;
	END LOOP;
END;
$$;


-- make order (1000 orders ~ 3000 items)
CREATE OR REPLACE PROCEDURE sales.generate_make_order()
LANGUAGE plpgsql
AS $$
DECLARE 
	staff_id_input BIGINT;
	num BIGINT;
BEGIN	
	FOR customer_id_input IN 1..500 LOOP
		SELECT random_between(1,25) INTO num;
		BEGIN 
			SELECT staff_id INTO staff_id_input FROM sales.staffs WHERE active = TRUE LIMIT 1 OFFSET num;
			CALL sales.make_order_offline(customer_id_input, staff_id_input);
		END;
	END LOOP;

	FOR customer_id_input IN 501..1000 LOOP
		CALL sales.make_order_online(customer_id_input);
	END LOOP;
END;
$$;


-- CALL sales.generate_add_cart();
-- CALL sales.generate_make_order();