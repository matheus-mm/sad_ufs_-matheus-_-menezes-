-- Aluno: Matheus Mendonça Menezes
-- Matrícula: 20111006752

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema atividade07
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `atividade07` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `atividade07` ;

-- -----------------------------------------------------
-- Table `atividade07`.`fato_aulas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade07`.`fato_aulas` (
  `idfato_aulas` INT NOT NULL,
  `id_aluno` INT NOT NULL,
  `id_disciplina` INT NOT NULL,
  `id_tempo` INT NOT NULL,
  `id_curso` INT NOT NULL,
  `quant_aprovados` INT NOT NULL,
  `quant_reprovados` INT NOT NULL,
  `quant_alunos_curso` INT NOT NULL,
  `quant_disc_curso` INT NOT NULL,
  PRIMARY KEY (`idfato_aulas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atividade07`.`dim_aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade07`.`dim_aluno` (
  `id_aluno` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  PRIMARY KEY (`id_aluno`),
  CONSTRAINT `id_aluno`
    FOREIGN KEY (`id_aluno`)
    REFERENCES `atividade07`.`fato_aulas` (`idfato_aulas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atividade07`.`dim_disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade07`.`dim_disciplina` (
  `id_disciplina` INT NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_disciplina`),
  CONSTRAINT `id_disciplina`
    FOREIGN KEY (`id_disciplina`)
    REFERENCES `atividade07`.`fato_aulas` (`idfato_aulas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atividade07`.`dim_tempo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade07`.`dim_tempo` (
  `id_tempo` INT NOT NULL,
  `semestre` INT NOT NULL,
  `ano` INT NOT NULL,
  PRIMARY KEY (`id_tempo`),
  CONSTRAINT `id_tempo`
    FOREIGN KEY (`id_tempo`)
    REFERENCES `atividade07`.`fato_aulas` (`idfato_aulas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atividade07`.`dim_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atividade07`.`dim_curso` (
  `id_curso` INT NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_curso`),
  CONSTRAINT `id_curso`
    FOREIGN KEY (`id_curso`)
    REFERENCES `atividade07`.`fato_aulas` (`idfato_aulas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
