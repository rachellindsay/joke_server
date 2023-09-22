-- Adminer 4.8.1 MySQL 5.5.5-10.11.2-MariaDB-1:10.11.2+maria~ubu2204 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `joke_db`;
CREATE DATABASE `joke_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `joke_db`;

DROP TABLE IF EXISTS `jokes`;
CREATE TABLE `jokes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `joke` varchar(250) NOT NULL,
  `category` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `jokes` (`id`, `approved`, `joke`, `category`) VALUES
(1,	1,	'What did the shy pebble wish for? That they were a little boulder.',	'misc'),
(2,	1,	'A ghost walks into a bar and asks for a glass of vodka. The bartender says, \"Sorry, we don\'t serve spirits.\"',	'misc'),
(3,	1,	'A man knocked on my door and asked for a small donation towards the local swimming pool. I gave him a glass of water.',	'misc'),
(4,	1,	'What\'s the longest word in the dictionary? Smiles. Because there is a mile between the Ss.',	'misc'),
(5,	1,	'I\'ll never forget my Granddad\'s last words to me just before he died. \"Are you still holding the ladder?\"',	'misc'),
(6,	1,	'A neutron walks into a a bar and asks for the drink prices. The bartender says, \"For you, no charge.\"',	'misc'),
(7,	1,	'There are two fish in a tank. One turns to the other and says, \"Do you know how to drive this thing?\"',	'animal'),
(8,	1,	'What did the buffalo say to his little boy when he dropped him off at school? Bison.',	'animal'),
(9,	1,	'Which side of a chicken has more feathers? The outside.',	'animal'),
(10,	1,	'Why do cows wear bells? Because their horns don\'t work.',	'animal'),
(11,	1,	'What did the big flower say to the little flower? Hi, bud.',	'plant'),
(12,	1,	'Which flower is most fierce? Dandelion',	'plant'),
(13,	1,	'What do call a pile of cats? A meowtain.',	'cat'),
(14,	1,	'What\'s brown and sounds like a bell? Dung',	'misc');