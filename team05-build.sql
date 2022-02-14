/*Drop Tables*/

DROP TABLE IF EXISTS store CASCADE;
DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS menu CASCADE;
DROP TABLE IF EXISTS third_party CASCADE;
DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS vehicle CASCADE;
DROP TABLE IF EXISTS gps CASCADE;
DROP TABLE IF EXISTS coupon CASCADE;

/*Create Tables*/

CREATE TABLE store (
id INT auto_increment,
slocation VARCHAR(40),
PRIMARY KEY (id)
) ENGINE = innodb;

CREATE TABLE employee (
id INT auto_increment,
store_id INT NOT NULL,
ssn INT,
fname VARCHAR(30),
lname VARCHAR(30),
phone INT,
address VARCHAR(50),
licnum VARCHAR(20),
job VARCHAR(20),
PRIMARY KEY (id),
FOREIGN KEY (store_id) REFERENCES store(id)
) ENGINE = innodb;

CREATE TABLE orders (
id1 INT,
menu_id INT,
driver_id INT,
third_id INT,
cust_id INT,
d DATE,
qty INT,
FOREIGN KEY (id1) REFERENCES orders_d(id),
FOREIGN KEY (menu_id) REFERENCES menu(id),
FOREIGN KEY (driver_id) REFERENCES employee(id),
FOREIGN KEY (third_id) REFERENCES third_party(id),
FOREIGN KEY (cust_id) REFERENCES customer(id)
) ENGINE = innodb;

CREATE TABLE orders_d(
id INT,
PRIMARY KEY (id)
) ENGINE = innodb;

CREATE TABLE menu (
id INT,
name VARCHAR(30),
price FLOAT(3,2),
PRIMARY KEY (id)
) ENGINE = innodb;

CREATE TABLE third_party (
id INT auto_increment,
comp_name VARCHAR(30),
fname VARCHAR(30),
lname VARCHAR(30),
phone INT,
PRIMARY KEY (id)
) ENGINE = innodb;

CREATE TABLE customer (
id INT auto_increment,
fname VARCHAR(30),
address VARCHAR(50),
phone INT,
email VARCHAR(30),
PRIMARY KEY (id)
) ENGINE = innodb;

CREATE TABLE vehicle (
driver_id INT NOT NULL,
vin VARCHAR(17),
make VARCHAR(30),
model VARCHAR(30),
year INT,
FOREIGN KEY (driver_id) REFERENCES employee(id) 
) ENGINE = innodb;

CREATE TABLE gps (
order_id INT NOT NULL,
time_left DATETIME,
time_delivered DATETIME,
FOREIGN KEY (order_id) REFERENCES orders_d(id)
) ENGINE = innodb;


CREATE TABLE coupon (
coup_num INT,
value FLOAT(3,2),
exp_date DATE,
PRIMARY KEY (coup_num)
) ENGINE = innodb;

/*Inserting Data*/

INSERT INTO store (id, slocation) VALUES
(10, 'North Side'),
(20, 'South Side'),
(30, 'West Side')
;


INSERT INTO employee (id, ssn, fname, lname, phone, address, licnum, job, store_id) VALUES
(1,894367665,'Janeta','Heinecke',1541059717,'88116 Spenser Place','MVO1AFM','Manager',10),
(2,587395207,'Amalle','Parkes',6413608225,'176 Corry Court','TKS3BLB','Manager',20),
(3,653534828,'Dominica', 'Liddy',8028477736,'3302 Elgar Pass','7RAS5ZV','Manager',30),
(4,559526881,'Gifford','Byer',1199476228,'22206 Randy Place','ZH2E0WT','Driver',10),
(5,812602006,'Maggy','Egle',9169162662,'24 North Street','7I56VR4','Driver',10),
(6,336368947,'Roderic','Broadberrie',2758887085,'4 Heffernan Road','OVB6L56','Driver',10),
(7,748057954,'Jemimah','Stennard',7991468196,'7436 Namekagon Place','0VWML3G','Driver',20),
(8,723670268,'Reginald','Hadkins',4842736047,'4431 Iowa Plaza','MU5UMKF','Driver',20),
(9,615378379,'Erica','Grinham',3483414447,'7 Morningstar Hill','TOXB374','Driver',20),
(10,604629723,'Travus','Tiplady',8943235280,'2 Ramsey Alley','2V37GQI','Driver',20),
(11,870344099,'Myrle','Pulteneye',1843662523,'5021 Sherman Parkway','CLAWOB1','Driver',30),
(12,647907215,'Loleta','Bulward',2627894156,'4 Farmco Way','S9ADVNU','Driver',30),
(13,282201694,'Carina','Pile',2132313071,'6 Kennedy Lane','2L4G10J','Cook',10),
(14,157263525,'Andee','Ghost',8385965663,'7363 Carpenter Street','RADE4VS','Cook',10),
(15,790550723,'Troy','Walley',6741916386,'56 Del Sol Center','A41HI7O','Cook',10),
(16,167932960,'Bridie','Legges',2519530205,'9 Paget Place','YL29CB1','Cook',20),
(17,163350132,'Mahala','Sibbit',4295153913,'34 Karstens Street','25C332H','Cook',20),
(18,129228503,'Clarisse','Rawlinson',4544777154,'1 Kenwood Trail','QR7ZGL8','Cook',20),
(19,607689099,'Chelsy','Spickett',9649019039,'33 Daystar Circle','8X4NP7L','Cook',30),
(20,461851203,'Jenna','Ebbage',7899322565,'91126 Kipling Center','K4AGEZM','Cook',30)
;

INSERT INTO orders (id1, menu_id,qty, d, driver_id, third_id) VALUES
(5, 11, 7, '2020-10-18', 11, NULL),
(9, 17, 6, '2020-07-04', 9, NULL),
(12, 16, 5, '2021-05-18', 9, NULL),
(11, 10, 2, '2020-07-19', 9, NULL),
(5, 4, 8, '2020-07-04', 6, NULL),
(9, 7, 1, '2021-01-31', 5, NULL),
(4, 12, 3, '2020-08-14', 12, NULL),
(4, 2, 8, '2021-05-22', 12, NULL),
(3, 3, 6, '2021-03-15', 4, NULL),
(9, 12, 5, '2021-06-04', 10, NULL),
(10, 1, 3, '2020-11-05', 11, NULL),
(2, 5, 5, '2021-04-08', 12, NULL),
(11, 14, 7, '2020-08-05', 8, NULL),
(6, 5, 7, '2021-04-27', NULL, 3),
(9, 9, 7, '2021-01-05', 9, NULL),
(1, 8, 8, '2021-06-02', 4, NULL),
(9, 2, 8, '2021-01-09', 6, NULL),
(10, 15, 7, '2020-07-01', 12, NULL),
(5, 2, 2, '2021-03-28', 10, NULL),
(8, 16, 6, '2021-01-09', 7, NULL),
(8, 16, 8, '2021-01-27', 10, NULL),
(4, 9, 6, '2020-11-21', 11, NULL),
(8, 16, 4, '2021-01-27', 11, NULL),
(5, 7, 8, '2021-05-05', 12, NULL),
(2, 10, 6, '2021-06-01', 5, NULL),
(10, 8, 8, '2021-06-19', 9, NULL),
(2, 7, 2, '2021-01-25', 4, NULL),
(4, 17, 2, '2021-02-27', 10, NULL),
(2, 1, 7, '2020-08-18', 11, NULL),
(11, 3, 2, '2021-04-17', 6, NULL),
(4, 17, 3, '2021-05-25', 7, NULL),
(1, 14, 2, '2020-07-30', 7, NULL),
(4, 11, 5, '2021-01-02', 5, NULL),
(8, 12, 5, '2020-08-08', NULL, 8),
(8, 6, 6, '2021-05-14', 10, NULL),
(9, 8, 8, '2020-07-09', 8, NULL),
(8, 2, 3, '2020-06-14', 6, NULL),
(1, 4, 5, '2021-06-19', 5, NULL),
(11, 6, 5, '2020-11-04', 7, NULL),
(5, 14, 2, '2020-11-07', 4, NULL),
(6, 13, 1, '2020-06-28', 4, NULL),
(7, 13, 2, '2021-02-10', 11, NULL),
(6, 4, 3, '2020-12-01', 5, NULL),
(7, 11, 7, '2021-01-24', 8, NULL),
(6, 3, 6, '2021-04-01', 11, NULL),
(8, 8, 1, '2020-07-25', 7, NULL),
(11, 12, 6, '2021-02-28', 10, NULL),
(2, 10, 3, '2021-03-27', 10, NULL),
(3, 13, 8, '2021-03-30', 10, NULL),
(7, 16, 5, '2020-07-05', 5, NULL),
(10, 17, 3, '2021-04-04', 9, NULL),
(3, 17, 6, '2020-10-14', 7, NULL),
(4, 6, 2, '2020-10-10', 9, NULL),
(4, 11, 3, '2020-12-29', 8, NULL),
(5, 8, 4, '2021-06-01', 10, NULL),
(10, 7, 8, '2020-07-05', 5, NULL),
(8, 1, 4, '2020-10-30', 4, NULL),
(3, 3, 3, '2021-03-27', 7, NULL),
(4, 7, 8, '2021-03-07', 6, NULL),
(2, 14, 8, '2021-02-17', 12, NULL),
(3, 10, 6, '2020-09-25', 12, NULL),
(12, 14, 3, '2021-04-29', 5, NULL),
(11, 17, 5, '2020-11-20', 9, NULL),
(5, 11, 6, '2020-10-17', 12, NULL),
(9, 11, 7, '2020-08-14', 5, NULL),
(5, 14, 6, '2021-01-28', 4, NULL),
(10, 16, 2, '2020-06-15', 8, NULL),
(3, 1, 4, '2020-12-25', 12, NULL),
(1, 12, 1, '2020-07-02', 12, NULL),
(7, 16, 5, '2020-06-13', 7, NULL),
(11, 2, 3, '2020-07-09', 12, NULL),
(5, 2, 5, '2021-06-16', 10, NULL),
(11, 16, 1, '2020-06-26', 6, NULL),
(7, 2, 5, '2020-07-10', 9, NULL),
(4, 13, 7, '2020-12-16', 12, NULL),
(12, 14, 7, '2021-04-06', 5, NULL),
(9, 3, 4, '2020-09-18', 4, NULL),
(5, 6, 8, '2021-01-30', 8, NULL),
(4, 10, 2, '2020-10-17', 6, NULL),
(7, 11, 2, '2021-05-25', 9, NULL),
(8, 9, 4, '2020-10-17', 5, NULL),
(5, 1, 3, '2020-11-27', 11, NULL),
(5, 10, 3, '2021-02-22', 8, NULL),
(12, 13, 4, '2021-03-15', 4, NULL),
(12, 6, 6, '2020-10-09', 6, NULL),
(10, 14, 3, '2020-07-13', 4, NULL),
(9, 10, 7, '2020-11-23', 8, NULL),
(11, 14, 4, '2021-02-12', 4, NULL),
(5, 3, 5, '2020-12-30', 10, NULL),
(12, 5, 6, '2021-01-30', 12, NULL),
(10, 4, 4, '2021-05-28', 6, NULL),
(7, 4, 7, '2021-04-04', 8, NULL),
(4, 4, 4, '2021-05-22', 4, NULL),
(11, 16, 1, '2020-10-29', 8, NULL),
(4, 15, 6, '2020-09-07', 6, NULL),
(1, 6, 4, '2020-10-09', 11, NULL),
(1, 5, 7, '2021-06-09', 9, NULL),
(6, 7, 5, '2020-11-17', 5, NULL),
(5, 15, 1, '2021-02-10', 4, NULL),
(12, 12, 8, '2020-11-28', 10, NULL)
;



INSERT INTO orders_d VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12)
;




INSERT INTO menu (id, name, price) VALUES
(1, 'Cheese Pizza', 21.62),
(2, 'Pepperoni Pizza', 26.34),
(3, 'Small Pizza', 16.41),
(4, 'Mozzarella Sticks', 5.28),
(5, 'Bread Sticks', 7.30),
(6, 'Large Custom Pizza', 27.23),
(7, 'Calzone', 19.43),
(8, 'Large Green Pepper Pizza', 21.56),
(9, 'Extra Dipping sauce', 3.23),
(10, 'Salad', 13.79),
(11, 'Medium Extra Sauce Pizza', 17.35),
(12, 'Sausage Pizza', 23.07),
(13, 'Pretzel', 5.14),
(14, 'Thick Breadsticks', 7.54),
(15, 'Pizza Light Sauce', 20.96),
(16, 'Cinnamon Rolls', 13.12),
(17, 'Munchies Madness', 17.51)
;


INSERT INTO third_party (id, comp_name, fname, lname, phone) VALUES
(1, 'Uber Eats', 'Robinetta', 'Dunbavin', 5294535613),
(2, 'Doordash', 'Gayleen', 'Matevushev', 4999605479),
(3, 'Uber Eats', 'Hilda', 'Tallach', 9366735830),
(4, 'Uber Eats', 'Lauritz', 'Gillbanks', 1824219534),
(5, 'Grubhub', 'Dionis', 'Nott', 5698193649),
(6, 'Grubhub', 'Earlie', 'Wheatley', 4694397433),
(7, 'Uber Eats', 'Donalt', 'Watkiss', 9765926185),
(8, 'Doordash', 'Alasteir', 'Capnor', 4602240688),
(9, 'Uber Eats', 'Ax', 'Braden', 5919821349),
(10, 'Grubhub', 'Kamillah', 'Richin', 8093220405),
(11, 'Grubhub', 'Orsa', 'Torald', 6885872518),
(12, 'Doordash', 'Jerad', 'Thrasher', 5154439153),
(13, 'Doordash', 'Reggie', 'Weinmann', 5177447522),
(14, 'Uber Eats', 'Natka', 'Shankle', 5266590064),
(15, 'Grubhub', 'Selby', 'Beachamp', 6841438469)
;

INSERT INTO customer (id, fname, address, phone, email) VALUES
(1, 'Meagan', '292 Bunker Hill Crossing', '6144063835', 'mdow0@ebay.co.uk'),
(2, 'Kessia', '7923 Columbus Street', '4659125357', 'kpaoloni1@cnet.com'),
(3, 'Pernell', '3 Fremont Terrace', '7842180302', 'pwong2@dailymotion.com'),
(4, 'Emeline', '3 Waxwing Plaza', '1258775850', 'eronaldson3@istockphoto.com'),
(5, 'George', '181 Drewry Road', '7326200402', 'gchildes4@posterous.com'),
(6, 'Zackariah', '9131 Namekagon Plaza', '2412525992', 'zburdin5@paginegialle.it'),
(7, 'Almire', '68107 Graceland Avenue', '7495837452', 'abarz6@dagondesign.com'),
(8, 'Eachelle', '507 Sycamore Plaza', '8634327963', 'epena7@sina.com.cn'),
(9, 'Cecilius', '0168 Upham Point', '6156088999', 'cdehm8@wikipedia.org'),
(10, 'Timothy', '13395 Dryden Plaza', '3155231457', 'tskade9@comsenz.com'),
(11, 'Cob', '41 Thompson Point', '6481127955', 'ceasterfielda@qq.com'),
(12, 'Milty', '4624 Eagle Crest Circle', '7887660453', 'mduboisb@si.edu'),
(13, 'Sofie', '2 Pearson Lane', '8398973630', 'slelievrec@engadget.com'),
(14, 'Karrah', '8681 Cordelia Lane', '6852436341', 'kossipenkod@vistaprint.com'),
(15, 'Fletcher', '06757 Badeau Alley', '6923559304', 'fhughille@va.gov'),
(16, 'Jyoti', '06167 Declaration Hill', '4026998044', 'jhalletf@pcworld.com'),
(17, 'Janella', '427 Spaight Court', '4416098109', 'jlyveng@wikispaces.com'),
(18, 'Kizzee', '75 South Avenue', '6157693948', 'kyeleh@guardian.co.uk'),
(19, 'Jackelyn', '8 Judy Terrace', '6246830873', 'jmenendezi@facebook.com'),
(20, 'Celestine', '02413 Fulton Junction', '2536824264', 'cwhitlawj@ameblo.jp'),
(21, 'Janean', '3 Shoshone Center', '3318552303', 'jdaveleyk@salon.com'),
(22, 'Camella', '1 Lakeland Point', '2339150780', 'crosl@forbes.com'),
(23, 'Cullen', '88257 Monument Alley', '4904251420', 'cduffilm@ning.com'),
(24, 'Rochella', '283 Heffernan Street', '6011201122', 'rtumultyn@boston.com'),
(25, 'Delmer', '87177 Basil Circle', '1576884405', 'dmarhamo@dedecms.com'),
(26, 'Harrison', '94 Merry Trail', '3684009457', 'hwilemanp@chicagotribune.com'),
(27, 'Jorey', '17934 Bunting Drive', '9916668471', 'jdelacourtq@wisc.edu'),
(28, 'Gussi', '71 David Pass', '9267655115', 'ghowattr@blogs.com'),
(29, 'Taryn', '54093 Milwaukee Lane', '7315862392', 'tjelkss@taobao.com'),
(30, 'Bertie', '744 Oneill Point', '3794744911', 'blathwellt@ovh.net'),
(31, 'Mariana', '4 Toban Way', '3716478825', 'mlacosteu@cam.ac.uk'),
(32, 'Cindi', '337 Macpherson Point', '7356783264', 'celgramv@yandex.ru'),
(33, 'Angelle', '008 Cottonwood Road', '2469093560', 'acalleyw@apache.org'),
(34, 'Cordie', '109 Sutteridge Circle', '9369374640', 'chardinx@jigsy.com'),
(35, 'Kimball', '57 Stuart Drive', '3136189272', 'kiacovielliy@whitehouse.gov'),
(36, 'Calida', '3 Rieder Plaza', '2332077703', 'caldersonz@telegraph.co.uk'),
(37, 'Lissa', '29668 Brickson Park Hill', '9413856033', 'lbalhatchet10@ow.ly'),
(38, 'Alastair', '841 Erie Alley', '1705101659', 'adeguerre11@sakura.ne.jp'),
(39, 'Kathe', '9556 Grayhawk Place', '9604425333', 'kpucker12@nationalgeographic.com'),
(40, 'Pansy', '9118 Cascade Junction', '7083588946', 'phammill13@elegantthemes.com')
;

INSERT INTO vehicle (driver_id, vin, make, model, year)   VALUES
(1, 'TRUWX28N721879193', 'Ford', 'Mustang', 1964),
(2, '3D7TP2CT6BG099194', 'Acura', 'CL', 2002),
(3, 'WBADX1C53BE021762', 'Mercedes-Benz', 'SL-Class', 2002),
(4, '3N1AB7AP8FY666107', 'Pontiac', 'Torrent', 2008),
(5, 'SCFAD02E19G795339', 'Buick', 'LaCrosse', 2012),
(6, '1N4AB7AP8DN004928', 'Lexus', 'IS-F', 2010),
(7, '1G6AE5SX8D0553338', 'Mitsubishi', 'Mighty Max Macro', 1993),
(8, 'WBSBR93451E158249', 'GMC', '1500 Club Coupe', 1992),
(9, '1G4GD5GR9CF049277', 'Mitsubishi', 'Montero', 1992),
(10, 'VNKJTUD33FA790217', 'Plymouth', 'Acclaim', 1992),
(11, 'WBAYB6C50DD974533', 'Ford', 'E-Series', 2005),
(12, '4T3BA3BB1EU312269', 'Audi', 'A6', 1998)
;

INSERT INTO gps (order_id, time_left, time_delivered)  VALUES
(1, '2021-02-21 02:20:40', '2021-02-21 21:45:39'),
(2, '2020-11-05 07:42:59', '2020-11-05 07:58:50'),
(3, '2021-07-12 22:16:14', '2021-07-12 23:10:42'),
(4, '2021-01-01 01:31:10', '2021-01-01 01:43:44'),
(5, '2021-03-17 05:40:55', '2021-03-17 05:59:35'),
(6, '2021-01-10 13:32:37', '2021-01-10 14:15:13'),
(7, '2021-05-25 06:24:55', '2021-05-25 06:48:54'),
(8, '2021-06-19 05:15:47', '2021-06-19 05:51:14'),
(9, '2020-09-06 13:06:05', '2020-09-06 14:03:29'),
(10, '2021-05-04 20:09:11', '2021-05-04 20:38:08'),
(11, '2020-12-23 21:18:01', '2020-12-23 21:47:40'),
(12, '2021-04-06 13:12:00', '2021-04-06 13:33:54')
;


INSERT INTO coupon (coup_num,value, exp_date) VALUES
(67669, 11.53, '2027-08-28'),
(87260, 34.02, '2027-11-28'),
(10180, 33.38, '2025-11-23'),
(67325, 48.58, '2028-12-06'),
(40304, 9.73, '2023-12-20'),
(9193, 29.73, '2027-05-22'),
(97766, 93.13, '2028-10-20'),
(76722, 43.43, '2028-10-04'),
(36682, 25.52, '2024-02-09'),
(9957, 58.04, '2029-01-03'),
(71728, 41.93, '2027-05-06')
;

INSERT INTO orders (id1, menu_id,qty, d, driver_id, third_id, cust_id) VALUES
(5, 11, 7, '2020-10-18', 11, NULL,5),
(9, 17, 6, '2020-07-04', 9, NULL,9),
(12, 16, 5, '2021-05-18', 9, NULL,12),
(11, 10, 2, '2020-07-19', 9, NULL,11),
(5, 4, 8, '2020-07-04', 6, NULL,5),
(9, 7, 1, '2021-01-31', 5, NULL,9),
(4, 12, 3, '2020-08-14', 12, NULL,4),
(4, 2, 8, '2021-05-22', 12, NULL,4),
(3, 3, 6, '2021-03-15', 4, NULL,3),
(9, 12, 5, '2021-06-04', 10, NULL,9),
(10, 1, 3, '2020-11-05', 11, NULL,10),
(2, 5, 5, '2021-04-08', 12, NULL,2),
(11, 14, 7, '2020-08-05', 8, NULL,11),
(6, 5, 7, '2021-04-27', NULL, 3,6),
(9, 9, 7, '2021-01-05', 9, NULL,9),
(1, 8, 8, '2021-06-02', 4, NULL,1),
(9, 2, 8, '2021-01-09', 6, NULL,9),
(10, 15, 7, '2020-07-01', 12, NULL,10),
(5, 2, 2, '2021-03-28', 10, NULL,5),
(8, 16, 6, '2021-01-09', 7, NULL,8),
(8, 16, 8, '2021-01-27', 10, NULL,8),
(4, 9, 6, '2020-11-21', 11, NULL,4),
(8, 16, 4, '2021-01-27', 11, NULL,8),
(5, 7, 8, '2021-05-05', 12, NULL,5),
(2, 10, 6, '2021-06-01', 5, NULL,2),
(10, 8, 8, '2021-06-19', 9, NULL,10),
(2, 7, 2, '2021-01-25', 4, NULL,2),
(4, 17, 2, '2021-02-27', 10, NULL,4),
(2, 1, 7, '2020-08-18', 11, NULL,2),
(11, 3, 2, '2021-04-17', 6, NULL,11),
(4, 17, 3, '2021-05-25', 7, NULL,4),
(1, 14, 2, '2020-07-30', 7, NULL,1),
(4, 11, 5, '2021-01-02', 5, NULL,4),
(8, 12, 5, '2020-08-08', NULL, 8,8),
(8, 6, 6, '2021-05-14', 10, NULL,8),
(9, 8, 8, '2020-07-09', 8, NULL,9),
(8, 2, 3, '2020-06-14', 6, NULL,8),
(1, 4, 5, '2021-06-19', 5, NULL,1),
(11, 6, 5, '2020-11-04', 7, NULL,11),
(5, 14, 2, '2020-11-07', 4, NULL,5),
(6, 13, 1, '2020-06-28', 4, NULL,6),
(7, 13, 2, '2021-02-10', 11, NULL,7),
(6, 4, 3, '2020-12-01', 5, NULL,6),
(7, 11, 7, '2021-01-24', 8, NULL,7),
(6, 3, 6, '2021-04-01', 11, NULL,6),
(8, 8, 1, '2020-07-25', 7, NULL,8),
(11, 12, 6, '2021-02-28', 10, NULL,11),
(2, 10, 3, '2021-03-27', 10, NULL,2),
(3, 13, 8, '2021-03-30', 10, NULL,3),
(7, 16, 5, '2020-07-05', 5, NULL,7),
(10, 17, 3, '2021-04-04', 9, NULL,10),
(3, 17, 6, '2020-10-14', 7, NULL,3),
(4, 6, 2, '2020-10-10', 9, NULL,4),
(4, 11, 3, '2020-12-29', 8, NULL,4),
(5, 8, 4, '2021-06-01', 10, NULL,5),
(10, 7, 8, '2020-07-05', 5, NULL,10),
(8, 1, 4, '2020-10-30', 4, NULL,8),
(3, 3, 3, '2021-03-27', 7, NULL,3),
(4, 7, 8, '2021-03-07', 6, NULL,4),
(2, 14, 8, '2021-02-17', 12, NULL,2),
(3, 10, 6, '2020-09-25', 12, NULL,3),
(12, 14, 3, '2021-04-29', 5, NULL,12),
(11, 17, 5, '2020-11-20', 9, NULL,11),
(5, 11, 6, '2020-10-17', 12, NULL,5),
(9, 11, 7, '2020-08-14', 5, NULL,9),
(5, 14, 6, '2021-01-28', 4, NULL,5),
(10, 16, 2, '2020-06-15', 8, NULL,10),
(3, 1, 4, '2020-12-25', 12, NULL,3),
(1, 12, 1, '2020-07-02', 12, NULL,1),
(7, 16, 5, '2020-06-13', 7, NULL,7),
(11, 2, 3, '2020-07-09', 12, NULL,11),
(5, 2, 5, '2021-06-16', 10, NULL,5),
(11, 16, 1, '2020-06-26', 6, NULL,11),
(7, 2, 5, '2020-07-10', 9, NULL,7),
(4, 13, 7, '2020-12-16', 12, NULL,4),
(12, 14, 7, '2021-04-06', 5, NULL,12),
(9, 3, 4, '2020-09-18', 4, NULL,9),
(5, 6, 8, '2021-01-30', 8, NULL,5),
(4, 10, 2, '2020-10-17', 6, NULL,4),
(7, 11, 2, '2021-05-25', 9, NULL,7),
(8, 9, 4, '2020-10-17', 5, NULL,8),
(5, 1, 3, '2020-11-27', 11, NULL,5),
(5, 10, 3, '2021-02-22', 8, NULL,5),
(12, 13, 4, '2021-03-15', 4, NULL,12),
(12, 6, 6, '2020-10-09', 6, NULL,12),
(10, 14, 3, '2020-07-13', 4, NULL,10),
(9, 10, 7, '2020-11-23', 8, NULL,9),
(11, 14, 4, '2021-02-12', 4, NULL,11),
(5, 3, 5, '2020-12-30', 10, NULL,5),
(12, 5, 6, '2021-01-30', 12, NULL,12),
(10, 4, 4, '2021-05-28', 6, NULL,10),
(7, 4, 7, '2021-04-04', 8, NULL,7),
(4, 4, 4, '2021-05-22', 4, NULL,4),
(11, 16, 1, '2020-10-29', 8, NULL,11),
(4, 15, 6, '2020-09-07', 6, NULL,4),
(1, 6, 4, '2020-10-09', 11, NULL,1),
(1, 5, 7, '2021-06-09', 9, NULL,1),
(6, 7, 5, '2020-11-17', 5, NULL,6),
(5, 15, 1, '2021-02-10', 4, NULL,5),
(12, 12, 8, '2020-11-28', 10, NULL,12)
;




