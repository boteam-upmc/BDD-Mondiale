-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bdd_mondiale
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bdd_mondiale
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bdd_mondiale` DEFAULT CHARACTER SET utf8 ;
USE `bdd_mondiale` ;

-- -----------------------------------------------------
-- Table `bdd_mondiale`.`Robots`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_mondiale`.`Robots` (
  `idRobot` INT NOT NULL AUTO_INCREMENT,
  `numSerie` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRobot`),
  UNIQUE INDEX `numSerie_UNIQUE` (`numSerie` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd_mondiale`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_mondiale`.`Users` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `alpha` INT NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `passe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC),
  UNIQUE INDEX `mail_UNIQUE` (`mail` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd_mondiale`.`Users_Robots`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_mondiale`.`Users_Robots` (
  `idUser` INT NOT NULL,
  `idRobot` INT NOT NULL,
  PRIMARY KEY (`idUser`, `idRobot`),
  INDEX `fk_Users_has_Robots_Robots1_idx` (`idRobot` ASC),
  INDEX `fk_Users_has_Robots_Users_idx` (`idUser` ASC),
  CONSTRAINT `fk_Users_has_Robots_Users`
    FOREIGN KEY (`idUser`)
    REFERENCES `bdd_mondiale`.`Users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Users_has_Robots_Robots1`
    FOREIGN KEY (`idRobot`)
    REFERENCES `bdd_mondiale`.`Robots` (`idRobot`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd_mondiale`.`Videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd_mondiale`.`Videos` (
  `idVideo` INT NOT NULL AUTO_INCREMENT,
  `urlImage` VARCHAR(45) NOT NULL,
  `urlVideo` VARCHAR(45) NOT NULL,
  `duration` VARCHAR(45) NOT NULL,
  `date` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `idUser` INT NOT NULL,
  `idRobot` INT NOT NULL,
  PRIMARY KEY (`idVideo`, `urlImage`, `urlVideo`, `idUser`, `idRobot`),
  INDEX `fk_Videos_Users1_idx` (`idUser` ASC),
  INDEX `fk_Videos_Robots1_idx` (`idRobot` ASC),
  CONSTRAINT `fk_Videos_Users1`
    FOREIGN KEY (`idUser`)
    REFERENCES `bdd_mondiale`.`Users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Videos_Robots1`
    FOREIGN KEY (`idRobot`)
    REFERENCES `bdd_mondiale`.`Robots` (`idRobot`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
