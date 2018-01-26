-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`robot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`robot` (
  `robot_id` INT(11) NOT NULL AUTO_INCREMENT,
  `serial_number` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`robot_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`role` (
  `role_id` INT(11) NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `active` INT(11) NULL DEFAULT NULL,
  `alpha` INT(11) NULL DEFAULT NULL,
  `email` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `number_of_videos_deleted` INT(11) NULL DEFAULT NULL,
  `number_of_videos_taken` INT(11) NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_role` (
  `user_id` INT(11) NOT NULL,
  `role_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`),
  INDEX `FKa68196081fvovjhkek5m97n3y` (`role_id` ASC),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y`
    FOREIGN KEY (`role_id`)
    REFERENCES `mydb`.`role` (`role_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`video` (
  `video_id` INT(11) NOT NULL,
  `creation_date` DATETIME NULL DEFAULT NULL,
  `duration` VARCHAR(255) NOT NULL,
  `image_url` VARCHAR(255) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `video_url` VARCHAR(255) NOT NULL,
  `robot_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`video_id`),
  INDEX `fk_video_robot1_idx` (`robot_id` ASC),
  INDEX `fk_video_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_video_robot1`
    FOREIGN KEY (`robot_id`)
    REFERENCES `mydb`.`robot` (`robot_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`user_robot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_robot` (
  `user_id` INT(11) NOT NULL,
  `robot_id` INT(11) NOT NULL,
  `assoc_id` INT(11) NOT NULL,
  `associated` BIT(1) NULL,
  PRIMARY KEY (`user_id`, `robot_id`, `assoc_id`),
  INDEX `fk_user_has_robot_robot1_idx` (`robot_id` ASC),
  INDEX `fk_user_has_robot_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_robot_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_robot_robot1`
    FOREIGN KEY (`robot_id`)
    REFERENCES `mydb`.`robot` (`robot_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
 
