-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `new_schema1` ;
USE `new_schema1` ;

-- -----------------------------------------------------
-- Table `new_schema1`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`clients` (
  `client_id` INT NOT NULL,
  `client_name` VARCHAR(45) NULL,
  `client_address` VARCHAR(45) NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE INDEX `client_id_UNIQUE` (`client_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`orders` (
  `order_id` INT NOT NULL,
  `client_id` INT NULL,
  `order_date` VARCHAR(10) NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC) VISIBLE,
  INDEX `fk_orders_1_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_1`
    FOREIGN KEY (`client_id`)
    REFERENCES `new_schema1`.`clients` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`products` (
  `product_id` INT NOT NULL,
  `product_name` VARCHAR(45) NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`order_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`order_details` (
  `order_id` INT NULL,
  `product_id` INT NULL,
  `quantity` INT NULL,
  INDEX `fk_order_details_1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_order_details_2_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_details_1`
    FOREIGN KEY (`order_id`)
    REFERENCES `new_schema1`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_details_2`
    FOREIGN KEY (`product_id`)
    REFERENCES `new_schema1`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
