-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema 144_bill_payment_system
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 144_bill_payment_system
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `144_bill_payment_system` DEFAULT CHARACTER SET utf8 ;
USE `144_bill_payment_system` ;

-- -----------------------------------------------------
-- Table `144_bill_payment_system`.`bill_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `144_bill_payment_system`.`bill_types` (
  `bill_type_id` INT(11) NOT NULL,
  `bill_type_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`bill_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `144_bill_payment_system`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `144_bill_payment_system`.`user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `age` INT(2) NULL DEFAULT NULL,
  `gender` VARCHAR(10) NULL DEFAULT NULL,
  `contact_number` VARCHAR(10) NULL DEFAULT NULL,
  `pan` VARCHAR(15) NULL DEFAULT NULL,
  `aadhar_number` VARCHAR(15) NULL DEFAULT NULL,
  `usr_id` VARCHAR(25) NULL DEFAULT NULL,
  `password` VARCHAR(75) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `144_bill_payment_system`.`bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `144_bill_payment_system`.`bill` (
  `bill_id` INT(11) NOT NULL,
  `bill_amount` DECIMAL(10,4) NOT NULL,
  `bill_types_bill_type_id` INT(11) NOT NULL,
  `user_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`bill_id`),
  INDEX `fk_bill_bill_types1_idx` (`bill_types_bill_type_id` ASC),
  INDEX `fk_bill_user1_idx` (`user_user_id` ASC),
  CONSTRAINT `fk_bill_bill_types1`
    FOREIGN KEY (`bill_types_bill_type_id`)
    REFERENCES `144_bill_payment_system`.`bill_types` (`bill_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bill_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `144_bill_payment_system`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `144_bill_payment_system`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `144_bill_payment_system`.`role` (
  `ro_id` INT(11) NOT NULL,
  `ro_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ro_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `144_bill_payment_system`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `144_bill_payment_system`.`user_role` (
  `ur_id` INT(11) NOT NULL,
  `ur_ro_id` INT(15) NOT NULL,
  `role_ro_id` INT(11) NOT NULL,
  PRIMARY KEY (`ur_id`),
  INDEX `fk_user_has_role_user1_idx` (`ur_ro_id` ASC),
  INDEX `fk_user_role_role1_idx` (`role_ro_id` ASC),
  CONSTRAINT `fk_user_role_role1`
    FOREIGN KEY (`role_ro_id`)
    REFERENCES `144_bill_payment_system`.`role` (`ro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ur_id`
    FOREIGN KEY (`ur_ro_id`)
    REFERENCES `144_bill_payment_system`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `144_bill_payment_system`.`vendor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `144_bill_payment_system`.`vendor` (
  `vendor_name` VARCHAR(50) NOT NULL,
  `vendor_company` VARCHAR(50) NULL DEFAULT NULL,
  `vendor_type` VARCHAR(45) NULL DEFAULT NULL,
  `ve_address` VARCHAR(45) NULL DEFAULT NULL,
  `ve_country` VARCHAR(45) NULL DEFAULT NULL,
  `ve_state` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `ve_contact_number` VARCHAR(45) NULL DEFAULT NULL,
  `ve_web_site` VARCHAR(45) NULL DEFAULT NULL,
  `ve_certificate_issue_date` DATE NULL DEFAULT NULL,
  `ve_certificate_validity_date` DATE NULL DEFAULT NULL,
  `ve_year_of_establishment` INT(4) NULL DEFAULT NULL,
  `ve_payment_gateway` VARCHAR(15) NULL DEFAULT NULL,
  `bill_bill_id1` INT(11) NOT NULL,
  PRIMARY KEY (`vendor_name`),
  INDEX `fk_vendor_bill2_idx` (`bill_bill_id1` ASC),
  CONSTRAINT `fk_vendor_bill2`
    FOREIGN KEY (`bill_bill_id1`)
    REFERENCES `144_bill_payment_system`.`bill` (`bill_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
