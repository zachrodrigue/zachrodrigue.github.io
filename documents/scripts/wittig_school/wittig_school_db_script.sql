-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema wittig_school
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema wittig_school
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wittig_school` DEFAULT CHARACTER SET utf8 ;
USE `wittig_school` ;

-- -----------------------------------------------------
-- Table `wittig_school`.`Departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wittig_school`.`Departments` (
  `DepartmentID` VARCHAR(10) NOT NULL,
  `DepartmentName` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`DepartmentID`),
  UNIQUE INDEX `DepartmentName_UNIQUE` (`DepartmentName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wittig_school`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wittig_school`.`Students` (
  `StudentID` VARCHAR(10) NOT NULL,
  `Name` VARCHAR(100) NOT NULL,
  `Gender` ENUM('Male', 'Female', 'Other') NOT NULL,
  `DOB` DATE NOT NULL,
  `DepartmentID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`StudentID`),
  INDEX `fk_Students_Departments_idx` (`DepartmentID` ASC) VISIBLE,
  CONSTRAINT `fk_Students_Departments`
    FOREIGN KEY (`DepartmentID`)
    REFERENCES `wittig_school`.`Departments` (`DepartmentID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wittig_school`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wittig_school`.`Courses` (
  `CourseID` VARCHAR(10) NOT NULL,
  `CourseName` VARCHAR(100) NOT NULL,
  `DepartmentID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`CourseID`),
  INDEX `fk_Courses_Departments1_idx` (`DepartmentID` ASC) VISIBLE,
  CONSTRAINT `fk_Courses_Departments1`
    FOREIGN KEY (`DepartmentID`)
    REFERENCES `wittig_school`.`Departments` (`DepartmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wittig_school`.`Instructors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wittig_school`.`Instructors` (
  `InstructorID` VARCHAR(10) NOT NULL,
  `Name` VARCHAR(100) NOT NULL,
  `Gender` ENUM('Male', 'Female', 'Other') NOT NULL,
  `DepartmentID` VARCHAR(10) NOT NULL,
  `HireDate` DATE NOT NULL,
  `CourseID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`InstructorID`),
  INDEX `fk_Instructors_Departments1_idx` (`DepartmentID` ASC) VISIBLE,
  INDEX `fk_Instructors_Courses1_idx` (`CourseID` ASC) VISIBLE,
  CONSTRAINT `fk_Instructors_Departments1`
    FOREIGN KEY (`DepartmentID`)
    REFERENCES `wittig_school`.`Departments` (`DepartmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Instructors_Courses1`
    FOREIGN KEY (`CourseID`)
    REFERENCES `wittig_school`.`Courses` (`CourseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wittig_school`.`Enrollments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wittig_school`.`Enrollments` (
  `EnrollmentID` VARCHAR(10) NOT NULL,
  `StudentID` VARCHAR(10) NOT NULL,
  `CourseID` VARCHAR(10) NOT NULL,
  `EnrollmentDate` DATE NOT NULL,
  PRIMARY KEY (`EnrollmentID`),
  UNIQUE INDEX `Unique Key` (`StudentID` ASC, `CourseID` ASC) INVISIBLE,
  INDEX `fk_Enrollments_Courses1_idx` (`CourseID` ASC) VISIBLE,
  CONSTRAINT `fk_Enrollments_Students1`
    FOREIGN KEY (`StudentID`)
    REFERENCES `wittig_school`.`Students` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enrollments_Courses1`
    FOREIGN KEY (`CourseID`)
    REFERENCES `wittig_school`.`Courses` (`CourseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
