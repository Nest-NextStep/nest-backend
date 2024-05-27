-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 27, 2024 at 11:14 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nest_capstone`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumni_opinions`
--

CREATE TABLE `alumni_opinions` (
  `opinion_id` int(11) NOT NULL,
  `opinion_name` varchar(50) NOT NULL,
  `opinions_content` varchar(300) NOT NULL,
  `major_major_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE `major` (
  `major_id` int(11) NOT NULL,
  `major_name` varchar(30) NOT NULL,
  `major_description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `potential_jobs`
--

CREATE TABLE `potential_jobs` (
  `jobs_id` int(11) NOT NULL,
  `jobs_name` varchar(50) NOT NULL,
  `jobs_salary` varchar(50) NOT NULL,
  `jobs_description` varchar(300) NOT NULL,
  `major_major_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `task_id` int(11) NOT NULL,
  `task_name` varchar(50) NOT NULL,
  `task_date` date NOT NULL,
  `task_startTime` time NOT NULL,
  `task_endTime` time NOT NULL,
  `task_duration` int(11) NOT NULL,
  `task_focusTime` int(11) NOT NULL,
  `task_breakTime` int(11) NOT NULL,
  `task_priority` varchar(7) NOT NULL,
  `task_repeat` tinyint(1) NOT NULL,
  `user_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `university_id` int(11) NOT NULL,
  `university_name` varchar(30) NOT NULL,
  `university_location` varchar(30) NOT NULL,
  `university_acreditation` char(1) NOT NULL,
  `university_link` varchar(500) NOT NULL,
  `major_major_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_major`
--

CREATE TABLE `user_major` (
  `user_user_id` int(11) NOT NULL,
  `major_major_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumni_opinions`
--
ALTER TABLE `alumni_opinions`
  ADD PRIMARY KEY (`opinion_id`),
  ADD KEY `alumni_opinions_major` (`major_major_id`);

--
-- Indexes for table `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`major_id`);

--
-- Indexes for table `potential_jobs`
--
ALTER TABLE `potential_jobs`
  ADD PRIMARY KEY (`jobs_id`),
  ADD KEY `potential_jobs_major` (`major_major_id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `task_user` (`user_user_id`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`university_id`),
  ADD KEY `university_major` (`major_major_id`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_major`
--
ALTER TABLE `user_major`
  ADD PRIMARY KEY (`user_user_id`,`major_major_id`),
  ADD KEY `user_major_major` (`major_major_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alumni_opinions`
--
ALTER TABLE `alumni_opinions`
  MODIFY `opinion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `major`
--
ALTER TABLE `major`
  MODIFY `major_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `potential_jobs`
--
ALTER TABLE `potential_jobs`
  MODIFY `jobs_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `university`
--
ALTER TABLE `university`
  MODIFY `university_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_data`
--
ALTER TABLE `user_data`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumni_opinions`
--
ALTER TABLE `alumni_opinions`
  ADD CONSTRAINT `alumni_opinions_major` FOREIGN KEY (`major_major_id`) REFERENCES `major` (`major_id`);

--
-- Constraints for table `potential_jobs`
--
ALTER TABLE `potential_jobs`
  ADD CONSTRAINT `potential_jobs_major` FOREIGN KEY (`major_major_id`) REFERENCES `major` (`major_id`);

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_user` FOREIGN KEY (`user_user_id`) REFERENCES `user_data` (`user_id`);

--
-- Constraints for table `university`
--
ALTER TABLE `university`
  ADD CONSTRAINT `university_major` FOREIGN KEY (`major_major_id`) REFERENCES `major` (`major_id`);

--
-- Constraints for table `user_major`
--
ALTER TABLE `user_major`
  ADD CONSTRAINT `user_major_major` FOREIGN KEY (`major_major_id`) REFERENCES `major` (`major_id`),
  ADD CONSTRAINT `user_major_user` FOREIGN KEY (`user_user_id`) REFERENCES `user_data` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
