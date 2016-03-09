CREATE TABLE `city` (
	`city_id` INT(255) NOT NULL AUTO_INCREMENT,
	`city_name` varchar(255) NOT NULL UNIQUE DEFAULT 'city',
	PRIMARY KEY (`city_id`)
);

CREATE TABLE `country` (
	`country_id` INT(255) NOT NULL AUTO_INCREMENT,
	`country_name` varchar(255) NOT NULL,
	PRIMARY KEY (`country_id`)
);

CREATE TABLE `hotel` (
	`hotel_id` INT(255) NOT NULL AUTO_INCREMENT,
	`hotel_name` VARCHAR(255) NOT NULL,
	`hotel_description` TEXT NOT NULL,
	`score` DECIMAL(2) NOT NULL,
	`chain_id` INT(255) NOT NULL,
	`country_id` INT(255) NOT NULL,
	`region_id` INT(255) NOT NULL,
	`city_id` INT(255) NOT NULL,
	`address_id` INT(255) NOT NULL,
	`facilitie_hotel_id` INT(255) NOT NULL,
	`type_hotel_id` INT(255) NOT NULL,
	PRIMARY KEY (`hotel_id`)
);

CREATE TABLE `room` (
	`room_id` INT(255) NOT NULL AUTO_INCREMENT,
	`room_name` VARCHAR(255) NOT NULL,
	`room_description` TEXT NOT NULL,
	`type_room_id` INT(255) NOT NULL,
	`facilitie_room_id` INT(255) NOT NULL,
	`type_room_id` INT(255) NOT NULL,
	PRIMARY KEY (`room_id`)
);

CREATE TABLE `user` (
	`user_id` INT NOT NULL AUTO_INCREMENT,
	`user_name` VARCHAR(255) NOT NULL,
	`user_surname` VARCHAR(255) NOT NULL,
	`user_login` VARCHAR(255) NOT NULL,
	`user_password` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE `order` (
	`order_id` INT(255) NOT NULL AUTO_INCREMENT,
	`user_id` INT(255) NOT NULL,
	PRIMARY KEY (`order_id`)
);

CREATE TABLE `type_hotel` (
	`type_hotel_id` INT(255) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`type_hotel_id`)
);

CREATE TABLE `facilitie_hotel` (
	`facilitie_hotel_id` INT(255) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`facilitie_hotel_id`)
);

CREATE TABLE `currency` (
	`currency_id` INT(255) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`currency_id`)
);

CREATE TABLE `language` (
	`language_id` INT(255) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`language_id`)
);

CREATE TABLE `facilitie_room` (
	`facilitie_room_id` INT(255) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`facilitie_room_id`)
);

CREATE TABLE `chain` (
	`chain_id` INT(255) NOT NULL AUTO_INCREMENT,
	`chaine_name` VARCHAR(255) NOT NULL,
	`chaine_description` TEXT NOT NULL,
	PRIMARY KEY (`chain_id`)
);

CREATE TABLE `region` (
	`region_id` INT(255) NOT NULL AUTO_INCREMENT,
	`region_name` varchar(255) NOT NULL,
	PRIMARY KEY (`region_id`)
);

CREATE TABLE `address` (
	`address_id` INT(255) NOT NULL AUTO_INCREMENT,
	`address_name` VARCHAR(255) NOT NULL UNIQUE DEFAULT 'city',
	` coordinates` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`address_id`)
);

CREATE TABLE `reservation_room` (
	`reservation_id` INT(255) NOT NULL AUTO_INCREMENT,
	`hotel_id` INT(255) NOT NULL,
	`room_id` INT(255) NOT NULL,
	`user_id` INT(255) NOT NULL,
	`date_start` DATETIME NOT NULL,
	`date_end` DATETIME NOT NULL,
	PRIMARY KEY (`reservation_id`)
);

CREATE TABLE `type_room` (
	`type_room_id` INT(255) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`type_room_id`)
);

ALTER TABLE `hotel` ADD CONSTRAINT `hotel_fk0` FOREIGN KEY (`chain_id`) REFERENCES `chain`(`chain_id`);

ALTER TABLE `hotel` ADD CONSTRAINT `hotel_fk1` FOREIGN KEY (`country_id`) REFERENCES `country`(`country_id`);

ALTER TABLE `hotel` ADD CONSTRAINT `hotel_fk2` FOREIGN KEY (`region_id`) REFERENCES `region`(`region_id`);

ALTER TABLE `hotel` ADD CONSTRAINT `hotel_fk3` FOREIGN KEY (`city_id`) REFERENCES `city`(`city_id`);

ALTER TABLE `hotel` ADD CONSTRAINT `hotel_fk4` FOREIGN KEY (`address_id`) REFERENCES `address`(`address_id`);

ALTER TABLE `hotel` ADD CONSTRAINT `hotel_fk5` FOREIGN KEY (`facilitie_hotel_id`) REFERENCES `facilitie_hotel`(`facilitie_hotel_id`);

ALTER TABLE `hotel` ADD CONSTRAINT `hotel_fk6` FOREIGN KEY (`type_hotel_id`) REFERENCES `type_hotel`(`type_hotel_id`);

ALTER TABLE `room` ADD CONSTRAINT `room_fk0` FOREIGN KEY (`type_room_id`) REFERENCES `type_room`(`type_room_id`);

ALTER TABLE `room` ADD CONSTRAINT `room_fk1` FOREIGN KEY (`facilitie_room_id`) REFERENCES `facilitie_room`(`facilitie_room_id`);

ALTER TABLE `room` ADD CONSTRAINT `room_fk2` FOREIGN KEY (`type_room_id`) REFERENCES `type_room`(`type_room_id`);

ALTER TABLE `order` ADD CONSTRAINT `order_fk0` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`);

ALTER TABLE `reservation_room` ADD CONSTRAINT `reservation_room_fk0` FOREIGN KEY (`hotel_id`) REFERENCES `hotel`(`hotel_id`);

ALTER TABLE `reservation_room` ADD CONSTRAINT `reservation_room_fk1` FOREIGN KEY (`room_id`) REFERENCES `room`(`room_id`);

ALTER TABLE `reservation_room` ADD CONSTRAINT `reservation_room_fk2` FOREIGN KEY (`user_id`) REFERENCES `order`(`order_id`);
