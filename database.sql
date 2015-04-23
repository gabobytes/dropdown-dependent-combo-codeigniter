-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema dropdown
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dropdown
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dropdown` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `dropdown` ;

-- -----------------------------------------------------
-- Table `dropdown`.`countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dropdown`.`countries` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `namecountry` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dropdown`.`states`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dropdown`.`states` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `namestate` VARCHAR(80) NULL,
  `idcountry` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fkstatecountry_idx` (`idcountry` ASC),
  CONSTRAINT `fkstatecountry`
    FOREIGN KEY (`idcountry`)
    REFERENCES `dropdown`.`countries` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dropdown`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dropdown`.`cities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `namecity` VARCHAR(80) NULL,
  `idstate` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fkcitycountry_idx` (`idstate` ASC),
  CONSTRAINT `fkcitystate`
    FOREIGN KEY (`idstate`)
    REFERENCES `dropdown`.`states` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
