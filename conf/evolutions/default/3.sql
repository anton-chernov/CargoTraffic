# --- 0.3

# --- !Ups

CREATE TABLE IF NOT EXISTS `cargo_traffic`.`packing_list` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `issue_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dispatcher` INT(11) UNSIGNED NOT NULL,
  `departure_warehouse` INT(11) UNSIGNED NOT NULL,
  `destination_warehouse` INT(11) UNSIGNED NOT NULL,
  `status` ENUM('CREATED', 'CHECKED','TRANSPORTATION_STARTED', 'DELIVERED', 'REJECTED'),
  PRIMARY KEY (`id`),
  INDEX (`departure_warehouse` ASC),
  INDEX (`destination_warehouse` ASC),
  INDEX (`dispatcher` ASC),
  FOREIGN KEY (`dispatcher`)
  REFERENCES `cargo_traffic`.`user` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  FOREIGN KEY (`departure_warehouse`)
  REFERENCES `cargo_traffic`.`warehouse` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  FOREIGN KEY (`destination_warehouse`)
  REFERENCES `cargo_traffic`.`warehouse` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `cargo_traffic`.`vehicle_type` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `cargo_traffic`.`vehicle_fuel` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `cost` DECIMAL(10,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `cargo_traffic`.`vehicle` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `vehicle_producer` VARCHAR(250) NOT NULL DEFAULT '',
  `vehicle_model` VARCHAR(250) NOT NULL DEFAULT '',
  `license_plate` VARCHAR(250) NOT NULL,
  `products_constraint` DOUBLE(10,2) UNSIGNED NOT NULL,
  `fuel_consumption` DOUBLE(10,2) UNSIGNED NOT NULL,
  `company_id` INT(11) UNSIGNED NOT NULL,
  `vehicle_type_id` INT(11) UNSIGNED NOT NULL,
  `vehicle_fuel_id` INT(11) UNSIGNED NOT NULL,
  `deleted` BIT(1) DEFAULT FALSE,
  PRIMARY KEY (`id`),
  INDEX (`company_id` ASC),
  INDEX (`vehicle_type_id` ASC),
  INDEX (`vehicle_fuel_id` ASC),
  FOREIGN KEY (`company_id`)
  REFERENCES `cargo_traffic`.`company` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  FOREIGN KEY (`vehicle_type_id`)
  REFERENCES `cargo_traffic`.`vehicle_type` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  FOREIGN KEY (`vehicle_fuel_id`)
  REFERENCES `cargo_traffic`.`vehicle_fuel` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `cargo_traffic`.`waybill` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `departure_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `arrival_date` TIMESTAMP NULL DEFAULT NULL,
  `status` ENUM('TRANSPORTATION_STARTED', 'TRANSPORTATION_COMPLETED', 'REJECTED') NOT NULL,
  `packing_list_id` INT(11) UNSIGNED NOT NULL,
  `manager_id` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX (`packing_list_id` ASC),
  INDEX (`manager_id` ASC),
  FOREIGN KEY (`packing_list_id`)
  REFERENCES `cargo_traffic`.`packing_list` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  FOREIGN KEY (`manager_id`)
  REFERENCES `cargo_traffic`.`user` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `cargo_traffic`.`waybill_vehicle_driver` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `waybill_id` INT(11) UNSIGNED NOT NULL,
  `vehicle_id` INT(11) UNSIGNED NOT NULL,
  `driver_id` INT(11) UNSIGNED NOT NULL,
  `status` ENUM('TRANSPORTATION_STARTED', 'TRANSPORTATION_COMPLETED'),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `waybill_vehicle_driver_UNIQUE` (`waybill_id` ASC, `vehicle_id` ASC, `driver_id` ASC),
  INDEX `wvd_vehicle_fk_idx` (`vehicle_id` ASC),
  INDEX `wvd_driver_fk_idx` (`driver_id` ASC),
  CONSTRAINT `wvd_waybill_fk`
  FOREIGN KEY (`waybill_id`)
  REFERENCES `cargo_traffic`.`waybill` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `wvd_vehicle_fk`
  FOREIGN KEY (`vehicle_id`)
  REFERENCES `cargo_traffic`.`vehicle` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `wvd_driver_fk`
  FOREIGN KEY (`driver_id`)
  REFERENCES `cargo_traffic`.`user` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4;

# --- !Downs

DROP TABLE IF EXISTS `cargo_traffic`.`waybill_vehicle_driver`;
DROP TABLE IF EXISTS `cargo_traffic`.`waybill`;
DROP TABLE IF EXISTS `cargo_traffic`.`packing_list`;
DROP TABLE IF EXISTS `cargo_traffic`.`vehicle`;
DROP TABLE IF EXISTS `cargo_traffic`.`vehicle_type`;
DROP TABLE IF EXISTS `cargo_traffic`.`vehicle_fuel`;
