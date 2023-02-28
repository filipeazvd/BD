-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Livraria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Livraria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Livraria` DEFAULT CHARACTER SET utf8 ;
USE `Livraria` ;

-- -----------------------------------------------------
-- Table `Livraria`.`Funcionário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Funcionário` (
  `idFuncionário` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Contacto` INT NOT NULL,
  PRIMARY KEY (`idFuncionário`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Livraria`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Cliente` (
  `NIF` INT NOT NULL,
  `Contacto` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Código de Postal` CHAR(8) NOT NULL,
  `Localidade` VARCHAR(30) NOT NULL,
  `Rua` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Livraria`.`Veículo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Veículo` (
  `Matrícula` CHAR(8) NOT NULL,
  `Marca` VARCHAR(20) NOT NULL,
  `Modelo` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Matrícula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Livraria`.`Encomenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Encomenda` (
  `idEncomenda` INT NOT NULL,
  `Local de Entrega` VARCHAR(100) NOT NULL,
  `Estado` VARCHAR(15) NOT NULL,
  `Tipo de Pagamento` VARCHAR(40) NOT NULL,
  `Data de Encomenda` DATE NOT NULL,
  `Data de Entrega` DATE NOT NULL,
  `Funcionário_idFuncionário` INT NOT NULL,
  `Cliente_NIF` INT NOT NULL,
  `Veículo_Matrícula` CHAR(8) NOT NULL,
  PRIMARY KEY (`idEncomenda`),
  INDEX `fk_Encomenda_Funcionário1_idx` (`Funcionário_idFuncionário` ASC) VISIBLE,
  INDEX `fk_Encomenda_Cliente1_idx` (`Cliente_NIF` ASC) VISIBLE,
  INDEX `fk_Encomenda_Veículo1_idx` (`Veículo_Matrícula` ASC) VISIBLE,
  CONSTRAINT `fk_Encomenda_Funcionário1`
    FOREIGN KEY (`Funcionário_idFuncionário`)
    REFERENCES `Livraria`.`Funcionário` (`idFuncionário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encomenda_Cliente1`
    FOREIGN KEY (`Cliente_NIF`)
    REFERENCES `Livraria`.`Cliente` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encomenda_Veículo1`
    FOREIGN KEY (`Veículo_Matrícula`)
    REFERENCES `Livraria`.`Veículo` (`Matrícula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Livraria`.`Livros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Livros` (
  `Nome` VARCHAR(45) NOT NULL,
  `Tema` VARCHAR(45) NOT NULL,
  `Autor` VARCHAR(45) NOT NULL,
  `PreçoL` FLOAT NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`Nome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Livraria`.`Encomenda_has_Livros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Encomenda_has_Livros` (
  `Encomenda_idEncomenda` INT NOT NULL,
  `Livros_Nome` VARCHAR(45) NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`Encomenda_idEncomenda`, `Livros_Nome`),
  INDEX `fk_Encomenda_has_Livros_Livros1_idx` (`Livros_Nome` ASC) VISIBLE,
  INDEX `fk_Encomenda_has_Livros_Encomenda1_idx` (`Encomenda_idEncomenda` ASC) VISIBLE,
  CONSTRAINT `fk_Encomenda_has_Livros_Encomenda1`
    FOREIGN KEY (`Encomenda_idEncomenda`)
    REFERENCES `Livraria`.`Encomenda` (`idEncomenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encomenda_has_Livros_Livros1`
    FOREIGN KEY (`Livros_Nome`)
    REFERENCES `Livraria`.`Livros` (`Nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Livraria`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`Fornecedor` (
  `idFornecedor` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFornecedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Livraria`.`fornecimento_has_livros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Livraria`.`fornecimento_has_livros` (
  `id` INT NOT NULL,
  `Livros_Nome` VARCHAR(45) NOT NULL,
  `Fornecedor_idFornecedor` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  `Data` DATE NOT NULL,
  PRIMARY KEY (`id`, `Livros_Nome`),
  INDEX `fk_Livros_has_Fornecedor_Fornecedor1_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,
  INDEX `fk_Livros_has_Fornecedor_Livros1_idx` (`Livros_Nome` ASC) VISIBLE,
  CONSTRAINT `fk_Livros_has_Fornecedor_Livros1`
    FOREIGN KEY (`Livros_Nome`)
    REFERENCES `Livraria`.`Livros` (`Nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Livros_has_Fornecedor_Fornecedor1`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `Livraria`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
