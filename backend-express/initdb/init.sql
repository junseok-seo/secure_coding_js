-- MySQL Script generated by MySQL Workbench
-- Sun Feb 26 21:04:31 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema semall
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `semall` ;

-- -----------------------------------------------------
-- Schema semall
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `semall` DEFAULT CHARACTER SET utf8 ;
USE `semall` ;

-- -----------------------------------------------------
-- Table `semall`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `semall`.`user` ;

CREATE TABLE IF NOT EXISTS `semall`.`user` (
  `user_id` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(256) NOT NULL,
  `admin` TINYINT NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semall`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `semall`.`product` ;

CREATE TABLE IF NOT EXISTS `semall`.`product` (
  `prod_id` INT NOT NULL,
  `prod_name` VARCHAR(45) NOT NULL,
  `prod_desc` VARCHAR(100) NOT NULL,
  `prod_img` VARCHAR(100) NOT NULL,
  `in_stock` INT NOT NULL,
  `price` INT NOT NULL,
  PRIMARY KEY (`prod_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semall`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `semall`.`order` ;

CREATE TABLE IF NOT EXISTS `semall`.`order` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `prod_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `pay_method` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `datetime` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `prod_id_idx` (`prod_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `semall`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `prod_id`
    FOREIGN KEY (`prod_id`)
    REFERENCES `semall`.`product` (`prod_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semall`.`cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `semall`.`cart` ;

CREATE TABLE IF NOT EXISTS `semall`.`cart` (
  `cart_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `prod_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`cart_id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `prod_id_idx` (`prod_id` ASC) VISIBLE,
  CONSTRAINT `user_id0`
    FOREIGN KEY (`user_id`)
    REFERENCES `semall`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `prod_id0`
    FOREIGN KEY (`prod_id`)
    REFERENCES `semall`.`product` (`prod_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
