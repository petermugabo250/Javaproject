-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2023 at 10:34 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `my_child`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `adminid` int(12) NOT NULL AUTO_INCREMENT,
  `usename` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminid`, `usename`, `password`) VALUES
(2, 'migabo', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `courseid` int(11) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(40) NOT NULL,
  `Qwiz` float NOT NULL,
  `Exam` float NOT NULL,
  `Total` float NOT NULL,
  `average` float NOT NULL,
  `st_id` int(12) NOT NULL,
  PRIMARY KEY (`courseid`),
  KEY `st_id` (`st_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseid`, `coursename`, `Qwiz`, `Exam`, `Total`, `average`, `st_id`) VALUES
(1, 'Mathemetics', 45, 30, 75, 37.5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE IF NOT EXISTS `parent` (
  `parent_id` int(12) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `telephone` int(12) NOT NULL,
  `identity` int(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`parent_id`, `firstname`, `lastname`, `email`, `telephone`, `identity`, `username`, `password`) VALUES
(1, 'KAMANZI', ' Joseph', 'kamaliyahoo.fr', 789786543, 119978005, 'Kamali@123', 'Kamali250');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `st_id` int(12) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `class` varchar(40) NOT NULL,
  `parentname` varchar(40) NOT NULL,
  `identity` int(16) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `parent_id` int(12) NOT NULL,
  PRIMARY KEY (`st_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`st_id`, `firstname`, `lastname`, `class`, `parentname`, `identity`, `Address`, `parent_id`) VALUES
(3, 'mbonyimana', 'Tite', 'S1', 'BIZAGWIRA Justin', 123455, 'Rutsiro', 1),
(5, 'KALISA ', 'Joh', 's2', 'KARANGWA Marcelinefff', 23456, 'Gikondo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `suggest`
--

CREATE TABLE IF NOT EXISTS `suggest` (
  `com_id` int(12) NOT NULL AUTO_INCREMENT,
  `parent_id` int(12) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`com_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `teacherid` int(12) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `telephone` int(12) NOT NULL,
  `st_id` int(12) NOT NULL,
  PRIMARY KEY (`teacherid`),
  KEY `st_id` (`st_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacherid`, `firstname`, `lastname`, `email`, `telephone`, `st_id`) VALUES
(4, 'UWERA', 'wanjye', 'dine@gmail.com', 781234567, 5),
(9, 'UWASE', 'Josse', 'kalim@gmail.com', 78654321, 3),
(10, 'UWAYO', 'Evelline', 'eva@gmail.com', 78943432, 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `student` (`st_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`parent_id`);

--
-- Constraints for table `suggest`
--
ALTER TABLE `suggest`
  ADD CONSTRAINT `suggest_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`parent_id`);

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `student` (`st_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
