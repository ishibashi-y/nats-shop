-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `customer` (`id`, `name`, `address`, `login`, `password`, `email`) VALUES
(1,	'熊木 和夫',	'東京都新宿区西新宿2-8-1',	'kumaki',	'BearTree1',	'asdf'),
(2,	'鳥居 健二',	'神奈川県横浜市中区日本大通1',	'torii',	'BirdStay2',	'sdfgdsg'),
(3,	'鷺沼 美子',	'大阪府大阪市中央区大手前2',	'saginuma',	'EgretPond3',	'sggfd'),
(4,	'鷲尾 史郎',	'愛知県名古屋市中区三の丸3-1-2',	'washio',	'EagleTail4',	'sdbfs'),
(5,	'牛島 大悟',	'埼玉県さいたま市浦和区高砂3-15-1',	'ushijima',	'CowIsland5',	'nbvcn'),
(6,	'相馬 助六',	'千葉県地足中央区市場町1-1',	'souma',	'PhaseHorse6',	'sfgnny'),
(7,	'猿飛 菜々子',	'兵庫県神戸市中央区下山手通5-10-1',	'sarutobi',	'MonkeyFly7',	'hkjh'),
(8,	'犬山 陣八',	'北海道札幌市中央区北3西6',	'inuyama',	'DogMountain8',	'yuikuy'),
(9,	'猪口 一休',	'福岡県福岡市博多区東公園7-7',	'inokuchi',	'BoarMouse9',	'luy'),
(10,	'後藤次郎',	'東京都千代田区神田松永町',	'satojiro13',	'$2y$10$4ZpGJ5WrsHbHWTUpDtuwO.axJewS4bxpHhlNpChDtUV37wB7qyVQq',	'satojiro1@gmail.com'),
(11,	'後藤次郎',	'東京都千代田区神田松永町',	't833w2bma',	'$2y$10$4ZpGJ5WrsHbHWTUpDtuwO.axJewS4bxpHhlNpChDtUV37wB7qyVQq',	'bma@gmail.com'),
(13,	'佐藤 次郎',	'東京都千代田区1-2',	'rensh',	'$2y$10$jnkvevIm6MtvK.qekXeR7OGQHFWPzuAMASAeMZlEYCBAmgjelMb2e',	'satojiro13@gmail.com');

SET NAMES utf8;

DROP TABLE IF EXISTS `customer_tmp`;
CREATE TABLE `customer_tmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL,
  `created` datetime NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `customer_tmp` (`id`, `email`, `token`, `created`) VALUES
(1,	'satojiro13@gmail.com',	'ep4jk75n6q04800sgk8s000wo',	'2020-07-30 17:36:13'),
(2,	'satojiro13@gmail.com',	'f20dq3g46144g8cs4c48gsgs8',	'2020-07-30 17:39:06'),
(3,	'satojiro13@gmail.com',	'4ul1q4pgrts0804csc084g8cg',	'2020-07-31 19:40:43');

DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `favorite` (`customer_id`, `product_id`) VALUES
(10,	1),
(11,	6);

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `product` (`id`, `name`, `price`) VALUES
(1,	'松の実',	700),
(2,	'くるみ',	270),
(3,	'ひまわりの種',	210),
(4,	'アーモンド',	220),
(5,	'カシューナッツ',	250),
(6,	'ジャイアントコーン',	180),
(7,	'ピスタチオ',	310),
(8,	'マカダミアナッツ',	600),
(9,	'かぼちゃの種',	180),
(10,	'ピーナッツ',	150),
(11,	'クコの実',	400),
(12,	'そら豆',	1990),
(13,	'えだ豆',	500),
(14,	'小豆',	1500);

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `purchase` (`id`, `customer_id`) VALUES
(1,	10);

DROP TABLE IF EXISTS `purchase_detail`;
CREATE TABLE `purchase_detail` (
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`purchase_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `purchase_detail_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`id`),
  CONSTRAINT `purchase_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `purchase_detail` (`purchase_id`, `product_id`, `count`) VALUES
(1,	1,	1);

-- 2020-08-04 07:34:05
