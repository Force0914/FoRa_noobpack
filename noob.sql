USE `essentialmode`;
ALTER TABLE `users` ADD `noob` varchar(5) COLLATE utf8mb4_bin NOT NULL DEFAULT '0';
INSERT INTO `items` (name, label) VALUES
	('noob', '新手禮包')
;