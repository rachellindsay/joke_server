

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'example';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'; 

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
(2,	'A ghost walks into a bar and asks for a glass of vodka. The bartender says, \"Sorry, we don\'t serve spirits.\"',	'misc',	'racheljlindsay@gmail.com',	'approved'),
(3,	'A man knocked on my door and asked for a small donation towards the local swimming pool. I gave him a glass of water.',	'misc',	'racheljlindsay@gmail.com',	'approved'),
(4,	'What\'s the longest word in the dictionary? Smiles. Because there is a mile between the Ss.',	'misc',	'racheljlindsay@gmail.com',	'approved'),
(5,	'I\'ll never forget my Granddad\'s last words to me just before he died. \"Are you still holding the ladder?\"',	'misc',	'racheljlindsay@gmail.com',	'approved'),
(6,	'A neutron walks into a a bar and asks for the drink prices. The bartender says, \"For you, no charge.\"',	'misc',	'racheljlindsay@gmail.com',	'approved'),
(7,	'There are two fish in a tank. One turns to the other and says, \"Do you know how to drive this thing?\"',	'animal',	'racheljlindsay@gmail.com',	'approved'),
(8,	'What did the buffalo say to his little boy when he dropped him off at school? Bison.',	'animal',	'racheljlindsay@gmail.com',	'approved'),
(9,	'Which side of a chicken has more feathers? The outside.',	'animal',	'racheljlindsay@gmail.com',	'approved'),
(10,	'Why do cows wear bells? Because their horns don\'t work.',	'animal',	'racheljlindsay@gmail.com',	'approved'),
(11,	'What did the big flower say to the little flower? Hi, bud.',	'plant',	'racheljlindsay@gmail.com',	'approved'),
(12,	'Which flower is most fierce? Dandelion',	'plant',	'racheljlindsay@gmail.com',	'approved'),
(13,	'What do call a pile of cats? A meowtain.',	'cat',	'racheljlindsay@gmail.com',	'approved'),
(14,	'What\'s brown and sounds like a bell? Dung',	'misc',	'racheljlindsay@gmail.com',	'approved'),
(15,	'what did the alien say to the cat? \"take me to your litter.\"',	'cat',	'example@example.com',	'approved'),
(16,	'What did the young plant say to the old plant? Ok, bloomer.',	'plant',	'example@example.com',	'approved'),
(17,	'When does a farmer dance? When they drop the beet.',	'plant',	'example@example.com',	'approved'),
(18,	'Why did the tomato blush? Because they saw the salad dressing.',	'plant',	'example@example.com',	'approved'),
(19,	'What do you call a cat that likes to bowl? An alley cat.',	'cat',	'example@example.com',	'approved'),
(20,	'Did you hear about the cat that swallowed a ball of yarn? She had mittens.',	'cat',	'example@example.com',	'approved'),
(21,	'What do you call a sleeping bull? A bull-dozer.',	'animal',	'example@example.com',	'approved'),
(22,	'What do you call a sleeping bull? A bull-dozer.',	'animal',	'example@example.com',	'rejected'),
(23,	'What did the farmer call the cow that had no milk? An udder failure.',	'animal',	'example@example.com',	'approved'),
(24,	'How do you fit more pigs on your farm? Build a sty-scraper.',	'animal',	'example@example.com',	'rejected'),
(25,	'What did the spider do on the computer? She made a web-site.',	'misc',	'example@example.com',	'approved'),
(26,	'What is a computer virus? A terminal illness.',	'misc',	'example@example.com',	'approved'),
(27,	'What did the baby corn say to its mom? Where is pop corn?',	'misc',	'example@example.com',	'approved'),
(28,	'How do you make a milk shake? Give it a good scare.',	'misc',	'example@example.com',	'approved'),
(29,	'Why was Cinderella so bad at soccer? She kept running away from the ball.',	'misc',	'example@example.com',	'approved'),
(30,	'Why can\'t you hear a pterodactyl using the bathroom? Because the \"p\" is silent.',	'misc',	'example@example.com',	'approved'),
(31,	'Where do polar bears keep their money? In a snowbank.',	'animal',	'example@example.com',	'approved'),
(32,	'What has more lives than a cat? A frog, because it croaks every day.',	'cat',	'example@example.com',	'rejected'),
(33,	'What has four wheels and flies? A garbage truck.',	'misc',	'example@example.com',	'approved'),
(34,	'What do sea monsters eat? Fish and ships.',	'misc',	'example@example.com',	'approved'),
(35,	'What is small, red, and has a rough voice? A hourse radish.',	'plant',	'example@example.com',	'approved'),
(36,	'Why shouldn\'t you tell secrets in a cornfield? Too many ears.',	'plant',	'example@example.com',	'approved'),
(37,	'Why did the strawberry cry? They found themself in a jam.',	'plant',	'example@example.com',	'approved'),
(38,	'How do you tell the difference between a bull and a cow. It is either one or the udder.',	'animal',	'example@example.com',	'pending'),
(39,	'What do you call a bear with no teeth? A gummy bear.',	'animal',	'example@example.com',	'pending'),
(40,	'What\'s the best thing about Switzerland? I don\'t know, but the flag is a big plus.',	'misc',	'example@example.com',	'pending');



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

