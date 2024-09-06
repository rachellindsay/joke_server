

-- SET NAMES utf8;
-- SET time_zone = '+00:00';
-- SET foreign_key_checks = 0;
-- SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

-- CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'example';
-- GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'; 

-- *********************     joke_db     ************************

CREATE DATABASE IF NOT EXISTS `joke_db`;

USE joke_db;

DROP TABLE IF EXISTS `can_approve`;
CREATE TABLE `can_approve` (
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL
);

INSERT INTO `can_approve` (`user_name`, `user_email`) VALUES
('Rachel',	'racheljlindsay@gmail.com');


DROP TABLE IF EXISTS `jokes`;
CREATE TABLE `jokes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joke` varchar(250) NOT NULL,
  `category` varchar(20) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`)
); 

INSERT INTO `jokes` (`id`, `joke`, `category`, `user_email`, `status`) VALUES
(1,	'What did the shy pebble wish for? That they were a little boulder.',	'misc',	'racheljlindsay@gmail.com',	'approved'),
(2,	'A man knocked on my door and asked for a small donation towards the local swimming pool. I gave him a glass of water.',	'misc',	'racheljlindsay@gmail.com',	'approved');

-- ***************      STATS         ***********************

CREATE DATABASE IF NOT EXISTS `stats_db`;

USE stats_db;

DROP TABLE IF EXISTS `jokes_told`;
CREATE TABLE `jokes_told` (
  `time_stamp` datetime NOT NULL DEFAULT current_timestamp(),
  `joke_id` int(11) NOT NULL,
  `logged_in` boolean NOT NULL,
  `category` varchar(20) DEFAULT NULL
);

DROP TABLE IF EXISTS `jokes_submitted`;
CREATE TABLE `jokes_submitted` (
  `time_stamp` datetime NOT NULL DEFAULT current_timestamp(),
  `who` varchar(50) NOT NULL,
  `category` varchar(20) DEFAULT NULL
);

