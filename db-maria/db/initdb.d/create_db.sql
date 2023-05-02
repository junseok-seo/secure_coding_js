
-- -----------------------------------------------------
-- Database shop
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8 ;
USE `shop` ;

-- -----------------------------------------------------
-- Table `shop`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`users` (
  `user_id` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `shop`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`products` (
  `prod_id` INT NOT NULL,
  `prod_name` VARCHAR(45) NOT NULL,
  `prod_desc` VARCHAR(1000) NOT NULL,
  `in_stock` INT NOT NULL,
  `price` INT NOT NULL,
  PRIMARY KEY (`prod_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`orders` (
  `order_id` INT NOT NULL,
  `order_num` INT NOT NULL,
  `pay_method` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `datetime` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `prod_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id_idx` (`user_id` ASC) VISIBLE,
  KEY `prod_id_idx` (`prod_id` ASC) VISIBLE,
  CONSTRAINT `order_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `order_prod_id`
    FOREIGN KEY (`prod_id`)
    REFERENCES `products` (`prod_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`cart` (
  `cart_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `prod_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `user_id_idx` (`user_id` ASC) VISIBLE,
  KEY `prod_id_idx` (`prod_id` ASC) VISIBLE,
  CONSTRAINT `cart_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `cart_prod_id`
    FOREIGN KEY (`prod_id`)
    REFERENCES `products` (`prod_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
