-- This file is to bootstrap a database for the CS3200 project. 

-- Create a new database.  You can change the name later.  You'll
-- need this name in the FLASK API file(s),  the AppSmith 
-- data source creation.
create database MovieSpot;

-- Via the Docker Compose file, a special user called webapp will 
-- be created in MySQL. We are going to grant that user 
-- all privilages to the new database we just created. 
-- TODO: If you changed the name of the database above, you need 
-- to change it here too.
grant all privileges on MovieSpot.* to 'webapp'@'%';
flush privileges;

-- Move into the database we just created.
-- TODO: If you changed the name of the database above, you need to
-- change it here too. 
use MovieSpot;

-- Put your DDL 
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    pass VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email_address VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    preferences TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    length INT NOT NULL,
    director VARCHAR(50) NOT NULL,
    plot VARCHAR(255) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    actors TEXT NOT NULL
);

CREATE TABLE Theaters (
    theater_id INT AUTO_INCREMENT PRIMARY KEY,
    num_halls INT NOT NULL,
    city VARCHAR(100) NOT NULL,
    sells_foods BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE Foods (
    food_id INT AUTO_INCREMENT PRIMARY KEY,
    price INT NOT NULL,
    name VARCHAR(50) NOT NULL
);

INSERT INTO Theaters (theater_id, num_halls, city, sells_foods)
VALUES 
('1311-NP', 102, 'Bururi', 80),
('5441-BX', 104, 'Tuochuan', 82),
('1242-ZV', 102, 'Santo Amador', 56),
('1278-FE', 104, 'Rio Grande', 4),
('1706-HS', 104, 'Taocheng', 7),
('5198-BY', 104, 'Salaberry-de-Valleyfield', 90),
('4705-AO', 104, 'Shiqiaotou', 34),
('7867-VB', 102, 'Sut-Khol’', 52),
('6040-XP', 105, 'Kurmuk', 6),
('8372-OJ', 104, 'Āqchah', 54),
('3492-PK', 103, 'El Valle del Espíritu Santo', 93),
('3156-RD', 105, 'Alindao', 99),
('1222-HT', 103, 'Karasuyama', 4),
('3394-CC', 105, 'Nangka', 23),
('0323-HS', 102, 'Bent Jbaïl', 58),
('6630-XA', 103, 'Vila Alva', 25),
('2488-KV', 102, 'Cotuí', 18),
('3405-KB', 101, 'Podhum', 31),
('3657-EU', 103, 'Bahía Blanca', 78),
('5460-OM', 101, 'Washington', 3),
('5737-YN', 103, 'Ginatilan', 81),
('8729-XW', 101, 'London', 58),
('1504-FB', 103, 'Krajan', 20),
('4056-MZ', 102, 'Värnamo', 97),
('4916-GC', 105, 'Coro', 89),
('0485-NC', 105, 'Sumberpandan', 99),
('1835-SM', 103, 'Gislaved', 80),
('9443-ME', 104, 'Kaingiwa', 1),
('0482-SS', 105, 'Gandekan', 51),
('4852-QR', 102, 'Mmaaf', 68),
('0351-HF', 103, 'Wuchagou', 66),
('5485-RK', 102, 'Töreboda', 66),
('1950-FY', 104, 'Apóstoles', 100),
('1763-LQ', 102, 'Tanagara', 94),
('5263-BS', 102, 'Haolibao', 75),
('1909-HT', 102, 'Nicosia', 54),
('3304-AL', 102, 'Rogoza', 82),
('5572-GX', 105, 'Kaum Kaler', 93),
('1231-OO', 101, 'Pedraza', 43),
('2168-YM', 102, 'Azteca', 79),
('0099-MS', 102, 'Takefu', 68),
('5235-CA', 105, 'Bilalang', 61),
('1654-CI', 102, 'Rāvar', 63),
('5022-RQ', 103, 'Razvanje', 23),
('4552-WX', 101, 'Niverville', 31),
('6696-TF', 103, 'Sopla', 1),
('8522-VW', 102, 'Cihaur', 52),
('1525-FI', 105, 'Phonsavan', 38),
('2331-CG', 105, 'Schœlcher', 77),
('6292-QE', 103, 'Panalanoy', 29),
('8456-KA', 105, 'Mayingzhuang', 74),
('7316-DP', 104, 'Kuroiso', 100),
('0381-PA', 102, 'Pawa', 62),
('1630-BO', 104, 'Bantogon', 41),
('6785-JU', 103, 'Nanterre', 87),
('8214-VT', 102, 'Hexi', 34),
('5001-VM', 103, 'Rešetari', 26),
('6251-JI', 105, 'Tuateta', 4),
('3628-FR', 104, 'Vilufushi', 41),
('5440-SB', 103, 'Ipauçu', 97),
('6120-YV', 104, 'Pozo Hondo', 14),
('5447-GS', 105, 'Jedlińsk', 32),
('3794-XG', 104, 'Chengnan', 32),
('8381-JL', 101, 'Dublin', 98),
('2910-DZ', 105, 'Deventer', 83),
('2718-CN', 102, 'Bytkiv', 23),
('9722-SS', 104, 'Jianggao', 82),
('7876-FV', 103, 'Aganan', 12),
('5086-LL', 105, 'Efeng', 85),
('8106-IY', 104, 'Puerto Morazán', 6);



INSERT INTO Users (user_id, first_name, last_name, email_address, location, phone, preferences, created_at, last_updated)
VALUES 
(1, 'Vivianna', 'Swiers', 'vswiers0@vkontakte.ru', '6953 Pond Point', '252-783-3144', 'Drama', '2023-09-26', '2023-09-08'),
(2, 'Worthy', 'Ellicombe', 'wellicombe1@unblog.fr', '74161 Hanover Trail', '646-391-6085', 'Comedy', '2023-09-06', '2024-03-01'),
(3, 'Gualterio', 'Wathell', 'gwathell2@oakley.com', '06 Mcbride Drive', '846-502-9675', 'Drama|Romance', '2023-09-08', '2024-03-04'),
(4, 'Jessamyn', 'Konerding', 'jkonerding3@columbia.edu', '0132 Eggendart Alley', '313-865-3262', 'Drama|Fantasy|Sci-Fi', '2023-08-28', '2024-03-31'),
(5, 'Giff', 'Willment', 'gwillment4@alibaba.com', '25 Oneill Park', '599-946-4632', 'Horror', '2023-10-29', '2024-04-10'),
(6, 'Devonne', 'Althrop', 'dalthrop5@salon.com', '5476 Waubesa Circle', '922-948-3432', 'Action|Animation|Comedy', '2023-07-07', '2023-08-27'),
(7, 'Elwyn', 'Muncie', 'emuncie6@bbb.org', '19 Bashford Drive', '501-802-6021', 'Action|Horror|Thriller', '2023-06-30', '2023-06-14'),
(8, 'Roxana', 'Climson', 'rclimson7@xrea.com', '92 Morning Circle', '714-845-9389', 'Comedy|Drama', '2023-04-22', '2023-08-30'),
(9, 'Noach', 'Stribling', 'nstribling8@gov.uk', '8092 Farwell Trail', '316-416-1635', 'Drama', '2023-12-25', '2023-07-13'),
(10, 'Thomas', 'Dennes', 'tdennes9@geocities.com', '412 Northport Street', '636-724-7242', 'Comedy|Drama', '2023-07-16', '2024-01-14'),
(11, 'Syman', 'Gadie', 'sgadiea@toplist.cz', '053 Village Street', '377-120-3932', 'Drama', '2023-08-06', '2023-12-13'),
(12, 'Herrick', 'Stanlike', 'hstanlikeb@senate.gov', '942 Red Cloud Plaza', '299-854-1955', 'Documentary', '2024-04-16', '2024-03-10'),
(13, 'Jany', 'Hurcombe', 'jhurcombec@arstechnica.com', '04 Lighthouse Bay Street', '593-202-5580', 'Adventure|Drama|Romance|Western', '2023-06-23', '2024-03-20'),
(14, 'Bobbe', 'Blount', 'bblountd@cnn.com', '5 Fordem Parkway', '714-772-2412', 'Comedy', '2024-02-10', '2023-09-21'),
(15, 'Oberon', 'Silverlock', 'osilverlocke@opera.com', '81079 Pepper Wood Junction', '643-128-2859', 'Drama', '2024-01-28', '2023-07-29'),
(16, 'Royall', 'Miranda', 'rmirandaf@hao123.com', '83 David Circle', '157-932-7126', 'Drama', '2024-01-12', '2023-10-27'),
(17, 'Kristofor', 'Epton', 'keptong@typepad.com', '96 Riverside Pass', '475-187-4798', 'Documentary', '2024-02-10', '2023-10-28'),
(18, 'Trenton', 'Okker', 'tokkerh@cmu.edu', '6 Sauthoff Road', '284-717-6701', 'Horror|Mystery|Thriller', '2023-12-09', '2023-07-24'),
(19, 'Sharyl', 'Hyslop', 'shyslopi@fotki.com', '2 Mitchell Pass', '756-539-5725', 'Crime|Drama|Thriller', '2023-10-01', '2024-01-24'),
(20, 'Allin', 'Craisford', 'acraisfordj@instagram.com', '5 7th Park', '383-357-5311', 'Comedy|Drama|Musical', '2023-10-09', '2023-12-20'),
(21, 'Brier', 'Cellone', 'bcellonek@nih.gov', '5 Mesta Pass', '953-373-4807', 'Crime|Drama|Thriller', '2023-06-01', '2023-10-18'),
(22, 'Emlynn', 'Pallent', 'epallentl@theguardian.com', '347 Dayton Trail', '740-878-4970', 'Drama|Thriller', '2023-04-30', '2023-08-11'),
(23, 'Augustus', 'Edward', 'aedwardm@scientificamerican.com', '9193 Hagan Court', '916-869-8650', 'Comedy|Drama', '2023-12-31', '2023-08-22'),
(24, 'Emelyne', 'Rivel', 'eriveln@constantcontact.com', '78 Johnson Terrace', '676-180-1258', 'Drama', '2023-06-19', '2024-01-01'),
(25, 'Raina', 'Vinall', 'rvinallo@bluehost.com', '5324 Esker Terrace', '452-812-0555', 'Action|Adventure|Crime|Drama|Western', '2023-09-15', '2023-12-20'),
(26, 'Cosme', 'Eloi', 'celoip@bluehost.com', '02 Dwight Street', '395-866-6702', 'Action|Mystery|Thriller', '2023-08-23', '2023-08-21'),
(27, 'Barnebas', 'Dearlove', 'bdearloveq@toplist.cz', '05 Maryland Lane', '654-241-7486', 'Comedy|Musical|Sci-Fi', '2023-10-14', '2024-04-17'),
(28, 'Massimiliano', 'Draysay', 'mdraysayr@seattletimes.com', '79 Judy Drive', '648-819-0039', 'Horror', '2023-11-22', '2023-06-29'),
(29, 'Oswald', 'Prazer', 'oprazers@oakley.com', '6 Doe Crossing Park', '157-214-5479', 'Comedy', '2024-02-11', '2023-08-31'),
(30, 'Murvyn', 'Klewi', 'mklewit@oracle.com', '72057 Fairfield Drive', '271-260-7042', 'Comedy|Mystery|Romance', '2024-02-11', '2024-02-05'),
(31, 'Reagen', 'McWhinnie', 'rmcwhinnieu@psu.edu', '0030 Waxwing Park', '802-745-7571', 'Drama', '2023-05-19', '2024-02-20'),
(32, 'Jemimah', 'Cook', 'jcookv@domainmarket.com', '3864 Forest Center', '718-803-9734', 'Animation|Comedy|Sci-Fi', '2024-02-17', '2023-09-28'),
(33, 'Wynn', 'Mordan', 'wmordanw@soup.io', '48263 Golf View Center', '149-754-8846', 'Drama|Fantasy|Romance', '2023-06-11', '2024-01-21'),
(34, 'Georgetta', 'Dellit', 'gdellitx@google.co.jp', '57696 Mallard Alley', '853-111-5902', 'Crime|Drama|Thriller', '2024-02-18', '2023-10-21'),
(35, 'Aristotle', 'Duthie', 'aduthiey@shutterfly.com', '433 Hazelcrest Crossing', '763-321-9359', 'Comedy|Drama|Film-Noir|Romance', '2023-08-12', '2023-05-04'),
(36, 'Clyde', 'McMichan', 'cmcmichanz@harvard.edu', '33499 Dottie Road', '648-462-5776', 'Drama', '2023-05-06', '2023-09-09'),
(37, 'Demetris', 'Sturley', 'dsturley10@diigo.com', '539 Delaware Road', '932-633-5500', 'Documentary', '2023-10-27', '2023-08-26'),
(38, 'Georgeanna', 'MacLice', 'gmaclice11@hp.com', '0641 Commercial Plaza', '705-590-7601', 'Comedy|Crime|Drama|Thriller', '2023-05-08', '2023-05-31'),
(39, 'Lars', 'Stefi', 'lstefi12@naver.com', '271 Welch Center', '490-484-7787', 'Comedy|Romance', '2023-05-25', '2023-04-25'),
(40, 'Ileana', 'Draco', 'idraco13@scientificamerican.com', '87188 Thackeray Terrace', '903-538-3126', 'Drama|Romance', '2023-10-08', '2023-07-28'),
(41, 'Garwood', 'Lucius', 'glucius14@unicef.org', '6 Fallview Alley', '498-375-2389', 'Horror|Thriller', '2024-04-14', '2024-03-08'),
(42, 'Herrick', 'Philipeaux', 'hphilipeaux15@smh.com.au', '746 Marquette Parkway', '771-695-8931', 'Drama', '2023-09-17', '2023-06-07'),
(43, 'Terri-jo', 'Cristofori', 'tcristofori16@t-online.de', '4524 Londonderry Lane', '945-498-8189', 'Comedy|Romance', '2023-11-06', '2024-01-06'),
(44, 'Herschel', 'Belding', 'hbelding17@google.pl', '3 Crescent Oaks Drive', '993-632-2325', 'Action|Comedy', '2024-04-16', '2024-02-03'),
(45, 'Verla', 'Skim', 'vskim18@devhub.com', '3 Katie Avenue', '644-911-1291', 'Adventure|Comedy|Sci-Fi|Western', '2023-08-27', '2024-02-23'),
(46, 'Wilhelmina', 'Minnette', 'wminnette19@webmd.com', '86 Granby Crossing', '224-761-5436', 'Comedy|Drama|Romance', '2023-05-01', '2023-09-03'),
(47, 'Fey', 'Rembrandt', 'frembrandt1a@narod.ru', '61037 Clemons Avenue', '808-641-9685', 'Action|Adventure|Animation', '2023-05-25', '2023-09-21'),
(48, 'Cesare', 'Aldous', 'caldous1b@e-recht24.de', '6723 Walton Way', '827-595-6216', 'Romance|Western', '2024-01-26', '2023-09-15'),
(49, 'Sebastien', 'Tilzey', 'stilzey1c@netvibes.com', '799 Thompson Alley', '943-532-4381', 'Documentary', '2023-05-31', '2024-02-19'),
(50, 'Meaghan', 'Whittlesea', 'mwhittlesea1d@theatlantic.com', '8744 Delladonna Plaza', '240-373-6337', 'Comedy|Drama|Western', '2023-09-18', '2024-01-08'),
(51, 'Oriana', 'Lock', 'olock1e@yolasite.com', '4 Carey Pass', '614-129-0197', 'Comedy|Drama', '2023-12-10', '2023-08-31'),
(52, 'Dot', 'Immer', 'dimmer1f@loc.gov', '3 Fuller Court', '747-585-6627', 'Comedy|Crime|Drama|War', '2024-02-20', '2023-12-02'),
(53, 'Glenna', 'Redemile', 'gredemile1g@nationalgeographic.com', '4444 Upham Terrace', '801-603-4189', 'Horror', '2023-08-31', '2023-06-09'),
(54, 'Gideon', 'Beelby', 'gbeelby1h@wikispaces.com', '5292 Ronald Regan Way', '618-874-4039', 'Comedy|Musical|Romance', '2023-10-11', '2023-12-27'),
(55, 'Granthem', 'Hele', 'ghele1i@posterous.com', '1800 Coleman Road', '453-604-0616', 'Horror|Sci-Fi|Thriller', '2023-07-28', '2024-04-06'),
(56, 'Haleigh', 'Birk', 'hbirk1j@histats.com', '72354 Memorial Circle', '102-714-1257', 'Crime|Drama|Thriller', '2023-11-08', '2023-08-19'),
(57, 'Donaugh', 'Grzes', 'dgrzes1k@gov.uk', '71 Nevada Parkway', '810-194-0822', 'Musical', '2023-09-23', '2024-03-14'),
(58, 'Margie', 'Aitken', 'maitken1l@addtoany.com', '9153 Southridge Parkway', '441-194-7513', '(no genres listed)', '2024-03-07', '2023-09-06'),
(59, 'Sherlocke', 'Eyden', 'seyden1m@tripadvisor.com', '91337 Carey Crossing', '282-871-9089', 'Adventure|Drama|Western', '2023-11-23', '2023-06-05'),
(60, 'Prisca', 'McGready', 'pmcgready1n@wisc.edu', '464 Lighthouse Bay Circle', '499-114-6780', 'Crime|Drama|Thriller', '2023-08-26', '2023-07-25'),
(61, 'Simeon', 'Plumstead', 'splumstead1o@cdbaby.com', '610 Ramsey Alley', '260-659-2391', 'Drama', '2023-10-13', '2023-10-12'),
(62, 'Madlen', 'Hearnaman', 'mhearnaman1p@networkadvertising.org', '3 Clove Terrace', '659-581-5244', 'Comedy', '2023-12-09', '2023-04-21'),
(63, 'Dorita', 'Laughtisse', 'dlaughtisse1q@kickstarter.com', '38803 Browning Point', '899-511-1364', 'Action|Horror|Mystery|Thriller', '2023-09-09', '2024-02-13'),
(64, 'Franklyn', 'Schwerin', 'fschwerin1r@oaic.gov.au', '14655 Hoard Terrace', '202-286-7376', 'Action|Crime|Drama|Thriller', '2024-02-23', '2023-12-24'),
(65, 'Benedikt', 'McAirt', 'bmcairt1s@spotify.com', '0 Butternut Junction', '466-367-4209', 'Comedy', '2023-04-24', '2023-12-10'),
(66, 'Maggy', 'Tethacot', 'mtethacot1t@theatlantic.com', '47328 Calypso Alley', '875-287-2416', 'Documentary', '2023-11-13', '2023-11-18'),
(67, 'Clara', 'Doblin', 'cdoblin1u@oakley.com', '35 Arrowood Trail', '788-454-1083', 'Comedy|Romance', '2024-02-10', '2024-03-18'),
(68, 'Shanda', 'Baigrie', 'sbaigrie1v@apache.org', '406 Fremont Circle', '155-332-7064', 'Comedy|Drama', '2024-04-05', '2023-12-25'),
(69, 'Gavin', 'Dei', 'gdei1w@hexun.com', '59 Gale Center', '703-310-9565', 'Drama|Romance|War', '2023-07-18', '2023-06-13'),
(70, 'Rhetta', 'Medcalf', 'rmedcalf1x@buzzfeed.com', '4022 Huxley Trail', '722-543-5398', 'Comedy|Fantasy', '2023-08-07', '2023-12-17');

