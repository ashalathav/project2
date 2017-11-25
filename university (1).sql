-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2017 at 04:48 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro` ()  SELECT AVG(SALARY) AS salary
FROM faculty$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `COLLEGE_ID` int(50) NOT NULL,
  `COLLEGE_NAME` varchar(50) NOT NULL,
  `COLLEGE_ADDRESS` varchar(50) NOT NULL,
  `NO_OF_STUDENTS` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`COLLEGE_ID`, `COLLEGE_NAME`, `COLLEGE_ADDRESS`, `NO_OF_STUDENTS`) VALUES
(1, 'SRI VENKATESHWARA COLLEGE OF ENGINEERING', 'BANGALORE', 1000),
(2, 'STJ INSTITUTE OF TECHNOLOGY', 'BELAGAVI', 900),
(3, 'BELLARY COLLEGE OF ENGINEERING', 'KALABURGI', 850),
(4, 'PES COLLEGE OF ENGINEERING', 'MYSORE', 700);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `COURSE_CODE` int(50) NOT NULL,
  `COURSE_NAME` varchar(50) NOT NULL,
  `NO_OF_CREDITS` int(20) NOT NULL,
  `FACULTY_ID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`COURSE_CODE`, `COURSE_NAME`, `NO_OF_CREDITS`, `FACULTY_ID`) VALUES
(0, '3', 8, 0),
(12, 'JAVA', 12, 30);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DEPARTMENT_NUMBER` int(50) NOT NULL,
  `DEPARTMENT_NAME` varchar(50) NOT NULL,
  `STUDENT_ID` int(50) NOT NULL,
  `FACULTY_ID` int(50) NOT NULL,
  `DEPARTMENT_HEAD` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DEPARTMENT_NUMBER`, `DEPARTMENT_NAME`, `STUDENT_ID`, `FACULTY_ID`, `DEPARTMENT_HEAD`) VALUES
(3, 'MECHANICALENGINEERING', 5, 6, 'FGh'),
(5, 'ELECTRONICS AND COMMUNICATION ENGINEERING', 32, 34, 'hrt'),
(10, 'COMPUTER SCIENCE OF ENGINEERING', 3, 102, 'VARSHA'),
(12, 'MECHANICALENGINEERING', 2, 215, 'PUNEETH'),
(13, 'ELECTRONICS AND COMMUNICATION ENGINEERING', 1, 320, 'MANJUNATH');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `FACULTY_ID` int(50) NOT NULL,
  `FACULTY_NAME` varchar(50) NOT NULL,
  `DESIGNATION` varchar(50) NOT NULL,
  `SALARY` double NOT NULL,
  `DEPARTMENT_NUMBER` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`FACULTY_ID`, `FACULTY_NAME`, `DESIGNATION`, `SALARY`, `DEPARTMENT_NUMBER`) VALUES
(101, '', 'HOD', 1000000, 65),
(112, '', 'HOD', 100000000, 111),
(1111, '', 'ASSISTANT PROFESSOR', 100000000, 1223);

--
-- Triggers `faculty`
--
DELIMITER $$
CREATE TRIGGER `saltrigger` BEFORE INSERT ON `faculty` FOR EACH ROW BEGIN
IF(NEW.SALARY < 1000 ) THEN
SIGNAL SQLSTATE'02000'SET MESSAGE_TEXT = 'SALARY MUST BE GREATER THAN 1000';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `STUDENT_ID` int(50) NOT NULL,
  `STUDENT_NAME` varchar(50) NOT NULL,
  `DEPARTMENT_NUMBER` int(50) NOT NULL,
  `SEX` varchar(50) NOT NULL,
  `COLLEGE_ID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`STUDENT_ID`, `STUDENT_NAME`, `DEPARTMENT_NUMBER`, `SEX`, `COLLEGE_ID`) VALUES
(1, 'jai', 4, 'male', 6),
(3, 'anu', 44, 'female', 54),
(4, 'asha', 768, 'female', 76),
(5, 'ft', 78, 'male', 43);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`COLLEGE_ID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`COURSE_CODE`) USING BTREE;

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DEPARTMENT_NUMBER`) USING BTREE;

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`FACULTY_ID`) USING BTREE;

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`STUDENT_ID`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
