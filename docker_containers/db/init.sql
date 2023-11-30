-- Adminer 4.8.1 MySQL 5.5.5-10.11.5-MariaDB-1:10.11.5+maria~ubu2204 dump
-- 2023-10-19 05:39:30

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `can_approve`;
CREATE TABLE `can_approve` (
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `jokes` (`id`, `joke`, `category`, `user_email`, `status`) VALUES
(1,	'What did the shy pebble wish for? That they were a little boulder.',	'misc',	'racheljlindsay@gmail.com',	'approved'),
(2,	'A ghost walks into a bar and asks for a glass of vodka. The bartender says, \"Sorry, we don\'t serve spirits.\"',	'misc',	'racheljlindsay@gmail.com',	'approved'),
(3,	'A man knocked on my door and asked for a small donation towards the local swimming pool. I gave him a glass of water.',	'misc',	'racheljlindsay@gmail.com',	'approved'),
(4,	'What\'s the longest word in the dictionary? Smiles. Because there is a mile between the Ss.',	'misc',	'racheljlindsay@gmail.com',	'approved'),
(5,	'I\'ll never forget my Granddad\'s last words to me just before he died. \"Are you still holding the ladder?\"',	'misc',	'racheljlindsay@gmail.com',	'approved'),
(6,	'A neutron walks into a bar and asks for the drink prices. The bartender says, \"For you, no charge.\"',	'misc',	'racheljlindsay@gmail.com',	'approved'),
(7,	'There are two fish in a tank. One turns to the other and says, \"Do you know how to drive this thing?\"',	'animal',	'racheljlindsay@gmail.com',	'pending'),
(8,	'What did the buffalo say to his little boy when he dropped him off at school? Bison.',	'animal',	'racheljlindsay@gmail.com',	'pending'),
(9,	'Which side of a chicken has more feathers? The outside.',	'animal',	'racheljlindsay@gmail.com',	'pending'),
(10,	'Why do cows wear bells? Because their horns don\'t work.',	'animal',	'racheljlindsay@gmail.com',	'pending'),
(11,	'What did the big flower say to the little flower? Hi, bud.',	'plant',	'racheljlindsay@gmail.com',	'pending'),
(12,	'Which flower is most fierce? Dandelion',	'plant',	'racheljlindsay@gmail.com',	'approved'),
(13,	'What do call a pile of cats? A meowtain.',	'cat',	'racheljlindsay@gmail.com',	'approved'),
(14,	'What\'s brown and sounds like a bell? Dung',	'misc',	'racheljlindsay@gmail.com',	'approved');


