-- MySQL Script generated by MySQL Workbench
-- Sat Feb 13 12:28:32 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DB` DEFAULT CHARACTER SET utf8 ;
USE `DB` ;

-- -----------------------------------------------------
-- Table `DB`.`TELEFONES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB`.`TELEFONES` (
  `idALUNO` INT NOT NULL AUTO_INCREMENT,
  ` Telefone 1` VARCHAR(45) NOT NULL,
  `telefone 2` VARCHAR(45) NULL,
  `telefone 3` VARCHAR(45) NULL,
  PRIMARY KEY (`idALUNO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB`.`ENDEREÇOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB`.`ENDEREÇOS` (
  `idENDEREÇOS` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idENDEREÇOS`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB`.`ALUNO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB`.`ALUNO` (
  `idALUNO` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(120) NOT NULL,
  `número de matricula` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(45) NOT NULL,
  `data de nascimento` VARCHAR(45) NOT NULL,
  `sexo (m ou f)` CHAR(1) NOT NULL,
  `DEPARTAMENTO` INT NOT NULL,
  `CURSO` INT NOT NULL,
  PRIMARY KEY (`idALUNO`),
  INDEX `fk_ALUNO_DEPARTAMENTO_idx` (`DEPARTAMENTO` ASC) VISIBLE,
  CONSTRAINT `fk_ALUNO_DEPARTAMENTO`
    FOREIGN KEY (`DEPARTAMENTO`)
    REFERENCES `DB`.`DEPARTAMENTO` (`código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ALUNO_TELEFONES1`
    FOREIGN KEY (`idALUNO`)
    REFERENCES `DB`.`TELEFONES` (`idALUNO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ALUNO_ENDEREÇOS1`
    FOREIGN KEY (`idALUNO`)
    REFERENCES `DB`.`ENDEREÇOS` (`idENDEREÇOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB`.`CURSO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB`.`CURSO` (
  `nome` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `DEPARTAMENTO` INT NOT NULL,
  `coordenador` VARCHAR(45) NOT NULL,
  `id curso` INT NOT NULL,
  `vice-coordenador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id curso`),
  CONSTRAINT `fk_CURSO_ALUNO1`
    FOREIGN KEY (`id curso`)
    REFERENCES `DB`.`ALUNO` (`CURSO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB`.`OFERTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB`.`OFERTA` (
  `idOFERTA` INT NOT NULL AUTO_INCREMENT,
  `PROFESSOR` INT NOT NULL,
  `SEGUNDA` VARCHAR(45) NULL,
  `TERÇA` VARCHAR(45) NULL,
  `QUARTA` VARCHAR(45) NULL,
  `QUINTA` VARCHAR(45) NULL,
  `SEXTA` VARCHAR(45) NULL,
  PRIMARY KEY (`idOFERTA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB`.`PROFESSOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB`.`PROFESSOR` (
  `idPROFESSOR` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `CPF` VARCHAR(30) NOT NULL,
  `DEPARTAMENTO` INT NOT NULL,
  `TELEFONE 1` VARCHAR(45) NOT NULL,
  `TELEFONE 2` VARCHAR(45) NULL,
  PRIMARY KEY (`idPROFESSOR`),
  CONSTRAINT `fk_PROFESSOR_OFERTA1`
    FOREIGN KEY (`idPROFESSOR`)
    REFERENCES `DB`.`OFERTA` (`PROFESSOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB`.`DISCIPLINA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB`.`DISCIPLINA` (
  `nome` VARCHAR(50) NOT NULL,
  `Desc` VARCHAR(200) NOT NULL,
  `cod` INT NOT NULL AUTO_INCREMENT,
  `Número de creditos` DECIMAL(9,2) NOT NULL,
  `DEPARTAMENTO` INT NOT NULL,
  PRIMARY KEY (`cod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB`.`DEPARTAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB`.`DEPARTAMENTO` (
  `nome` VARCHAR(50) NOT NULL,
  `código` INT NOT NULL AUTO_INCREMENT,
  `telefone` VARCHAR(25) NOT NULL,
  `centro` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`código`),
  CONSTRAINT `fk_DEPARTAMENTO_CURSO1`
    FOREIGN KEY (`código`)
    REFERENCES `DB`.`CURSO` (`DEPARTAMENTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DEPARTAMENTO_PROFESSOR1`
    FOREIGN KEY (`código`)
    REFERENCES `DB`.`PROFESSOR` (`DEPARTAMENTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DEPARTAMENTO_DISCIPLINA1`
    FOREIGN KEY (`código`)
    REFERENCES `DB`.`DISCIPLINA` (`DEPARTAMENTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
